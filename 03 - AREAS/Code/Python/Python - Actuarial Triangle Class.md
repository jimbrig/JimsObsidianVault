---
Date: 2023-07-17
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/Python", "#Topic/Dev/Python", "#Topic/Actuarial"]
Alias: [ "Actuarial Triangle Class" ]
---

# Actuarial Triangle Class

> [!SOURCE] Sources
> - *[Triangle/triangle/triangle.py at main · aaweaver-actuary/Triangle (github.com)](https://github.com/aaweaver-actuary/Triangle/blob/main/triangle/triangle.py)*

## Contents

[TOC]

## Code

*Link: <<% tp.file.cursor(2) %>>*

```python
"""
This module implements the Triangle class, which is used to store and manipulate
triangle data.

This class also includes methods for perfoming basic loss triangle analysis using
the chain ladder method.
"""

import os
import json
import numpy as np
import pandas as pd
from datetime import datetime

from dataclasses import dataclass
from typing import Optional, Any

from openpyxl.utils import range_to_tuple

triangle_type_aliases = ["paid", "reported", "case", "incurred"]


@dataclass
class Triangle:
    """
    Create a `Triangle` object. The `Triangle` object is used to store and manipulate
    triangle data.
    Attributes:
    -----------
    id : str
        The type of triangle the object represents - paid loss, reported loss, etc.
    tri : pd.DataFrame, default=None
        The triangle data. Must be a pandas DataFrame with:
            1. The origin period set as the index.
            2. The development periods set as the column names.
            3. The values set as the values in the DataFrame.
        If any of these conditions are not met, the triangle data will be set to None.
    triangle : pd.DataFrame, default=None
        Alias for `tri`.
    acc : pd.Series, default=None
        The accident period labels. Default is None, in which case the accident period
        labels will be set to the index of the triangle data.
    dev : pd.Series, default=None
        The development period labels. Default is None, in which case the development
        period labels will be set to the column names of the triangle data.
    cal : pd.DataFrame, default=None
        The calendar period labels. Default is None, in which case the calendar period
        labels will be calculated from the acc and dev attributes.
    n_acc : int, default=None
        The number of accident periods in the triangle data. Default is None, in which
        case the number of accident periods will be calculated from `tri.shape[0]`.
    n_dev : int, default=None
        The number of development periods in the triangle data. Default is None, in
        which case the number of development periods will be calculated from
        `tri.shape[1]`.
    n_cal : int, default=None
        The number of calendar periods in the triangle data. Default is None, in which
        case the number of calendar periods will be calculated from the number of unique
        calendar periods in the `cal` attribute.
    n_vals : int, default=3
        The number of diagonals used for time-series validation. Default is 3, which
        corresponds to the 3 most recent diagonals. If `n_vals` is set to 0 or None, no
        time-series validation will be performed.
    incr_triangle : pd.DataFrame, default=None
        The incremental triangle data. Default is None, in which case the incremental
        triangle data will be calculated from the triangle data.
    X_base : pd.DataFrame, default=None
        The design matrix for the "base" model, eg a model with accident and development
        periods as features, and no calendar period effect. Default is None, in which
        case the design matrix will be calculated from the triangle data.
    y_base : np.ndarray, default=None
        The response vector for the "base" model.
    X_base_train : pd.DataFrame, default=None
        The design matrix for the "base" model.
    y_base_train : np.ndarray, default=None
        The response vector for the "base" model.
    X_base_forecast : pd.DataFrame, default=None
        The design matrix for the "base" model.
    y_base_forecast : np.ndarray, default=None
        The response vector for the "base" model.
    """

    id: str = None
    tri: pd.DataFrame = None
    tri0: pd.DataFrame = None
    triangle: pd.DataFrame = None
    tri_exposure: pd.Series = None
    acc: pd.Series = None
    dev: pd.Series = None
    cal: pd.Series = None
    n_acc: int = None
    n_dev: int = None
    n_cal: int = None
    n_vals: int = 3
    incr_triangle: pd.DataFrame = None
    X_base: pd.DataFrame = None
    y_base: pd.Series = None
    exposure: pd.Series = None
    X_base_train: pd.DataFrame = None
    y_base_train: pd.Series = None
    exposure_train: pd.Series = None
    X_base_forecast: pd.DataFrame = None
    y_base_forecast: pd.Series = None
    exposure_forecast: pd.Series = None
    has_cum_model_file: bool = False
    is_cum_model: Any = None

    def __post_init__(self) -> None:
        """
        Reset triangle id if it is not allowed.

        Parameters:
        -----------
        None
        Returns:
        --------
        None
        """
        # if a triangle was passed in:
        if self.tri is not None:
            # convert the origin to a datetime object
            self.convert_origin_to_datetime()

            # set the acc, dev, cal attributes
            self.acc = self.tri.index.to_series().reset_index(drop=True)
            self.dev = self.tri.columns.to_series().reset_index(drop=True)
            self.acc.name = "accident_period"
            self.dev.name = "development_period"

            self.tri.index = self.acc
            self.tri.columns = self.dev
            self.tri.index.name = "accident_period"
            self.tri.columns.name = "development_period"
            self.triangle = self.tri

            self.ay = self.acc.dt.year.astype(int)
            self.ay.name = "accident_year"

            self.aq = self.acc.dt.quarter.astype(int)
            self.aq.name = "accident_quarter"

            self.am = self.acc.dt.month.astype(int)
            self.am.name = "accident_month"

            # set the n_rows and n_cols attributes
            self.n_rows = self.tri.shape[0]
            self.n_cols = self.tri.shape[1]
            self.n_dev = self.n_cols
            self.n_acc = self.n_rows

            # set frequency of triangle rows
            self._set_frequency()

            # set the cal attribute
            self.cal = self.getCalendarIndex()
            self.cur_cal = self.getCurCalendarIndex()

            # set the n_cal attribute
            self.n_cal = self.cal.max().max() - self.cal.min().min() + 1

        # convert triangle data to float
        if self.tri is not None:
            for c in self.tri.columns:
                try:
                    self.tri[c] = self.tri[c].astype(float)
                except TypeError:
                    self.tri[c] = (
                        self.tri[c]
                        .str.replace(",", "")
                        .str.replace(")", "")
                        .str.replace("(", "-")
                        .astype(float)
                    )

            # set the incr_triangle attribute
            if self.incr_triangle is None:
                self.incr_triangle = self.cum_to_inc(_return=True)

        # create alias for self.tri as self.df that matches the triangle as it is
        # updated, and does not need to be updated separately
        self.df = self.tri
        self.base_linear_model()
        self.positive_y = self.y_base.loc[self.y_base > 0].index.values
        self.is_observed = self.X_base.is_observed
        self.tri0 = self.tri.round(0)

        # if no exposure vector is passed, set all exposures to 1
        if self.exposure is None:
            self.exposure = pd.Series(1, index=self.acc.drop_duplicates())

    def __repr__(self) -> str:
        return self.tri.__repr__()

    def __str__(self) -> str:
        return self.tri.__str__()

    def _handle_missing_id(self):
        """
        Handle a missing id by assigning a random id.
        """
        # If the id is None, assign a random id
        if self.id is None:
            # create random triangle id
            self.id = f"triangle_{np.random.randint(10000, 99999)}"

    def set_id(self, id: str) -> None:
        """
        Set the id of the triangle.
        Parameters:
        -----------
        `id`: `str`
            The id of the triangle.
        Returns:
        --------
        `None`
        """
        if id is None:
            self._handle_missing_id()
        else:
            # ensure that the id is a string
            if not isinstance(id, str):
                raise TypeError("The id must be a string.")

            # reformat the id
            self.id = self.id.lower().replace(" ", "_")

            # reset the id if it is not allowed
            if self.id not in triangle_type_aliases:
                self.id = None
                self._handle_missing_id()

            # ensure the id is allowed
            if id.lower().replace(" ", "_") in triangle_type_aliases:
                self.id = id.lower().replace(" ", "_")
            else:
                print(f"The id {id} is not allowed. It must be one of the following:")
                for alias in triangle_type_aliases:
                    print(f"  - {alias}")
                print()
                raise ValueError("The id is not allowed.")

    def convert_origin_to_datetime(self) -> None:
        """
        Convert the origin to a datetime object.
        Test the origin column(s):
        1. If the origin column(s) are a single column:
            1. Is the column either integers or a column that can be
               converted to integers? (eg. a string column with
               integers in it)
                    1. Can the values be converted to 4-digit
                       integers? If so, convert the YEARS to datetime
                       objects, assuming the month is January and the
                       day is the first day of the month.
                    2. Can the values be converted to 2-digit
                       integers? If so, convert the 2-digit YEARS to
                       datetime objects, assuming the month is January
                       and the day is the first day of the month.
                    3. Can the values be converted to 5-digit
                       integers? If so, convert the 5-digit Year-Quarter
                       values to datetime objects, assuming the quarter
                       is the 5th digit, the year is the first 4 digits,
                       and the month is the first month of the quarter,
                       first day of the month.
                    4. Can the values be converted to 6-digit
                       integers? If so, convert the 6-digit Year-Month
                       values to datetime objects, assuming the month
                       is the last 2 digits, the year is the first 4
                       digits, and the day is the first day of the
                       month.
            2. Is the column a string that cannot be converted to
               integers? (eg. a string column with non-integer values
               such as 2023Q1 or 2023-01, etc)
                1. does the string contain a dash (-) but does not
                   contain a Q or a q? If so, assume that
                   the dash is separating the year from the month, but
                   do not assume either the year or the month is first.
                   For example, 2023-01 and 01-2023 are both valid. Find
                   the dash, split the string on the dash, and convert
                   both pieces on either side of the dash to integers.
                   If both pieces can be converted to integers, then
                   the month will be the piece that is between 1 and 12,
                   and the year will be the other one. If both the year
                   and the month are between 1 and 12, then raise an
                   error telling the user that the origin column is
                   ambiguous and print out a message telling the user
                   why the origin column is ambiguous.
                   Examples:
                   --------
                     1. 2023-01 -> year = 2023, month = 1, day = 1
                     2. 01-2023 -> year = 2023, month = 1, day = 1
                     3. 2023-13 -> Raise an error because neither the
                                   year nor the month are between 1
                                   and 12.
                     4. 3-23    -> year = 2023, month = 3, day = 1
                     5. 23-10   -> year = 2023, month = 10, day = 1
                     6. 2001-1  -> year = 2001, month = 1, day = 1
                     7. 1-2001  -> year = 2001, month = 1, day = 1
                     8. 10-01   -> Raise an error because the origin
                                   column is ambiguous.
                2. does the string contain a slash (/)? If so, follow the
                   same steps above, and try to convert both pieces to
                   integers.
                3. does the string contain a Q or a q but no dash? If so,
                   assume the q is separating the year from the quarter,
                   but do not assume either the year or the quarter is
                   first. For example, 2023Q1 and Q1-2023 are both valid.
                   Find the Q or q, split the string on the Q or q, and
                   convert both pieces on either side of the Q or q to
                   integers. Find the integer that is between 1 and 4,
                   and assume that is the quarter. Find the other integer
                   that is not between 1 and 4, and assume that is the
                   year. If both the year and the quarter are between 1
                   and 4, then raise an error telling the user that the
                   origin column is ambiguous and print out a message
                   telling the user why the origin column is ambiguous.
                     Examples:
                     --------
                     1. 2023Q1 -> year = 2023, quarter = 1, month = 1, day = 1
                     2. 3q2023 -> year = 2023, quarter = 3, month = 7, day = 1
                     3. 22q4   -> year = 2022, quarter = 4, month = 10, day = 1
                     4. 2023q5 -> Raise an error because neither the year
                                  nor the quarter are between 1 and 4.
                     5. 2023q0 -> Raise an error because neither the year
                                  nor the quarter are between 1 and 4.
                     6. 2q2002 -> year = 2002, quarter = 2, month = 4, day = 1
                     7. 2q02   -> Raise an error because the origin column
                                  is ambiguous.
                4. does the string contain a Q or a q and a dash? If so,
                   assume the dash is separating the year from the quarter,
                   and that the Q or q is closer to the quarter than to the
                   year.
                     Examples:
                     --------
                     1. 2023-Q1 -> year = 2023, quarter = 1, month = 1, day = 1
                     2. 2021-2q -> year = 2021, quarter = 1, month = 1, day = 1
                     3. 3q-03   -> year = 2003, quarter = 3, month = 7, day = 1
                     4. q4-04   -> year = 2004, quarter = 4, month = 10, day = 1
        Parameters:
        -----------
        None
        Returns:
        --------
        None
        """
        import re
        import pandas as pd

        # Function to convert a given year, month, and day to a datetime object
        def convert_to_datetime(year, month, day=1):
            # Using pandas to_datetime function to create a datetime object
            # with the provided year, month, and day
            return pd.to_datetime(f"{year}-{month}-{day}", format="%Y-%m-%d")

        # Function to convert origin values to datetime objects
        def convert_origin_to_datetime(origin):
            try:
                # Attempt to convert the origin value to an integer
                value = int(origin)

                # Check if the value is a 4-digit integer
                if 1000 <= value <= 9999:
                    # Convert the 4-digit integer to a datetime object
                    # assuming January as the month and the first day of the month
                    return convert_to_datetime(value, 1)
                # Check if the value is a 2-digit integer
                elif 0 <= value <= 99:
                    # Convert the 2-digit integer to a datetime object
                    # assuming January as the month and the first day of the month
                    return convert_to_datetime(value + 2000, 1)
                # Check if the value is a 5-digit integer
                elif 10000 <= value <= 99999:
                    # Split the value into a 4-digit year and 1-digit quarter
                    year, quarter = divmod(value, 10)

                    # Convert the year-quarter value to a datetime object
                    # assuming the quarter is the last digit, the year is
                    # the first 4 digits, and the month is the first month
                    # of the quarter
                    return convert_to_datetime(year, quarter * 3 - 2)
                # Check if the value is a 6-digit integer
                elif 100000 <= value <= 999999:
                    # Split the value into a 4-digit year and 2-digit month
                    year, month = divmod(value, 100)

                    # Convert the year-month value to a datetime object
                    # assuming the month is the last 2 digits, the year is
                    # the first 4 digits, and the day is the first day of the month
                    return convert_to_datetime(year, month)
            except:
                # If the origin value cannot be converted to an integer, continue
                # to the string processing section below
                pass

            # Function to extract year, month, and quarter from a string
            # using a specified delimiter
            def get_year_month_quarter(s, delimiter):
                # Split the input string using the provided delimiter
                values = s.split(delimiter)

                # Attempt to convert both parts of the string to integers
                try:
                    a, b = int(values[0]), int(values[1])
                except ValueError:
                    # If either part of the string cannot be converted to
                    # an integer, return None values
                    return None, None, None

                # Check if the first part is a month and the second part is a year
                if 1 <= a <= 12 and 1000 <= b <= 9999:
                    return b, a, None
                # Check if the first part is a year and the second part is a month
                elif 1000 <= a <= 9999 and 1 <= b <= 12:
                    return a, b, None
                # Check if the first part is a quarter and the second part is a year
                elif 1 <= a <= 4 and 1000 <= b <= 9999:
                    return b, None, a
                # Check if the first part is a year and the second part is a quarter
                elif 1000 <= a <= 9999 and 1 <= b <= 4:
                    return a, None, b

                # If neither of the above conditions are met, raise a ValueError
                # indicating that the origin column is ambiguous
                raise ValueError("Ambiguous origin column")

            # Determine which type of string the origin is and convert
            # it accordingly
            if "-" in origin and "Q" not in origin.upper():
                # If the origin contains a dash and no 'Q', assume the dash
                # separates the year and month
                year, month, _ = get_year_month_quarter(origin, "-")
            elif "/" in origin:
                # If the origin contains a slash, assume it separates the year
                # and month
                year, month, _ = get_year_month_quarter(origin, "/")
            elif "Q" in origin.upper() and "-" not in origin:
                # If the origin contains 'Q' and no dash, assume the 'Q' separates
                # the year and quarter
                origin = re.sub("[-qQ]", "", origin)
                year, _, quarter = get_year_month_quarter(origin, "Q")
                if quarter:
                    month = quarter * 3 - 2
            elif "Q" in origin.upper() and "-" in origin:
                # If the origin contains 'Q' and a dash, assume the dash separates
                # the year and quarter
                origin = origin.upper().replace("Q", "")
                year, _, quarter = get_year_month_quarter(origin, "-")
                if quarter:
                    month = quarter * 3 - 2

            # If both year and month values are found, convert them to a
            # datetime object
            if year and month:
                return convert_to_datetime(year, month)

            # If none of the above conditions are met, raise a ValueError
            # indicating that the origin column is invalid
            raise ValueError("Invalid origin column")

        # Map the convert_origin_to_datetime function to each value in the index
        # and replace the original index with the new datetime index
        self.tri.index = self.tri.index.map(convert_origin_to_datetime)

    def _set_frequency(self) -> None:
        """
        Sets the .frequency attribute by checking if the origin column is in
        monthly, quarterly, or annual frequency:
            1. If all of the origin values have a month of 1, the origin column is
            assumed to be in annual frequency.
            2. Elif all of the origin values have a month of 1, 4, 7, or 10, the
            origin column is assumed to be in quarterly frequency.
            3. Else, the origin column is assumed to be in monthly frequency.
        """

        # Check if the index is a datetime index
        if not isinstance(self.tri.index, pd.DatetimeIndex):
            # If not, call the convert_year_to_datetime method
            self.convert_year_to_datetime()

        # Check for annual frequency
        if all(value.month == 1 for value in self.tri.index):
            self.frequency = "A"
        # Check for quarterly frequency
        elif all(value.month in [1, 4, 7, 10] for value in self.tri.index):
            self.frequency = "Q"
        # Assume monthly frequency
        else:
            self.frequency = "M"

    def get_formatted_dataframe(self, df=None) -> pd.DataFrame:
        """
        Returns a new DataFrame with the index formatted as strings based on the
        frequency attribute:
            - Annual frequencies are formatted as YYYY.
            - Quarterly frequencies are formatted as YYYYQ#.
            - Monthly frequencies are formatted as YYYY-MM.
        Parameters:
        -----------
        df : pd.DataFrame
            If provided, the `df` DataFrame will be formatted and returned.
            If not provided, the `Triangle.tri` DataFrame will be formatted
            and returned.
            Default is None, which will format the `Triangle.tri` DataFrame.
        """
        if df is None:
            # Make a copy of the DataFrame to avoid modifying the original
            formatted_df = self.tri.copy()
        else:
            # Make a copy of the DataFrame to avoid modifying the original
            formatted_df = df.copy()

        # Format the index based on the frequency attribute
        if self.frequency == "A":
            formatted_df.index = self.tri.index.strftime("%Y")
        elif self.frequency == "Q":
            formatted_df.index = self.tri.index.to_period("Q").strftime("%YQ%q")
        else:
            formatted_df.index = self.tri.index.strftime("%Y-%m")

        return formatted_df

    def to_json(self):
        """
        Converts the triangle object to json, to prepare for an API call
        """
        # start from a dictionary
        out_dict = {
            "id": self.id if self.id is not None else None,
            # "tri": self.tri.to_dict() if self.tri is not None else None,
            # "triangle": self.triangle.to_dict() if self.triangle is not None else None,
            # "incrTriangle": self.incr_triangle.to_dict()
            # if self.incr_triangle is not None
            # else None,
            "XBase": self.X_base.to_dict() if self.X_base is not None else None,
            "yBase": self.y_base.tolist() if self.y_base is not None else None,
            "XBaseTrain": self.X_base_train.to_dict()
            if self.X_base_train is not None
            else None,
            "yBaseTrain": self.y_base_train.tolist()
            if self.y_base_train is not None
            else None,
            "XBaseForecast": self.X_base_forecast.to_dict()
            if self.X_base_forecast is not None
            else None,
            "yBaseForecast": self.y_base_forecast.tolist()
            if self.y_base_forecast is not None
            else None,
            "hasCumModelFile": self.has_cum_model_file
            if self.has_cum_model_file is not None
            else None,
            "isCumModel": self.is_cum_model if self.is_cum_model is not None else None,
            "nCols": self.n_cols if self.n_cols is not None else None,
            "nRows": self.n_rows if self.n_rows is not None else None,
        }

        # convert datetime index to string
        if self.tri is not None:
            temp_tri = self.tri.copy()
            temp_tri.index = temp_tri.index.strftime("%Y-%m")
            out_dict["tri"] = temp_tri.to_dict() if self.tri is not None else None
        else:
            out_dict["tri"] = None

        if self.triangle is not None:
            temp_triangle = self.triangle.copy()
            temp_triangle.index = temp_triangle.index.strftime("%Y-%m")
            out_dict["triangle"] = temp_triangle.to_dict()
        else:
            out_dict["triangle"] = None

        if self.incr_triangle is not None:
            temp_incr_triangle = self.incr_triangle.copy()
            temp_incr_triangle.index = temp_incr_triangle.index.strftime("%Y-%m")
            out_dict["incrTriangle"] = temp_incr_triangle.to_dict()
        else:
            out_dict["incrTriangle"] = None

        # convert to json
        out_json = json.dumps(out_dict)

        return out_json

    @classmethod
    def from_dataframe(cls, df: pd.DataFrame, id: Optional[str] = None) -> "Triangle":
        """
        Create a Triangle object from a pandas DataFrame.

        Parameters:
        -----------
        id : str
            The id of the triangle.
        df : pd.DataFrame
            The triangle data. Must be a pandas DataFrame with:
                1. The origin period set as the index.
                2. The development periods set as the column names.
                3. The values set as the values in the DataFrame.
            If any of these conditions are not met, the triangle data will
            be set to None.
        Returns:
        --------
        Triangle
            A Triangle object with data loaded from the DataFrame.
        """
        # Create and return a Triangle object
        return cls(id=id, tri=df, triangle=df)

    @classmethod
    def from_clipboard(
        cls, origin_columns: int = 1, headers: list = None, id: Optional[str] = None
    ) -> "Triangle":
        """
        Create a Triangle object from data copied to the clipboard.

        Parameters:
        -----------
        id : str
            The id of the triangle. Default is None, which will assign a
            randomly-generated ID.
        origin_columns : int
            The number of columns used for the origin period. Default is 1.
        headers : list
            List of column names to use. Default is None, in which case the
            first row will be repurposed as the headers.

        Returns:
        --------
        Triangle
            A Triangle object with data loaded from the clipboard.
        """
        # Read data from the clipboard, assuming the first row is the development period
        # and the first `origin_columns` columns should make up either an index or a
        # multi-index for the origin period in the resulting DataFrame
        df = pd.read_clipboard(header=None)

        # set the first row to be the headers
        df.columns = df.iloc[0]

        # since it is included as the column names, drop the first row
        df.drop(index=0, inplace=True)

        # set the first `origin_columns` columns to be the index
        or_col = df.columns.tolist()[:origin_columns]
        df.set_index(or_col, inplace=True)

        # convert remaining columns to numeric
        for c in df.columns.tolist():
            df[c] = (
                df[c]
                .astype(str)
                .str.replace(",", "")
                .str.replace(".", "")
                .str.replace(" ", "")
                .astype(float)
            )

        df.index = df.index.astype(str).astype(int)
        # print(df.index)

        # Create and return a Triangle object
        return cls(id=id, tri=df, triangle=df)

    @classmethod
    def from_csv(
        cls, filename: str, origin_columns: int = 1, id: Optional[str] = None
    ) -> "Triangle":
        """
        Create a Triangle object from data in a CSV file.
        Parameters:
        -----------
        filename : str
            The name of the CSV file containing the triangle data.
        id : str, optional
            The id of the triangle.
        origin_columns : int
            The number of columns used for the origin period. Default is 1.
        Returns:
        --------
        Triangle
            A Triangle object with data loaded from the CSV file.
        """
        # Read data from the CSV file
        df = pd.read_csv(
            filename, header=0, index_col=[i for i in range(origin_columns)]
        )

        # Create and return a Triangle object
        return cls(id=id, tri=df, triangle=df)

    @classmethod
    def from_excel(
        cls,
        filename: str,
        origin_columns: int,
        id: Optional[str] = None,
        sheet_name: Optional[str] = None,
        sheet_range: Optional[str] = None,
    ) -> "Triangle":
        """
        Create a Triangle object from data in an Excel file.
        Parameters:
        -----------
        filename : str
            The name of the Excel file containing the triangle data.
        id : str
            The id of the triangle.
        origin_columns : int
            The number of columns used for the origin period.
        sheet_name : str, optional
            The name of the sheet in the Excel file containing the triangle data. If not provided, the first sheet will be used.
        sheet_range : str, optional
            A string containing the range of cells to read from the Excel file. The range should be in the format "A1:B2".
        Returns:
        --------
        Triangle
            A Triangle object with data loaded from the Excel file.
        """
        # Read data from the Excel file
        if sheet_range:
            # If a range is provided, read only the specified range
            _, idx = range_to_tuple(f"'{sheet_name}'!{sheet_range}")
            c1, r1, c2, r2 = idx

            # read in the subset of the excel file
            df = pd.read_excel(filename, header=None, sheet_name=sheet_name).iloc[
                (r1 - 1) : (r2), (c1 - 1) : (c2)
            ]

            # set the column names as the first row
            df.columns = df.iloc[0]
            df.columns.name = None

            # # drop the first row
            df.drop(df.index[0], inplace=True)
        else:
            # If no range is provided, read the entire sheet
            df = pd.read_excel(filename, header=0, sheet_name=sheet_name)

        # Set the origin period as the index
        df.set_index(df.columns.tolist()[:origin_columns], inplace=True)

        # round to a single digit
        df = df.round(1)

        # re-sort the columns
        df.sort_index(axis=1, inplace=True)

        # Create and return a Triangle object
        return cls(id=id, tri=df.round(1), triangle=df.round(1))

    @classmethod
    def from_mack_1994(cls) -> "Triangle":
        """
        Create a Triangle object from the sample triangle in the Mack 1994
        paper, "Measuring the Variability of Chain Ladder Reserve Estimates"

        (see https://www.casact.org/sites/default/files/2021-03/7_Mack_1994.pdf)

        Parameters:
        -----------
        None

        Returns:
        --------
        Triangle
            A Triangle object with data loaded from the Taylor Ashe sample data.
        """
        # Get the current directory
        current_dir = os.path.dirname(os.path.realpath(__file__))

        # Construct the file path to the sample data
        data_file = os.path.join(current_dir, "data", "mack1994.csv")

        # Read the data from the CSV file
        df = pd.read_csv(data_file, header=0, index_col=0)

        # Create and return a Triangle object
        return cls(id="gl_rpt_loss", tri=df, triangle=df)

    @classmethod
    def from_taylor_ashe(cls) -> "Triangle":
        """
        Create a Triangle object from the Taylor Ashe sample data.
        Parameters:
        -----------
        None
        Returns:
        --------
        Triangle
            A Triangle object with data loaded from the Taylor Ashe sample data.
        """
        # Get the current directory
        current_dir = os.path.dirname(os.path.realpath(__file__))

        # Construct the file path to the sample data
        data_file = os.path.join(current_dir, "data", "taylorashe.csv")

        # Read the data from the CSV file
        df = pd.read_csv(data_file, header=0, index_col=0)

        # Create and return a Triangle object
        return cls(id="paid_loss", tri=df, triangle=df)

    @classmethod
    def from_dahms(cls) -> tuple:
        """
        Create a Triangle object from the Dahms sample data. This sample data contains
        both a reported and a paid triangle, so this method returns a tuple containing
        both triangles.

        Return is of the form (rpt, paid).

        Parameters:
        -----------
        None

        Returns:
        --------
        tuple[Triangle, Triangle]
            A tuple containing a Triangle object with data loaded from the reported
            triangle, and a Triangle object with data loaded from the paid triangle.
        """
        # Get the current directory
        current_dir = os.path.dirname(os.path.realpath(__file__))

        # Construct the file path to the sample data
        data_file = os.path.join(current_dir, "data", "dahms reserve triangles.xlsx")

        # Read the data from the CSV file
        paid = cls.from_excel(
            data_file,
            sheet_name="paid",
            id="paid_loss",
            origin_columns=1,
            sheet_range="a1:k11",
        )
        rpt = cls.from_excel(
            data_file,
            sheet_name="rpt",
            id="rpt_loss",
            origin_columns=1,
            sheet_range="a1:k11",
        )

        # Create and return a Triangle object
        return rpt, paid

    # GETTERS
    def getTriangle(self) -> pd.DataFrame:
        """
        Return the formatted triangle as a dataframe.

        Returns:
        --------
        pd.DataFrame
            The triangle data, formatted as a dataframe, and with the origin period
            formatting applied
        """
        # check that the index is a datetime index, and if not, convert it
        if not isinstance(self.tri.index, pd.DatetimeIndex):
            self.convert_origin_to_datetime()

        # return the triangle, formatted as a dataframe with the origin period
        # formatting applied
        return self.get_formatted_dataframe()

    def getCalendarIndex(self) -> pd.DataFrame:
        """
        Calculates a calendar index based on the number of months since the
        start of the origin period.
        """
        # same shape as original triangle
        cal = self.tri.copy()

        # start by setting each cell equal to the number of months since year 0
        for c in cal.columns.tolist():
            cal[c] = cal.index.year.astype(int) - cal.index.year.astype(int).min()
            +(cal.index.month.astype(int) - cal.index.month.astype(int).min())
            # then add the column name as an integer
            cal[c] += int(c) / cal.columns.to_series().astype(int).min()

        return cal.astype(int)

    def getCurCalendarIndex(self) -> int:
        """
        Returns the current calendar period.
        """
        # start with calendarIndex
        cal_idx = self.getCalendarIndex()

        # get the first column
        col1 = cal_idx.iloc[:, 0]

        # return the max value in the current year column
        cur_calendar_index = col1.max()

        return cur_calendar_index

    def cum_to_inc(
        self, cum_tri: pd.DataFrame = None, _return: bool = False
    ) -> pd.DataFrame:
        """
        Convert cumulative triangle data to incremental triangle data.

        Parameters:
        -----------
        cum_tri: pd.DataFrame
            The cumulative triangle data. Default is None, in which case
            the triangle data from the Triangle object is used.
        _return: bool
            If True, return the incremental triangle data. Default is False.

        Returns:
        --------
        inc_tri: pd.DataFrame
            The incremental triangle data.
        """
        # get the cumulative triangle data
        if cum_tri is None:
            cum_tri = self.triangle

        # get the cumulative triangle data
        inc_tri = cum_tri - cum_tri.shift(1, axis=1, fill_value=0)

        # set the incremental triangle data
        self.incr_triangle = inc_tri

        # return the incremental triangle data
        if _return:
            return inc_tri

    # Basic triangle methods
    def _ata_tri(self) -> None:
        """
        Calculate the age-to-age factor triangle from the triangle data.

        Parameters:
        -----------
        None

        Returns:
        --------
        None
        """
        # instantiate the ata triangle (same shape as the triangle data)
        ata = pd.DataFrame(
            np.zeros(self.tri.shape), index=self.tri.index, columns=self.tri.columns
        )

        # if there are any values of 0 in the triangle data, set them to nan
        self.tri[self.tri == 0] = np.nan

        # loop through the columns in the triangle (excl. the last column)
        for i in range(self.tri.shape[1] - 1):
            # calculate the age-to-age factor
            ata.iloc[:, i] = self.tri.iloc[:, i + 1] / self.tri.iloc[:, i]

        # set the last column of the ata triangle to nan
        ata.iloc[:, self.tri.shape[1] - 1] = np.nan

        return ata

    def _vwa(self, n: int = None, tail: float = 1.0) -> pd.DataFrame:
        """
        Calculate the volume weighted average (VWA) of the triangle data.

        Parameters:
        -----------
        n: int
            The number of periods to use in the VWA calculation. If None, use
            all available periods.
        tail: float
            The tail factor to use in the VWA calculation. Default is 1.0, or
            no tail factor.

        Returns:
        --------
        vwa: pandas dataframe
            The VWA triangle data.
        """
        # instantiate the vwa results - a series whose length is equal to the number of
        # columns in the triangle data, with the index set to the column names
        vwa = pd.Series(
            np.zeros(self.tri.shape[1]), index=self.tri.columns, dtype=float
        )

        # if n is None, use all available periods
        is_all = n is None

        # need a value for n in the loop below
        n2 = n if n is not None else self.tri.shape[0]

        # loop through the columns in the triangle data (excl. the last column)
        for i in range(self.tri.shape[1] - 1):
            next_col = self.tri.iloc[:, i + 1]
            cur_col = self.tri.iloc[:, i]
            if is_all or next_col.dropna().shape[0] <= n2:
                num = next_col.sum()
                den = cur_col.mask(next_col.isna(), np.nan).sum()
            else:
                num = next_col.dropna().tail(n).sum()
                den = cur_col.mask(next_col.isna(), np.nan).dropna().tail(n).sum()

            vwa.iloc[i] = num / den

        # set the last column of the vwa results to the tail factor
        vwa.iloc[self.tri.shape[1] - 1] = tail

        return vwa

    def _ave_ata(self, n: int = None, tail: float = 1.0) -> pd.Series:
        """
        Calculate the average age-to-age factor (Ave-ATA) of the triangle data.

        Parameters:
        -----------
        n: int
            The number of periods to use in the Ave-ATA calculation. If None, use
            all available periods.
        tail: float
            The tail factor to use in the Ave-ATA calculation. Default is 1.0, or
            no tail factor.

        Returns:
        --------
        ave_ata: pd.Series
            The Ave-ATA triangle data. Shape is the same as the number of columns
            in the triangle data, with the index set to the column names.
        """
        # instantiate the ave-ata results - a series whose length is equal to the number of
        # columns in the triangle data, with the index set to the column names
        ave_ata = pd.Series(
            np.zeros(self.tri.shape[1]), index=self.tri.columns, dtype=float
        )

        # if n is None, use all available periods
        is_all = n is None

        # need a value for n in the loop below
        n2 = n if n is not None else self.tri.shape[0]

        # # get the triangle
        # tri = self.tri

        # # get the triangle of age-to-age factors
        # ata = self._ata_tri()

        # loop through the columns in the triangle data (excl. the last column)
        for i, column in enumerate(self.tri.columns[:-1]):
            # calculate the Ave-ATA -- if n is None, use all available periods
            # otherwise, use the last n periods, until the number of periods
            # is less than n (in which case, use all available periods)
            if is_all or self.tri.iloc[:, i + 1].dropna().shape[0] <= n2:
                ave_ata[column] = self._ata_tri().iloc[:, i].mean(skipna=True)
            else:
                # drop the na values so they aren't included in the average,
                # then average the previous n periods
                ave_ata[column] = (
                    self._ata_tri().iloc[:, i].dropna().tail(n).mean(skipna=True)
                )

        # set the last column of the ave-ata results to the tail factor
        ave_ata[self.tri.columns[-1]] = tail

        return ave_ata

    def _medial_ata(
        self, n: int = None, tail: float = 1.0, excludes: str = "hl"
    ) -> pd.Series:
        """
        Calculate the medial age-to-age factor (Medial-ATA) of the triangle data. This
        excludes one or more of the values in the average calculation. Once the values are
        removed, the average is calculated as a normal average.

        Parameters:
        -----------
        n: int
            The number of periods to use in the Medial-ATA calculation. If None, use
            all available periods.
        tail: float
            The tail factor to use in the Medial-ATA calculation. Default is 1.0, or
            no tail factor.
        excludes: str
            The exclusions to use in the average calculation. Default is 'hl',
            or high and low. If ave_type is 'triangle', this parameter is ignored.
            This parameter is a string of characters, where each character is an
            exclusion. The options are:
                h - high
                l - low
                m - median
            These characters can be in any order, and any number of them can be
            specified. For example, 'hl' excludes the high and low values, as does
            'lh', but 'hhl' excludes only the high value.

        Returns:
        --------
        medial_ata: pd.Series
            The Medial-ATA triangle data. Shape is the same as the number of columns
            in the triangle data, with the index set to the column names.
        """
        # instantiate the medial-ata results - a series whose length is equal to the number of
        # columns in the triangle data, with the index set to the column names
        medial_ata = pd.Series(
            np.zeros(self.tri.shape[1]), index=self.tri.columns, dtype=float
        )

        # default if can't calculate this is to use the simple average
        default = self._vwa(n=n, tail=tail)

        # if n is None, use all available periods
        is_all = n is None

        # if the string contains 'h', exclude the high value, 'l' excludes the low value,
        # and 'm' excludes the median value
        exclude_high = "h" in excludes.lower()
        exclude_low = "l" in excludes.lower()
        exclude_median = "m" in excludes.lower()

        # need a value for n in the loop below
        n2 = n if n is not None else self.tri.shape[0]

        # loop through the columns in the triangle data (excl. the last column)
        for i, column in enumerate(self.tri.columns[:-1]):
            # temp column:
            temp_column = (self._ata_tri()).iloc[:, i].dropna()

            # count that there are enough values to calculate the average
            need_at_least = exclude_high + exclude_low + exclude_median

            # if there are not enough values to calculate the average, use the default
            if temp_column.shape[0] <= need_at_least:
                medial_ata[column] = default[column]
                continue
            else:
                # if we are not using all available periods, filter so only have
                # the last n periods available
                if is_all or self.tri.iloc[:, i + 1].dropna().shape[0] <= n2:
                    temp_column = temp_column.dropna()
                else:
                    temp_column = temp_column.dropna().tail(n)

                # if we are excluding the high value, remove it (same with low and median)
                if exclude_high:
                    temp_column = temp_column.drop(temp_column.idxmax())
                if exclude_low:
                    temp_column = temp_column.drop(temp_column.idxmin())
                if exclude_median:
                    temp_column = temp_column.drop(temp_column.median())

                # calculate the Medial-ATA
                medial_ata[column] = temp_column.mean(skipna=True)

        # set the last column of the medial-ata results to the tail factor
        medial_ata[self.tri.columns[-1]] = tail

        return medial_ata

    def ata(
        self,
        ave_type: str = "triangle",
        n: int = None,
        tail: float = 1.0,
        excludes: str = "hl",
    ) -> pd.DataFrame:
        """
        Returns the age-to-age factors of the triangle data, depending on the
        average type. Default is the triangle of age-to-age factors, but passing
        'vwa', 'simple', or 'medial' will return the volume weighted average,
        simple average, or medial average age-to-age factors, respectively. If one
        of the averages is selected, the number of periods to use in the average,
        tail factor, and exclusions can be specified (or they will use the defaults).

        Parameters:
        -----------
        ave_type: str
            The type of average to use. Options are 'triangle', 'vwa', 'simple',
            and 'medial'. Default is 'triangle'.
        n: int
            The number of periods to use in the average calculation. If None, use
            all available periods. If ave_type is 'triangle', this parameter is
            ignored.
        tail: float
            The tail factor to use in the average calculation. Default is 1.0, or
            no tail factor. If ave_type is 'triangle', this parameter is ignored.
        excludes: str
            The exclusions to use in the average calculation. Default is 'hl',
            or high and low. If ave_type is 'triangle', this parameter is ignored.
            This parameter is a string of characters, where each character is an
            exclusion. The options are:
                h - high
                l - low
                m - median
            These characters can be in any order, and any number of them can be
            specified. For example, 'hl' excludes the high and low values, as does
            'lh', but 'hhl' excludes only the high value.


        Returns:
        --------
        ata: pd.DataFrame
            The age-to-age factors of the triangle data, depending on the average
            type. Shape is the same as the triangle data.
        """
        # if the average type is 'triangle', return the triangle of age-to-age factors
        if ave_type.lower() == "triangle":
            return self._ata_tri()
        # if the average type is 'vwa', return the volume weighted average age-to-age factors
        elif ave_type.lower() == "vwa":
            return self._vwa(n=n, tail=tail)
        # if the average type is 'simple', return the simple average age-to-age factors
        elif ave_type.lower() == "simple":
            return self._ave_ata(n=n, tail=tail)
        # if the average type is 'medial', return the medial average age-to-age factors
        elif ave_type.lower() == "medial":
            return self._medial_ata(n=n, tail=tail, excludes=excludes)
        # if the average type is not recognized, raise an error
        else:
            raise ValueError(
                'Invalid age-to-age type. Must be "triangle", "vwa", "simple", or "medial"'
            )

    def atu(
        self,
        ave_type: str = "vwa",
        n: int = None,
        tail: float = 1.0,
        excludes: str = "hl",
        custom: np.ndarray = None,
    ) -> pd.DataFrame:
        """
        Calculates the age-to-ultimate factors from the triangle data.

        Parameters:
        -----------
        ave_type: str
            The type of average to use. Options are 'vwa', 'simple',
            and 'medial'. Default is 'vwa'.
        n: int
            The number of periods to use in the average calculation. If None, use
            all available periods.
        tail: float
            The tail factor to use in the average calculation. Default is 1.0, or
            no tail factor.
        excludes: str
            The exclusions to use in the average calculation. Default is 'hl',
            or high and low. This parameter is a string of characters, where each
            character is an exclusion. The options are:
                h - high
                l - low
                m - median
            These characters can be in any order, and any number of them can be
            specified. For example, 'hl' excludes the high and low values, as does
            'lh', but 'hhl' excludes only the high value.
        custom: np.ndarray
            A custom array of age-to-age factors to use in the calculation. If
            None, use the age-to-age factors calculated from the 'ave_type'.
            If not None, the 'ave_type', 'n', 'tail', and 'excludes' parameters
            are ignored.
            Default is None.

        Returns:
        --------
        atu: pd.DataFrame
            The age-to-ultimate factors of the triangle data.
        """
        # calculate the age-to-age factors
        if custom is None:
            age_to_age = self.ata(ave_type=ave_type, n=n, tail=tail, excludes=excludes)
        else:
            age_to_age = pd.Series(custom, index=self.tri.columns)

        # calculate the age-to-ultimate factors (cumulative product of the ata factors,
        # starting with the last column/the tail factor)
        age_to_ult = age_to_age[::-1].cumprod()[::-1]

        return age_to_ult

    def diag(self, calendar_year: int = None) -> pd.DataFrame:
        """
        Calculates the specified diagonal of the triangle data.

        Parameters:
        -----------
        calendar_year: int
            The calendar year of the diagonal to return. If None, return the
            current diagonal. Default is None.
            This is not implemented.

        Returns:
        --------
        diag: pd.DataFrame
            The diagonal of the triangle data.
        """
        # look at the triangle as an array
        triangle_array = self.tri.to_numpy()

        # if the calendar year is not specified, return the current diagonal
        if calendar_year is None:
            calendar_year = triangle_array.shape[0]

        # diagonal is a series of length equal to the number of rows in the triangle
        diag = pd.Series(np.diagonal(np.fliplr(triangle_array)), index=self.tri.index)

        # match the index of the diagonal to column name that value can be found in
        # (remember that the triangle may not be the same size as the index, if the
        # triangle is not square -- so we need to actually match the first occurrence
        # of the value to the column name)
        ################################################################################################################################################################

        return diag

    def ult(
        self,
        ave_type: str = "vwa",
        n: int = None,
        tail: float = 1.0,
        excludes: str = "hl",
        custom: np.ndarray = None,
        round_to: int = 0,
    ):
        """
        Calculates the ultimate loss from the standard chain ladder method.

        Parameters:
        -----------
        ave_type: str
            The type of average to use. Options are 'vwa', 'simple',
            and 'medial'. Default is 'vwa'.
        n: int
            The number of periods to use in the average calculation. If None, use
            all available periods.
        tail: float
            The tail factor to use in the average calculation. Default is 1.0, or
            no tail factor.
        excludes: str
            The exclusions to use in the average calculation. Default is 'hl',
            or high and low. This parameter is a string of characters, where each
            character is an exclusion. The options are:
                h - high
                l - low
                m - median
            These characters can be in any order, and any number of them can be
            specified. For example, 'hl' excludes the high and low values, as does
            'lh', but 'hhl' excludes only the high value.
        custom: np.ndarray
            A custom array of age-to-age factors to use in the calculation. If
            None, use the age-to-age factors calculated from the 'ave_type'.
            If not None, the 'ave_type', 'n', 'tail', and 'excludes' parameters
            are ignored.
            Default is None.
        round_to: int
            The number of decimal places to round the ultimate loss to. Default is 0.
        """
        diag = self.diag()

        # calculate the age-to-ultimate factors and reverse the order
        atu = self.atu(
            ave_type=ave_type, n=n, tail=tail, excludes=excludes, custom=custom
        )[::-1]
        atu.index = diag.index

        # calculate the ultimate loss
        ult = diag * atu
        ult.name = "Chain Ladder Ultimate Loss"
        ult.index.name = "Accident Period"

        return ult.round(round_to)

    def ata_summary(self) -> pd.DataFrame:
        """
        Produces a fixed summary of the age-to-age factors for the triangle data.

        Contains the following:
            - Triangle of age-to-age factors
            - Volume weighted average age-to-age factors for all years, 5 years, 3 years, and 2 years
            - Simple average age-to-age factors for all years, 5 years, 3 years, and 2 years
            - Medial average age-to-age factors for 5 years, excluding high, low, and high/low values
        """

        triangle = self

        ata_tri = triangle.ata().round(3)

        vol_wtd = pd.DataFrame(
            {
                "Vol Wtd": pd.Series(
                    ["" for _ in range(ata_tri.shape[1] + 1)],
                    index=ata_tri.reset_index().columns,
                ),
                "All Years": triangle.ata("vwa").round(3),
                "5 Years": triangle.ata("vwa", 5).round(3),
                "3 Years": triangle.ata("vwa", 3).round(3),
                "2 Years": triangle.ata("vwa", 2).round(3),
            }
        ).transpose()

        simple = pd.DataFrame(
            {
                "Simple": pd.Series(
                    ["" for _ in range(ata_tri.shape[1] + 1)],
                    index=ata_tri.reset_index().columns,
                ),
                "All Years": triangle.ata("simple").round(3),
                "5 Years": triangle.ata("simple", 5).round(3),
                "3 Years": triangle.ata("simple", 3).round(3),
                "2 Years": triangle.ata("simple", 2).round(3),
            }
        ).transpose()

        medial = pd.DataFrame(
            {
                "Medial 5-Year": pd.Series(
                    ["" for _ in range(ata_tri.shape[1] + 1)],
                    index=ata_tri.reset_index().columns,
                ),
                "Ex. Hi/Low": triangle.ata("medial", 5, excludes="hl").round(3),
                "Ex. Hi": triangle.ata("medial", 5, excludes="h").round(3),
                "Ex. Low": triangle.ata("medial", 5, excludes="l").round(3),
            }
        ).transpose()

        out = (
            pd.concat(
                [ata_tri.drop(index=ata_tri.index[-1]), vol_wtd, simple, medial],
                axis=0,
            )
            .drop(columns=self.tri.columns[-1])
            .fillna("")
        )

        # check to see if the last column is all '' (empty strings)
        if out.iloc[:, -1].str.contains("").all():
            out = out.drop(columns=out.columns[-1])

        # try to reformat the index
        out.index = [
            i.strftime("%Y") if isinstance(i, datetime) else i for i in out.index
        ]

        # rename the columns to put a title above the df
        out.columns.name = "Age-to-Age Factors as of (months)"

        return out

    def melt_triangle(
        self,
        id_cols: list = None,
        var_name: str = "development_period",
        value_name: str = "triangle",
        _return: bool = True,
        incr_tri: bool = True,
    ) -> pd.DataFrame:
        """
        Melt the triangle data into a single column of values.
        Parameters:
        -----------
        id_cols: list
            The columns to use as the id variables. Default is None, in which
            case the index is used.
        var_name: str
            The name of the variable column. Default is 'dev'.
        value_name: str
            The name of the value column. Default is None, in which case
            the value column is set equal to the triangle ID.
        _return: bool
            If True, return the melted triangle data as a pandas dataframe.
            Default is True.
        incr_tri: bool
            If True, use the incremental triangle data. Default is True. If
            False, use the cumulative triangle data.

        Returns:
        --------
        melted: pd.DataFrame
            The melted triangle data.
        """
        # if id_cols is None, use the index
        if id_cols is None:
            id_cols = self.triangle.index.name

        # if value_name is None, use the triangle ID
        if value_name is None:
            value_name = self.id

        # get the triangle data
        if incr_tri:
            if self.incr_triangle is None:
                self.cum_to_inc()
            tri = self.incr_triangle
        else:
            tri = self.triangle

        tri.index = self.get_formatted_dataframe().index

        # melt the triangle data
        melted = tri.reset_index().melt(
            id_vars=id_cols, var_name=var_name, value_name=value_name
        )

        # if _return is True, return the melted triangle data
        if _return:
            return melted

    def base_design_matrix(
        self,
        id_cols: list = None,
        var_name: str = "development_period",
        value_name: str = "tri",
        trends: bool = True,
        _return: bool = True,
        incr_tri: bool = True,
    ) -> pd.DataFrame:
        """
        Creates a design matrix from the triangle data. The design matrix is a pandas
        dataframe with one row for each triangle cell, and one column for each origin
        and development period. The origin and development periods are encoded as
        dummy variables, and if `trends` is True, the origin and development periods
        are also encoded as linear trends, instead of just dummy variables.

        This is the base design matrix for a rocky3 model. The base design matrix
        is used to create the full design matrix, which includes any interaction
        terms, and any other covariates.

        All diagnostics will implicitly check that any changes to the base model provide
        improvements to the base model fit.

        Parameters:
        -----------
        id_cols: list
            The columns to use as the id variables. Default is None, in which
            case the index is used.
        var_name: str
            The name of the variable column. Default is 'dev'.
        value_name: str
            The name of the value column. Default is None, in which case
            the value column is set equal to the triangle ID.
        trends: bool
            If True, include linear trends in the design matrix. Default is True.
        _return: bool
            If True, return the design matrix as a pandas dataframe.
            Default is True.
        incr_tri: bool
            If True, use the incremental triangle data. Default is True. If
            False, use the cumulative triangle data.

        Returns:
        --------
        dm_total: pd.DataFrame
            The design matrix.
        """
        if id_cols is None:
            id_cols = self.triangle.index.name

        if value_name is None:
            value_name = self.id

        # melt the triangle data
        melted = self.melt_triangle(
            id_cols=id_cols,
            var_name=var_name,
            value_name=value_name,
            _return=True,
            incr_tri=incr_tri,
        )

        df = self.get_formatted_dataframe()

        _acc = df.index.name if df.index.name is not None else "accident_period"
        _dev = df.columns.name if df.columns.name is not None else "development_period"

        acc = _acc.lower().replace(" ", "_").replace(".", "")
        dev = _dev.lower().replace(" ", "_").replace(".", "")

        melted.rename(columns={f"{_acc}": acc, f"{_dev}": dev}, inplace=True)
        # melted[acc]

        # convert the origin and development periods to zero-padded categorical variables
        melted[acc] = melted[acc].astype(str).str.zfill(4).astype("category")
        melted[dev] = melted[dev].astype(str).str.zfill(4).astype("category")

        # create the design matrix
        dm_total = pd.get_dummies(melted, columns=[acc, dev], drop_first=True)

        # if trends is True, add linear trends to the design matrix
        if trends:
            # create dummy variables for the origin and development periods
            dm_ay = pd.get_dummies(melted[[acc]], drop_first=True)
            dm_dev = pd.get_dummies(melted[[dev]], drop_first=True)

            # ay dm columns
            cols = dm_ay.columns.tolist()

            # reverse the order of the columns (to loop backwards)
            cols.reverse()

            # loop backwards through the columns
            for i, c in enumerate(cols):
                # if i==0, set the column equal to itself
                if i == 0:
                    dm_total[c] = dm_ay[c]

                # otherwise, add the column to the previous column
                else:
                    dm_total[c] = dm_ay[c] + dm_total[cols[i - 1]]

            # do the same thing for the development period dummy variables
            cols = dm_dev.columns.tolist()
            cols.reverse()
            for i, c in enumerate(cols):
                if i == 0:
                    dm_total[c] = dm_dev[c]
                else:
                    dm_total[c] = dm_dev[c] + dm_total[cols[i - 1]]

            # add a column called "is_observed" at the beginning that is 1 if
            # dm_total[value_name] is not null and 0 otherwise
            observed_col = dm_total[value_name].notnull().astype(int)
            dm_total.insert(0, "is_observed", observed_col)

        for c in dm_total.columns:
            if dm_total[c] is bool:
                dm_total[c] = dm_total[c].astype(int)

        # if _return is True, return the design matrix
        if _return:
            return dm_total

        self.X_base = dm_total.drop(columns=value_name).astype(int)
        self.y_base = dm_total[value_name]

        # ay/dev id for each row
        self.X_id = pd.DataFrame(
            dict(
                accident_period=melted[acc].astype(int).values,
                development_period=melted[dev].astype(int).values,
            )
        )
        self.X_id["calendar_period"] = (
            self.X_id.accident_period - self.X_id.accident_period.min()
        ) + (self.X_id.development_period / self.X_id.development_period.min())
        self.X_id["calendar_period"] = self.X_id["calendar_period"].astype(int)
        self.X_id.index = self.X_base.index

    def base_linear_model(
        self,
        id_cols: list = None,
        var_name: str = "development_period",
        value_name: str = None,
        trends: bool = True,
        incr_tri: bool = True,
        intercept_: bool = True,
    ) -> pd.DataFrame:
        """
        Builds the train/forecast data split based off of the base design matrix.

        Parameters:
        -----------
        (See base_design_matrix() for parameter descriptions of id_cols, var_name,
        value_name, trends, _return, and incr_tri)

        intercept_: bool
            If True, include an intercept in the model. Default is True.

        Returns:
        --------
        dm_base_train: pd.DataFrame
            The training data design matrix with target variable as the first column.
        """
        # if the base design matrix has not been created, create it
        if self.X_base is None:
            self.base_design_matrix(
                id_cols=id_cols,
                var_name=var_name,
                value_name=value_name,
                trends=trends,
                _return=False,
                incr_tri=incr_tri,
            )

        # create the train/forecast data split based on whether or not the
        # target variable is null
        self.X_base_train = self.X_base[self.X_base.is_observed.eq(1)]
        self.y_base_train = self.y_base[self.X_base.is_observed.eq(1)]
        self.X_base_forecast = self.X_base[self.X_base.is_observed.eq(0)].assign(
            intercept=1
        )

        self.X_id_train = self.X_id[self.X_base.is_observed.eq(1)]
        self.X_id_forecast = self.X_id[self.X_base.is_observed.eq(0)]

        # if intercept_ is False, drop the intercept column
        if not intercept_:
            self.X_base_train = self.X_base_train.drop(columns="intercept")
            self.X_base_forecast = self.X_base_forecast.drop(columns="intercept")

    def get_X(
        self,
        split: str = None,
        use_cal: bool = False,
        X_type: str = None,
        column_query: str = None,
    ) -> pd.DataFrame:
        """
        Get the design matrix for the given split.

        Parameters:
        -----------
        split: str
            The split to get the design matrix for. If None, return the full design
            matrix. If "train", return the training design matrix. If "forecast",
            return the forecast design matrix. Default is None.
        use_cal: bool
            If True, include the calendar period in the design matrix. Default is
            False.
        X_type: str
            The type of design matrix to return. If None, return the full design
            matrix. If "base", return the base design matrix. If "cal", return the
            calendar design matrix. If "id", return the id design matrix. Default is
            None.
        column_query: str
            If not None, only return columns that contain the given string. Default
            is None.

        Returns:
        --------
        X: pd.DataFrame
            The design matrix for the given split.
        """
        cal = self.get_X_cal(split=split)
        base = self.get_X_base(split=split)
        id = self.get_X_id(split=split)

        if use_cal:
            X = pd.concat([id, base, cal], axis=1)
        else:
            X = pd.concat([id, base], axis=1)

        if split is None:
            pass
        elif split == "train":
            X = X.loc[X.is_observed.eq(1)]
        elif split == "forecast":
            X = X.loc[X.is_observed.eq(0)]

        if column_query is not None:
            for c in X.columns.tolist():
                if column_query in c:
                    pass
                else:
                    X = X.drop(columns=c)

        return X

    def get_X_cal(self, split=None):
        """
        Returns the calendar design matrix
        """
        df = self.get_X_id(split=split)
        df["calendar_period"] = (
            df["calendar_period"].astype(str).str.pad(4, fillchar="0")
        )
        df["calendar_period"] = df.calendar_period.apply(lambda x: f"{x}")
        df_cal = pd.get_dummies(df[["calendar_period"]], drop_first=True)
        out = df_cal.copy()

        # ay dm columns
        cols = df_cal.columns.tolist()

        # reverse the order of the columns (to loop backwards)
        cols.reverse()

        # loop backwards through the columns
        for i, c in enumerate(cols):
            # if i==0, set the column equal to itself
            if i == 0:
                out[c] = df_cal[c]

            # otherwise, add the column to the previous column
            else:
                out[c] = df_cal[c] + out[cols[i - 1]]

        out = out.astype(int)

        idx = self.get_X_id(split=split).index
        return out.loc[idx]

    def get_X_exposure(self, split: str = None) -> pd.DataFrame:
        """
        Returns the exposure design matrix
        """
        if split is None:
            df = self.exposure
        elif split == "train":
            df = self.exposure_train
        elif split == "forecast":
            df = self.exposure_forecast

        return df

    def get_X_base(self, split=None, cal=False):
        """
        Returns the base design matrix
        """
        if cal:
            df_cal = self.get_X_cal(split=None)
            df = pd.concat([self.X_base, df_cal], axis=1)
        else:
            df = self.X_base

        if split == "train":
            df = df.loc[self.X_base_train.index]
        elif split == "forecast":
            df = df.loc[self.X_base_forecast.index]
        else:
            df = df

        df["intercept"] = 1

        return df

    def get_y_base(self, split=None):
        """
        Returns the labels for the base design matrix
        """
        if split is None:
            df = self.y_base
        elif split == "train":
            df = self.y_base_train
        elif split == "forecast":
            df = self.y_base_forecast
        else:
            df = self.y_base

        return df

    def get_X_id(self, split=None):
        """
        Returns the labels for the base design matrix
        """
        if split is None:
            df = self.X_id
        elif split == "train":
            df = self.X_id_train
        elif split == "forecast":
            df = self.X_id_forecast
        else:
            df = self.X_id

        return df

    def get_y_id(self, split=None):
        """
        Returns the labels for the base design matrix
        """
        if split is None:
            df = self.y_id
        elif split == "train":
            df = self.y_id_train
        elif split == "forecast":
            df = self.y_id_forecast
        else:
            df = self.y_id

        return df

    # def prep_for_cnn(self, steps=False) -> pd.DataFrame:
    #     """
    #     Performs data preprocessing and reshaping to transform triangle into form
    #     suitable for inference on LossTriangleClassifier

    #     If steps is True, returns a dictionary of steps taken to preprocess
    #     """
    #     from sklearn.preprocessing import StandardScaler
    #     from torch.utils.data import DataLoader

    #     # initialize if needed
    #     if steps:
    #         out_dict = {}

    #     # read indicators
    #     ind = pd.read_csv("data/LossTriangleClassifierShape.csv").iloc[:, 1:]
    #     if steps:
    #         out_dict["01. Indicators"] = ind

    #     # copy triangle
    #     df = self.tri.copy()
    #     if steps:
    #         out_dict["02. Current Triangle"] = df

    #     # only last 10 rows, first 10 columns
    #     df = df.iloc[-10:, :10]
    #     if steps:
    #         out_dict["03. Remove all but last 10 rows, first 10 cols"] = df

    #     # replace empty strings with nan values
    #     df = df.replace("", np.nan)
    #     if steps:
    #         out_dict["04. Replace empty strings with nan"] = df

    #     # set index & columns of `ind` equal to those in `df` so you can
    #     # easily multiply them
    #     ind.index = df.index
    #     ind.columns = df.columns

    #     # multiply them
    #     mult = df * ind
    #     if steps:
    #         out_dict["05. Multiply original triangle with indicators"] = mult

    #     # replace blank values with nan
    #     replaced = mult.replace("", np.nan)
    #     if steps:
    #         out_dict["06. Replace blank values with nan"] = replaced

    #     # preprocess
    #     scaler = StandardScaler()
    #     scaled = scaler.fit_transform(replaced.values)
    #     scaled = pd.DataFrame(scaled, index=replaced.index, columns=replaced.columns)
    #     if steps:
    #         out_dict["07. Standardize over the whole triangle"] = scaled

    #     # fill na values with 0s
    #     scaled = scaled.fillna(0)

    #     if steps:
    #         return out_dict
    #     else:
    #         return scaled

    #     id: str = None
    # tri: pd.DataFrame = None
    # triangle: pd.DataFrame = None
    # incr_triangle: pd.DataFrame = None
    # X_base: pd.DataFrame = None
    # y_base: np.ndarray = None
    # X_base_train: pd.DataFrame = None
    # y_base_train: np.ndarray = None
    # X_base_forecast: pd.DataFrame = None
    # y_base_forecast: np.ndarray = None
    # has_cum_model_file: bool = False
    # is_cum_model: Any = None

    # def _load_is_cum_model(self, model_file = None):

    #     # pre-fit/saved triangle model
    #     model_file = r"C:\Users\aweaver\OneDrive - The Cincinnati Insurance Company\rocky\inc_cum_tri.torch"

    #     # initialize model
    #     model = LossTriangleClassifier(torch.Size([1, 10, 10]),
    #                                    num_classes=2,
    #                                    num_conv_layers=5,
    #                                    base_conv_nodes=256,
    #                                    kernel_size=(2, 2),
    #                                    stride=(1, 1),
    #                                    padding=(1, 1),
    #                                    linear_nodes=[1024, 512, 256, 128],
    #                                    linear_dropout=[0.4, 0.3, 0.2, 0.1],
    #                                    relu_neg_slope=0.1)

    #     # load model on CPU
    #     model.to(torch.device('cpu'))

    #     # load saved parameters to instanciated model
    #     model.load_state_dict(torch.load(
    #         model_file, map_location=torch.device('cpu')))

    #     self.is_cum_model = model

    # def _is_cum_model(self):
    #     # build DataLoader from the preprocessed data
    #     data = DataLoader(self.prep_for_cnn().values, batch_size=1)

    #     # set model to evaluate (eg not train)
    #     self.is_cum_model.eval()

    #     # no gradient update
    #     with torch.no_grad():
    #         inputs = torch.from_numpy(data.dataset.reshape(1, 10, 10))
    #         pred = self.is_cum_model(inputs.float().unsqueeze(0))

    #     self._is_cum_pred = pred
    #     self.is_cum = torch.argmax(pred, dim=1).cpu().item()

```

## Details

> Details about what the code does.


***

## Appendix: Links and References

*Note created on [[2023-07-17]] and last modified on [[2023-07-17]].*

### Internal Linked Notes

- [[03 - AREAS/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]]
- [[Code/_README|Code Snippets]]
- [[03 - AREAS/Code/PowerShell/_README|PowerShell Code Snippets]]
- [[MOCs/Development|Development]]
- [[MOCs/Technology|Technology]]
- [[MOCs/Windows|Microsoft Windows]]
- [[MOCs/Software Engineering|Software Engineering]]

### External References

#### Backlinks

```dataview
list from [[Python - Actuarial Triangle Class]] AND -"CHANGELOG" AND -"Code/Python/Python - Actuarial Triangle Class"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

