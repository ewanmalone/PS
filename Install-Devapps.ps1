################################################################################
##  File:  Install-DEVapps.ps1
##  Desc:  Choco installs for AVD applications
################################################################################
Write-Output "Installing AVD Apps no additional parameters"
$uninstall = false
$choco_apps = @(
    "git",
    "gitextensions",
    "oraclejdk",
    "oracle-sql-developer",
    "sql-server-management-studio",
    "vscode",
    "visualstudio2022professional",
    "winmerge",
    "7zip", 
    "adobereader", 
    "azure-data-studio",
    "duo-authentication",
    "filezilla",
    "googlechrome",
    "microsoft-edge",
    "msvisualcplusplus2012-redist",
    "msvisualcplusplus2013-redist",
    "vcredist140",
    "microsoft-build-tools",
    "notepadplusplus"
)

foreach ($app in $choco_apps) {
    Write-Host "Installing ${app} using Chocolatey binaries"
    $ver = $app -split ":"
    if ($uninstall) {
        if ($ver.count -gt 1) {
            choco uninstall $ver[0] --version=$ver[1]
        }
        else {
            choco uninstall $app
        }
    }
    else {
        if ($ver.count -gt 1) {
            choco install $ver[0] --version=$ver[1]
        }
        else {
            choco install $app
        }
    }
}
