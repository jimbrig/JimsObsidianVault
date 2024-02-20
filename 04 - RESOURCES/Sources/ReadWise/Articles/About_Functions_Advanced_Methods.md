---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_methods
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - About_Functions_Advanced_Methods
  - About_Functions_Advanced_Methods
---
# About_Functions_Advanced_Methods

## Metadata
- Author: [[sdwheeler]]
- Full Title: About_Functions_Advanced_Methods
- Category: #Type/Highlight/Article
- URL: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_methods

## Highlights
- Describes how functions that specify the `CmdletBinding` attribute can use the methods and properties that are available to compiled cmdlets. ([View Highlight](https://read.readwise.io/read/01gwx2w46hsgysqfkx87n50cbg))
- Functions that specify the `CmdletBinding` attribute can access additional methods and properties through the `$PSCmdlet` variable. These methods include the following methods: ([View Highlight](https://read.readwise.io/read/01gwx2w5p7f51h0h5hd9tve5tg))
- Input-processing methods that compiled cmdlets use to do their work. ([View Highlight](https://read.readwise.io/read/01gwx2w6bargxe7jjd7gff76ba))
- The `ShouldProcess` and `ShouldContinue` methods that are used to get user feedback before an action is performed. ([View Highlight](https://read.readwise.io/read/01gwx2w7khv2s4bp9tcybs64yd))
- The `ThrowTerminatingError` method for generating error records. ([View Highlight](https://read.readwise.io/read/01gwx2w86a97y9gbkjcyn6m19m))
- Several `Write` methods that return different types of output. ([View Highlight](https://read.readwise.io/read/01gwx2w8zzxkw27dahmqgazvxg))
- All the methods and properties of the **PSCmdlet** class are available to advanced functions. For more information, see [System.Management.Automation.PSCmdlet](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.pscmdlet). ([View Highlight](https://read.readwise.io/read/01gwx2wbnyxxma33afs3h2d5b1))
- For more information about the `CmdletBinding` attribute, see [about_Functions_CmdletBindingAttribute](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_cmdletbindingattribute?view=powershell-7.3). For the **CmdletBindingAttribute** class, see [System.Management.Automation.Cmdlet.CmdletBindingAttribute](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.cmdletbindingattribute). ([View Highlight](https://read.readwise.io/read/01gwx2wccwafrzdccrh0rq1nja))
- The methods described in this section are referred to as the input processing methods. For functions, these three methods are represented by the `begin`, `process`, and `end` blocks of the function. You aren't required to use any of these blocks in your functions. ([View Highlight](https://read.readwise.io/read/01gwx2wees38ewtmyezw5ctrfh))
- The following example shows the outline of a function that contains a `begin` block for one-time preprocessing, a `process` block for multiple record processing, and an `end` block for one-time post-processing. ([View Highlight](https://read.readwise.io/read/01gwx2wh19shdst0z1zajzcn0e))
- Using either a `begin` or `end` block requires that you define all three blocks. When using any block, all PowerShell code must be inside one of the blocks. ([View Highlight](https://read.readwise.io/read/01gwx2wrh9xhkep2vjsspkd5hx))
- PowerShell 7.3 adds a `clean` block process method. ([View Highlight](https://read.readwise.io/read/01gwx2x68tav06bca0772nrbmt))
- begin ([View Highlight](https://read.readwise.io/read/01gwx2xdchmzpk3kexppps69v9))
- This block is used to provide optional one-time preprocessing for the function. The PowerShell runtime uses the code in this block once for each instance of the function in the pipeline. ([View Highlight](https://read.readwise.io/read/01gwx2xdymqnb1g8qdcka8ecs5))
- process ([View Highlight](https://read.readwise.io/read/01gwx2xfa7cbbatsdr97g250zf))
- This block is used to provide record-by-record processing for the function. You can use a `process` block without defining the other blocks. The number of `process` block executions depends on how you use the function and what input the function receives. ([View Highlight](https://read.readwise.io/read/01gwx2xfzdvh4zqv7z3e2c2mq8))
- The automatic variable `$_` or `$PSItem` contains the current object in the pipeline for use in the `process` block. The `$input` automatic variable contains an enumerator that's only available to functions and script blocks. For more information, see [about_Automatic_Variables](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_automatic_variables?view=powershell-7.3). ([View Highlight](https://read.readwise.io/read/01gwx2xh64fezy0henx2thf47s))
- Calling the function at the beginning, or outside of a pipeline, executes the `process` block once. ([View Highlight](https://read.readwise.io/read/01gwx2xjp8h403hsc1p8kj6p90))
- Within a pipeline, the `process` block executes once for each input object that reaches the function. ([View Highlight](https://read.readwise.io/read/01gwx2xka2jm3wgab8bv7w5bww))
- If the pipeline input that reaches the function is empty, the `process` block **does not** execute.
  • The `begin` and `end` blocks still execute. ([View Highlight](https://read.readwise.io/read/01gwx2xksmdmptkxac76c5e4e7))
- Important ([View Highlight](https://read.readwise.io/read/01gwx2xnrwemnghxwvmaaebss5))
- If a function parameter is set to accept pipeline input, and a `process` block isn't defined, record-by-record processing will fail. In this case, your function will only execute once, regardless of the input. ([View Highlight](https://read.readwise.io/read/01gwx2xpe4tq77wemn2fq93acx))
- end ([View Highlight](https://read.readwise.io/read/01gwx2xqyfrs2hmv2nhkep0r0s))
- This block is used to provide optional one-time post-processing for the function. ([View Highlight](https://read.readwise.io/read/01gwx2xrk43dpyz9rdwkwv89xj))
- clean ([View Highlight](https://read.readwise.io/read/01gwx2xsecg2y33586y0t95m10))
- The `clean` block was added in PowerShell 7.3. ([View Highlight](https://read.readwise.io/read/01gwx2xv00ygk9mz5c739ws0zq))
- The `clean` block is a convenient way for users to clean up resources that span across the `begin`, `process`, and `end` blocks. It's semantically similar to a `finally` block that covers all other named blocks of a script function or a script cmdlet. Resource cleanup is enforced for the following scenarios: ([View Highlight](https://read.readwise.io/read/01gwx2xwaeg9s5benngs1318p8))
- when the pipeline execution finishes normally without terminating error ([View Highlight](https://read.readwise.io/read/01gwx2y501abhfzkxh8dswb3m1))
- when the pipeline execution is interrupted due to terminating error ([View Highlight](https://read.readwise.io/read/01gwx2y5tf2c39v4ps810tm02c))
- when the pipeline is halted by `Select-Object -First` ([View Highlight](https://read.readwise.io/read/01gwx2y6hp1whrpwedwh64y7pr))
- when the pipeline is being stopped by Ctrl+c or `StopProcessing()` ([View Highlight](https://read.readwise.io/read/01gwx2y759423rk94y9w84vgnc))
- Adding the `clean` block is a breaking change. Because `clean` is parsed as a keyword, it prevents users from directly calling a command named `clean` as the first statement in a script block. However, it's not likely to be a problem. The command can still be invoked using the call operator (`& clean`). ([View Highlight](https://read.readwise.io/read/01gwx2y94aa6qkzezvdchcb6jf))
- Confirmation methods ([View Highlight](https://read.readwise.io/read/01gwx2yk3595j4gyvdb1v9zx42))
- ShouldProcess ([View Highlight](https://read.readwise.io/read/01gwx2yksf9pwy3f5dv7rwwvqv))
- This method is called to request confirmation from the user before the function performs an action that would change the system. The function can continue based on the Boolean value returned by the method. This method can only be called only from within the `Process{}` block of the function. The `CmdletBinding` attribute must also declare that the function supports `ShouldProcess` (as shown in the previous example). ([View Highlight](https://read.readwise.io/read/01gwx2ymr80xfw8fx02qp9vjmq))
- For more information about how to request confirmation, see [Requesting Confirmation](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/requesting-confirmation). ([View Highlight](https://read.readwise.io/read/01gwx2yshg7yce6hh2pezp6639))
- ShouldContinue ([View Highlight](https://read.readwise.io/read/01gwx2ytceap7a7vsrxp7pz9zg))
- This method is called to request a second confirmation message. It should be called when the `ShouldProcess` method returns `$true`. For more information about this method, see [System.Management.Automation.Cmdlet.ShouldContinue](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.cmdlet.shouldcontinue). ([View Highlight](https://read.readwise.io/read/01gwx2ytz75kg4c8pbhcb10s56))
- Error methods ([View Highlight](https://read.readwise.io/read/01gwx2yxspj4ytyf6gyfpfan17))
- Functions can call two different methods when errors occur. When a non-terminating error occurs, the function should call the `WriteError` method, which is described in the `Write` methods section. When a terminating error occurs and the function can't continue, it should call the `ThrowTerminatingError` method. You can also use the `Throw` statement for terminating errors and the [Write-Error](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-error?view=powershell-7.3) cmdlet for non-terminating errors. ([View Highlight](https://read.readwise.io/read/01gwx2yydv19eznexam6s261kt))
- Write methods ([View Highlight](https://read.readwise.io/read/01gwx2z0k03xj6yqtjy6n0hsw6))
- A function can call the following methods to return different types of output. Notice that not all the output goes to the next command in the pipeline. You can also use the various `Write` cmdlets, such as `Write-Error`. ([View Highlight](https://read.readwise.io/read/01gwx2z16s1aargap2s26a0gfe))
- WriteCommandDetail ([View Highlight](https://read.readwise.io/read/01gwx2z1wngap9eqhj2axrftpb))
- For information about the `WriteCommandDetails` method, see [System.Management.Automation.Cmdlet.WriteCommandDetail](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.cmdlet.writecommanddetail). ([View Highlight](https://read.readwise.io/read/01gwx2z3myg31r72p1dyf1zea7))
- WriteDebug ([View Highlight](https://read.readwise.io/read/01gwx2z4c1681yjsnavrmdmnag))
- To provide information that can be used to troubleshoot a function, make the function call the `WriteDebug` method. The `WriteDebug` method displays debug messages to the user. For more information, see [System.Management.Automation.Cmdlet.WriteDebug](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.cmdlet.writedebug). ([View Highlight](https://read.readwise.io/read/01gwx2z50gytpsczx741w1tf5b))
- WriteError ([View Highlight](https://read.readwise.io/read/01gwx2z6nv9m95239s5xcktgnh))
- Functions should call this method when non-terminating errors occur and the function is designed to continue processing records. For more information, see [System.Management.Automation.Cmdlet.WriteError](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.cmdlet.writeerror). ([View Highlight](https://read.readwise.io/read/01gwx2z78zmctn51y6eq1cggdg))
- Note ([View Highlight](https://read.readwise.io/read/01gwx2z8p5fmbe2j6dz8qmx44r))
- If a terminating error occurs, the function should call the [ThrowTerminatingError](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.cmdlet.throwterminatingerror) method. ([View Highlight](https://read.readwise.io/read/01gwx2z9dkkgpsktrw7v6nqn23))
- WriteObject ([View Highlight](https://read.readwise.io/read/01gwx2za3h0z0t61m8yqn2svxv))
- The `WriteObject` method allows the function to send an object to the next command in the pipeline. In most cases, `WriteObject` is the method to use when the function returns data. For more information, see [System.Management.Automation.PSCmdlet.WriteObject](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.cmdlet.writeobject). ([View Highlight](https://read.readwise.io/read/01gwx2zam5y1vtdjb1v667xwtn))
- WriteProgress ([View Highlight](https://read.readwise.io/read/01gwx2zc5chx8xnshz3j4x5mjn))
- For functions with actions that take a long time to complete, this method allows the function to call the `WriteProgress` method so that progress information is displayed. For example, you can display the percent completed. For more information, see [System.Management.Automation.PSCmdlet.WriteProgress](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.cmdlet.writeprogress). ([View Highlight](https://read.readwise.io/read/01gwx2ze4cg7mavcvpk11dkw1w))
- WriteVerbose ([View Highlight](https://read.readwise.io/read/01gwx2zdbzqs1r9evqapq1zdnk))
- To provide detailed information about what the function is doing, make the function call the `WriteVerbose` method to display verbose messages to the user. By default, verbose messages aren't displayed. For more information, see [System.Management.Automation.PSCmdlet.WriteVerbose](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.cmdlet.writeverbose). ([View Highlight](https://read.readwise.io/read/01gwx2zfexxr9d18wmw4rkjx12))
- WriteWarning ([View Highlight](https://read.readwise.io/read/01gwx2zg6nh9jkm9gbxgk23yjk))
- To provide information about conditions that may cause unexpected results, make the function call the WriteWarning method to display warning messages to the user. By default, warning messages are displayed. For more information, see [System.Management.Automation.PSCmdlet.WriteWarning](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.cmdlet.writewarning). ([View Highlight](https://read.readwise.io/read/01gwx2zh6tegh4kknktpwxe4jm))
- You can also display warning messages by configuring the `$WarningPreference` variable or by using the `Verbose` and `Debug` command-line options. for more information about the `$WarningPreference` variable, see [about_Preference_Variables](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_preference_variables?view=powershell-7.3). ([View Highlight](https://read.readwise.io/read/01gwx2zjnakdbknfpqc36y77z1))
- Other methods and properties ([View Highlight](https://read.readwise.io/read/01gwx2zmegg2nre28x77bjgwyg))
- For information about the other methods and properties that can be accessed through the `$PSCmdlet` variable, see [System.Management.Automation.PSCmdlet](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.pscmdlet). ([View Highlight](https://read.readwise.io/read/01gwx2zn19kqe7q79eqb0qex9t))
- For example, the [ParameterSetName](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.pscmdlet.parametersetname) property allows you to see the parameter set that's being used. Parameter sets allow you to create a function that performs different tasks based on the parameters that are specified when the function is run. ([View Highlight](https://read.readwise.io/read/01gwx2znpe7c8r2ay8y41fk3e2))
