# PowerShell Startup Profile

- Start a stop watch: `$StopWatch = [System.Diagnostics.Stopwatch]::StartNew()`
- Set `$EDITOR`: `$Env:EDITOR = code --wait`
- Set a *GLOBAL* variable for `ProfileInitialized`: `$global:ProfileInitialized = $false`
- Set variable for *Maximum History Count*: `$MaximumHistoryCount = 10000`
- Test Various Commands Exist:
	- `rg`
	- `choco`
	- `scoop`
	- `winget`
	- `dotnet`
	- `nuget`
	- `oh-my-posh`
	- `wt`
	- `code`
- Setup *dotfiles configuration*: `$script:PSDotfilesConfig = `