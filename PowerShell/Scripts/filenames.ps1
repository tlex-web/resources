function filenames {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)]
        [string]$FolderPath = (Get-Location).Path,

        [Parameter(Position = 1)]
        [string]$OutputFile = "filenames.txt"
    )

    try {
        # Combine the current working directory and the generic output filename
        $outputPath = Join-Path -Path $FolderPath -ChildPath $OutputFile

        # Get the list of filenames in the specified folder
        $filenames = Get-ChildItem -Path $FolderPath | ForEach-Object { $_.Name }

        # Write the filenames to the specified output file
        $filenames | Out-File -FilePath $outputPath -Encoding UTF8

        Write-Host "File names copied to $outputPath."
    }
    catch {
        Write-Host "An error occurred: $_"
    }
}
