Function Initialize-GitHubRepo {
    <#
    .SYNOPSIS
        Initializes a GitHub Repository with various files and folders.
    .DESCRIPTION
        This function will initialize a GitHub Repository with various files and folders.
        See Notes for more details.
    .NOTES
        Specifically, it will create the following files and folders:

        - `.gitattributes`: Used to specify the language of the repository.
        - `.gitignore`: Used to specify which files and folders to ignore.
        - `.editorconfig`: Used to specify the editor configuration.
        - `README.md`: Used to specify the repository's description.
        - `LICENSE.md`: Used to specify the repository's license.
        - `CHANGELOG.md`: Used to specify the repository's changelog.
        - `.github/`: Used to specify GitHub-specific files and folders.
            - `ISSUE_TEMPLATE/`: Used to specify issue templates.
                - `bug_report.md`: Used to specify the bug report template.
                - `feature_request.md`: Used to specify the feature request template.
            - `PULL_REQUEST_TEMPLATE.md`: Used to specify the pull request template.
            - `CODEOWNERS`: Used to specify the repository's code owners.
            - `CONTRIBUTING.md`: Used to specify the repository's contributing guidelines.
            - `SECURITY.md`: Used to specify the repository's security policy.
            - `SUPPORT.md`: Used to specify the repository's support policy.
            - `FUNDING.yml`: Used to specify the repository's funding sources.
            - `dependabot.yml`: Used to specify the repository's Dependabot configuration.
            - `stale.yml`: Used to specify the repository's stale configuration.
            - `workflows/`: Used to specify GitHub Actions workflows.
                - `changelog.yml`: Action to update CHANGELOG.md.
        - `.vscode/`: VSCode settings, extensions, etc.
            - `settings.json`
            - `extensions.json`
            - `tasks.json`
            - `launch.json`
            - `keybindings.json`
            - `snippets/`
                - `powershell.json`
        - `.devcontainer/`: VSCode Dev Container settings.
            - `devcontainer.json`
            - `Dockerfile`
            - `docker-compose.yml`
    #>
    [CmdletBinding()]
    Param(
        # The owner of the GitHub Repository.
        [Parameter(Mandatory = $true)][string] $Owner,
        # The name of the GitHub Repository.
        [Parameter(Mandatory = $true)][string] $Repo,
        # The path to the directory containing the files and folders to add.
        [Parameter(Mandatory = $true)][string] $Path,
        # The GitHub Personal Access Token to use.
        [Parameter(Mandatory = $true)][string] $Token
    )
    $repo = Get-GitHubRepo -Owner $Owner -Repo $Repo
}

Function Add-GitHubMetadata {
    <#
    .SYNOPSIS
        Adds GitHub Linguist Overrides to Repository's `.gitattributes`.


    #>
}
