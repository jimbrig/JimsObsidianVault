---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: medium
Link: https://medium.com/p/ef478c43a874
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - Data-Oriented Programming With Python
  - Data-Oriented Programming With Python
---
# Data-Oriented Programming With Python

## Metadata
- Author: [[Tam D Tran-The]]
- Full Title: Data-Oriented Programming With Python
- Category: #Type/Highlight/Article
- URL: https://medium.com/p/ef478c43a874

## Highlights
- “Separate code from data in a way that the code resides in functions whose behavior does not depend on data that is encapsulated in the function’s context.” — Yehonathan Sharvit
- A natural way of adhering to this principle in Python is to use top-level functions (for code) and data classes that only have fields (for data). Whereas Sharvit illustrates in his book how to follow this principle in OOP and FP (functional programming) separately, my example in Python is a hybrid of OOP and FP.
- Principle #2: Represent data with generic data structures
- “In DOP, data is represented with generic data structures, such as maps (or dictionaries) and arrays (or lists).” — Yehonathan Sharvit
- In Python, our built-in options for generic data structures are dict , list , and tuple.
- In this article, I use Python’s dataclass , which can be thought of as a “mutable named tuple with defaults.” Note that this was not what Sharvit meant by “generic data structure.” Python’s dataclass is a hybrid that is closer to OOP than DOP. However, compared with dictionaries and tuples, this alternative is less susceptible to typos, more descriptive with type hinting, helps represent nested complex structure in a clearer and more concise way, and more. Also, it can easily be turned into a dictionary or a tuple if we want to.
- Principle # 3: Data is immutable
- “According to DOP, data should never change! Instead of mutating data, a new version of it is created.” — Yehonathan Sharvit
- Principle #4: Separate data schema from data representation
- “In DOP, the expected shape of data is represented as (meta) data that is kept separately from the main data representation.” — Yehonathan Sharvit
