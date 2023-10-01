/**
* Short, one sentence query description
*
* Long query description. Should also be added to Documentation.LongDescription
* in the Main.Docs record.
*
* @name QueryName
* @categories relevant tag, another relevant tag
* @license UNLICENSE (c) 20## Jimmy Briggs
* @author https://github.com/jimbrig
* @source https://github.com/jimbrig/JimsPQ/tree/main/src/{{filename}}.pq
* @result result type
*/
let
    /* Sub-Calcs Section

    SubCalc.Type -> type:
    SubCalc.FuncA -> any:
    SubCalc.FuncB -> any:
    */
    SubCalc.Type = ...,
    SubCalc.FuncA = ...,
    SubCalc.FuncB = ...,

    /* Main Function

    Main.Func -> any: the calculations and return value for the query
    Main.Type -> type: parameter definitions used in Main.Func, along with documentation for the Query Editor
    Main.Docs -> record: meta information for Query Editor documentation
    */
    Main.Func = (p1 as any, optional p2 as any) as any =>
        let
            Source = ...
        in
            Source,
    Main.Type = Type.ForFunction(
        [
            ReturnType = type any,
            Parameters = [
                p1 = type any meta [
                    Documentation.FieldCaption = "short caption to display",
                    Documentation.SampleValues = {"list of text displayed in the entry field"},
                    Documentation.AllowedValues = {"list of values (any type) to display in dropdown"}
                ],
                optional p2 = type any meta [
                    Documentation.FieldCaption = "short caption to display",
                    Documentation.SampleValues = {"list of text displayed in the entry field"},
                    Documentation.AllowedValues = {"list of values (any type) to display in dropdown"}
                ]
            ]
        ],
        Type.FunctionRequiredParameters(Value.Type(Main.Func))
    ),
    Main.Docs = [
        Documentation.Name = "short name of entire function, shows at top",
        Documentation.LongDescription = "long description of entire function",
        Documentation.Examples = {
            [
                Description = "description of the example",
                Code = "show under ""usage"" section",
                Result = "show under ""result"" section"
            ]
        }
    ]
in
    Value.ReplaceType(Main.Func, Main.Type meta Main.Docs)
