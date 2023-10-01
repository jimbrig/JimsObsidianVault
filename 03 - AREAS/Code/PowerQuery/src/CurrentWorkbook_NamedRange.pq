/*
* return the value referenced by the workbook scoped named range. The return type is inferred from the structure of
* [Content] for the named range, and M detects the type for literals.
*
* support for worksheet scoped named ranges is provided through the optional 'sheet' parameter
*
* @name CurrentWorkbook.NamedRange
* @categories excel, currentworkbook
* @author https://github.com/jimbrig
* @source https://github.com/jimbrig/JimsPQ/tree/main/src/CurrentWorkbook.NamedRange.pq
* @result literal, table, or list
*/
let
    Param.Name.Error = (name as text) as record =>
        Error.Record(
            "Argument Error",
            Text.Format("'#[nm]' is not a valid named range for this workbook.",[nm = name]),
            Text.Combine(
                {
                    "Check that the spelling is correct, and that the named range is scoped to the",
                    "workbook. Worksheet scoped named ranges can still be accessed using the optional",
                    "sheet parameter."
                },
                " "
            )
        ),

    Main.Func = (name as text, optional sheet as nullable text) as any =>
        let
            Name = if sheet = null then name else Text.Format("#[sh]![nm]", [sh=sheet, nm=name]),
            Content =
                try
                    Excel.CurrentWorkbook(){[Name=Name]}[Content]
                otherwise
                    error Param.Name.Error(name),
            Output =
                if Table.ColumnNames(Content) = {"Column1"} then
                    if Table.RowCount(Content) = 1 then
                        Content{0}[Column1]
                    else
                        Content[Column1]
                else
                    Content
        in
            Output,
    Main.Type = Type.ForFunction(
        [
            ReturnType = type any,
            Parameters = [
                name = type text meta [
                    Documentation.FieldCaption = "name: named range",
                    Documentation.AllowedValues = Excel.CurrentWorkbook()[Name]
                ],
                optional sheet = type nullable text meta [
                    Documentation.FieldCaption = "sheet: worksheet scope"
                ]
            ]
        ],
        Type.FunctionRequiredParameters(Value.Type(Main.Func))
    ),
    Main.Docs = [
        Documentation.Name = "CurrentWorkbook.NamedRange",
        Documentation.LongDescription = Text.Combine(
            {
                "Return the value referenced by the workbook named range.",
                "Worksheet scoped ranges can be accessed by also providing the 'sheet' parameter.<br><br>",

                "<b>Args</b><br>-----<br>",
                "<b>name</b> as text: named range<br>",
                "<b>sheet</b> as nullable text: [Optional] sheet name for worksheet scoped named ranges<br><br>",

                "<b>Returns</b><br>---------<br>Values are inferred to be:<br>",
                "+ A literal if Content is a 1x1 table with 'Column1'<br>",
                "+ A list if Content is a 1xN table with 'Column1'<br>",
                "+ A table if neither of the above is true<br><br>",
                "The table return format is the default for Excel.CurrentWorkbook()[Content] records and will return a",
                "table with no column types transformed.<br><br>",

                "<b>Raises</b><br>-------<br>",
                "Argument Error: the named range does not exist in the workbook scope"
            },
            " "
        ),
        Documentation.Examples = {
            [
                Description = "Name refers to a single cell",
                Code = "CurrentWorkbook_NamedRange(""TheNumberFour"")",
                Result = "4"
            ],
            [
                Description = "Name refers to a single cell, forceTable=true",
                Code = "CurrentWorkbook_NamedRange(""TheNumberFour"", null, true)",
                Result = "Column1#(lf)-------#(lf)4"
            ],
            [
                Description = "Name refers to a range of cells",
                Code = "CurrentWorkbook_NamedRange(""Alphabet"")",
                Result = "{""A"",""B"",""C"",""D"", ..., ""Z""}"
            ],
            [
                Description = "Name refers to a range of cells, forceTable=true",
                Code = "CurrentWorkbook_NamedRange(""Alphabet"", null, true)",
                Result = "Column1#(lf)-------#(lf)A#(lf)B#(lf)C#(lf)..#(lf)Z"
            ],
            [
                Description = "Name refers to a table only scoped to sheet 'abc'",
                Code = "CurrentWorkbook_NamedRange(""AlphabetWithPosition"", ""abc"")",
                Result = Text.Combine(
                    {
                        "Pos | Letter#(lf)",
                        "------------#(lf)",
                        "  1 |  A#(lf)",
                        "  2 |  B#(lf)",
                        "  3 |  C#(lf)",
                        " .. | ..#(lf)",
                        " 26 |  Z"
                    }
                )
            ]
        }
    ]
in
    Value.ReplaceType(Main.Func, Main.Type meta Main.Docs)
