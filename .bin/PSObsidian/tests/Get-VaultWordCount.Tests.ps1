# Start by installing the Pester module if you haven't already done so
# Install-Module -Name Pester -Force -SkipPublisherCheck

# Import the necessary modules
Import-Module Pester

# Describe block for Get-VaultWordCount tests
Describe "Get-VaultWordCount Tests" {

    BeforeAll {

        . "$PSScriptRoot\..\src\Public\Get-WordCount.ps1"
        . "$PSScriptRoot\..\src\Public\Get-VaultWordCount.ps1"

        $TestFile = "$PSScriptRoot\TestFiles\file1.md"
        $TestVault = "$PSScriptRoot\TestFiles"

    }

    Context "When counting words in markdown files" {
        It "Returns the correct word count for single file" {
            # Arrange
            $testFilePath = $TestFile

            # Act
            $result = Get-VaultWordCount -FolderPath $testFilePath

            # Assert
            $result | Should -Be 92
        }

        It "Returns the correct word count for multiple files" {
            # Arrange
            $testFolderPath = $TestVault

            # Act
            $result = Get-VaultWordCount -FolderPath $testFolderPath

            # Assert
            $result | Should -Be 184
        }
    }

    Context "When ignoring specified file names" {
        It "Ignores the specified file names" {
            # Arrange
            $testFolderPath = "$PSScriptRoot\TestFiles"
            $expectedResult = 184  # Only counts words in file1.md and file2.md

            # Act
            $result = Get-VaultWordCount -FolderPath $testFolderPath

            # Assert
            $result | Should -Be $expectedResult
        }
    }

    Context "When ignoring specified folder names" {
        It "Should ignore .obsidian folder contents" {
            # Arrange
            $testFolderPath = "$PSScriptRoot\TestFiles\.obsidian"
            $expectedResult = 0

            # Act
            $result = Get-VaultWordCount -FolderPath $testFolderPath

            # Assert
            $result | Should -Be $expectedResult
        }
    }
}

# Run the tests
# Invoke-Pester
