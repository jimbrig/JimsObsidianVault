---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: feedly
Link: https://rubberduckvba.wordpress.com/2023/05/07/declaring-and-using-variables-in-vba/
Tags: ["#Type/Highlight/Article"]
Aliases: ["Declaring and Using Variables in VBA", "Declaring and Using Variables in VBA"]
---
# Declaring and Using Variables in VBA

## Metadata
- Author: [[Rubberduck VBA]]
- Full Title: Declaring and Using Variables in VBA
- Category: #Type/Highlight/Article
- URL: https://rubberduckvba.wordpress.com/2023/05/07/declaring-and-using-variables-in-vba/

## Highlights
- About Scopes
- Before we can really understand what variables do and what they’re useful for, we need to have a minimal grasp of the concept of scoping. When you record a macro, the executable instructions for you inside a procedure scope that’s delimited with Sub and End Sub tokens (tokens are the grammatical elements of the language, not necessarily single keywords), with the identifier name of the macro after the Sub keyword:
  Sub DoSomething()    ' executable code goes hereEnd Sub
- Exactly none of the above code is executable, but compiling it creates an entry point that the VBA runtime can invoke and execute, because the procedure is implicitly public and as such, can be accessed from outside the “Module1” module it exists in. In other words the above code could tell us explicitly what the scope of the DoSomething procedure is, using the Public keyword before the Sub token:
  Public Sub DoSomething()    ' executable code goes hereEnd Sub
- The global namespace contains not only the public identifiers from your VBA project, but also all the public identifiers from every referenced library, and they don’t need to be qualified either so that’s how you can invoke the VBA.Interaction.MsgBox function without qualifying with the library or module it’s defined in. If you write your own MsgBox function, every unqualified MsgBox call in that project is now invoking that new custom function, because VBA always prioritizes the host VBA project’s own type library over the referenced ones (every VBA project references the VBA standard library and the type library that defines the COM extension and automation model for the host application).
- Non-Executable Statements
  Procedures don’t only contain executable instructions: Dim statements, like statements with Private and Public modifiers, are declarative and do not do anything
- the smallest scope in VBA is the procedure scope, and it includes the parameters and all the local declarations of that procedure – regardless of where in the procedure body they’re declared at, so the reason to declare variables as you need them has more to do with reducing mental load and making it easier to extract a method by moving a chunk of code into another procedure scope.
- Declaring all locals at the top of a procedure often results in unused variables dangling, because of the constant up-and-down, back-and-forth scrolling that inevitably happens when a procedure eventually grows.
- Const statements (to declare constant values) are also legal in local/procedure scope, and they’re identically non-executable; the same applies to Static declarations (variables that retain their value between invocations).
- ReDim statements however are executable, even though they also count as a compile-time declaration – but they don’t count as a duplicate declaration, so the presence of ReDim doesn’t really justify skipping an initial Dim declaration.
- By specifying Option Explicit at the top of every module, the compiler will treat implicit declarations as compile-time errors, telling you about the problem before it even becomes one.
- When to Declare a Variable
- There are many reasons to declare a variable, but if you’re cleaning up macro recorder code the first thing you’ll want to do is to remove the dependency on Selection and qualify Range and Cells member calls with a proper Worksheet object.
- Set: With or Without?
- The Set keyword modifies an assignment instruction and says “we’re assigning an object reference”, so VBA doesn’t try to check if there’s a default member on the left-hand side of the assignment operator, and the compiler expects an object reference on the right-hand side, …and then only throws at run-time when that isn’t the case – but because this information is all statically available at compile-time, Rubberduck can warn about such suspicious assignments.
- Using an explicit data/class/interface type, especially with objects, helps keep things early-bound, meaning both the compiler and static code analysis tools (like Rubberduck) can better tell what’s going on before the code actually gets to run.
- When NOT to Declare Variables
- Variables are so nice, sometimes we declare them even when we don’t need them. There are many valid reasons to use a variable, including abstracting the result of an expression behind its value. Assuming every variable is assigned and referenced somewhere, there are still certain variables that are always redundant!
  Objects are sneaky little things… not only can they have a default member that gets implicitly invoked, they can also have a default instance that lives in the global scope and is always named after the class it’s an instance of.
- Sprinkle Generously
  Variables are a simple but powerful tool in your arsenal. Using them enhances the abstraction level of your code, practices your brain to stop and think about naming things, can help prevent binding errors and remove implicit late-binding / keep your code entirely visible to the compiler and Rubberduck. Used wisely, variables can make a huge difference between messy and redundant macro-recorder code and squeaky-clean, professionally-written VBA code.
