$root = "C:\Users\Admin\Desktop\Android\ho so du an fnb"
$files = Get-ChildItem -Path $root -Recurse -File
$mdFiles = @($files | Where-Object { $_.Extension -eq '.md' })
$otherFiles = @($files | Where-Object { $_.Extension -ne '.md' })
$dirs = Get-ChildItem -Path $root -Recurse -Directory

Write-Host "Total Dirs: $($dirs.Count)"
Write-Host "Total Files: $($files.Count)"
Write-Host "Markdown Files: $($mdFiles.Count)"
Write-Host "Other Files: $($otherFiles.Count)"

$sensitive = @('.env', '*.key', '*.pem', '*.p12', '*.jks', 'google-services.json', '*secret*', '*token*', '*password*')
$foundSensitive = @()
foreach ($f in $files) {
    foreach ($s in $sensitive) {
        if ($f.Name -like $s) {
            $foundSensitive += $f.FullName
        }
    }
}
Write-Host "Sensitive files found: $($foundSensitive.Count)"
foreach ($fs in $foundSensitive) {
    Write-Host "  -> $fs"
}
