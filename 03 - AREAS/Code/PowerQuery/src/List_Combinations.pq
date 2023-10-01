/**
* generate all non-repeating combinations of size 'combinationSize' from a list, or if only a size is provided,
* all combinations of non-repeating indexes from 0 to (size - 1)
*
* if a list containing duplicates is provided, they will be carried through to the subset combinations
*
* @name List_Combinations
* @categories list
* @license MIT (c) 2021 W Bohm
* @author https://github.com/jimbrig
* @source https://github.com/jimbrig/JimsPQ/tree/main/src/List_Combinations.pq
* @result list of combinations (as lists)
*/
let
    Main.Func = (setOrSize as anynonnull, combinationSize as number) as list =>
        let
            SetSize = if setOrSize is number then setOrSize else List.Count(setOrSize),
            Set = {0..SetSize -1},

            MakeCombins = (n as number, set as list) as list =>
                if n = 0 then
                    {{}}
                else if List.Count(set) = 0 then
                    {}
                else
                    List.Transform(@MakeCombins(n - 1, List.Skip(set, 1)), each {set{0}} & _)
                    &
                    @MakeCombins(n, List.Skip(set, 1)),

            Combins = MakeCombins(combinationSize, Set),
            CombinValues = List.Transform(
                    Combins,
                    (innerList) => List.Transform(innerList, each setOrSize{_})
                )
        in
            if setOrSize is list then CombinValues else Combins,
    Main.Type = Type.ForFunction(
        [
            ReturnType = type list,
            Parameters = [
                setOrSize = type anynonnull meta [
                    Documentation.FieldCaption = "list or size of list"
                ],
                combinationSize = type number meta [
                    Documentation.FieldCaption = "the size of each combination subset"
                ]
            ]
        ],
        2
    ),
    Main.Docs = [
        Documentation.Name = "List.Combinations",
        Documentation.LongDescription = Text.Combine(
            {
                "Generate a list of non-repeating combination subsets of length <code>combinationSize</code> from the",
                "set. If <code>setOrSize</code> is an integer, a list of index positions will be generated, otherwise",
                "combinations from the input list will be created.<br>",

                "The function will generate nCr # of combinations, which can be calculated in Power Query as",
                "<code>Number.Combinations(List.Count(set), combinationSize)</code><br><br>",

                "<b>Args:</b><br>",
                "<code>setOrSize</code>: list, or integer set size, to create combinations of",
                "<code>combinationSize</code>: number of elements in each combination subset<br>",

                "<b>Returns:</b><br>",
                "A list of all non-repeating combinations of length <code>combinationSize</code> from the source list",
                "of if an integer <code>setOrSize</code> was provided, a list of all non-repeating index combinations",
                "from 0 to <code>setOrSize - 1</code>."
            },
            " "
        ),
        Documentation.Examples = {
            [
                Description = "Subsets of 4 from ABCDE (5 choose 4)",
                Code = "List_Combinations({""A"", ""B"", ""C"", ""D"", ""E""}, 4)",
                Result = "{#(lf)  {""ABCD""},#(lf)  {""BCDE""}#(lf)}"
            ],
            [
                Description = "Subsets of 2 from 4 possible values (4 choose 2)",
                Code = "List_Combinations(4, 2)",
                Result = "{#(lf)  {0,1},#(lf)  {0,2},#(lf)  {0,3},#(lf)  {1,2},#(lf)  {1,3},#(lf)  {2,3}#(lf)}"
            ]
        }
    ]
in
    Value.ReplaceType(Main.Func, Main.Type meta Main.Docs)
