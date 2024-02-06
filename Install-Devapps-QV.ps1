################################################################################
##  File:  Install-DEVapps.ps1
##  Desc:  Choco installs for AVD applications
################################################################################
Write-Output "Installing AVD DevApps no additional parameters"
$uninstall = false
$choco_apps = @(
    "git",
    "gitextensions",
    "oraclejdk",
    "sql-server-management-studio",
    "visualstudio2022professional",
    "visualstudio2022-workload-manageddesktop",
    "visualstudio2022-workload-netweb",
    "visualstudio2022-workload-azure",
    "visualstudio2022-workload-data",
    "vscode",
    "sql-server-2022",
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
    "notepadplusplus",
    "powerbi"
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

#Write-Output "Installing AVD DevApps with additional parameters"
#choco install -y oracle-sql-developer --params="'/Username:uitem@leeds.ac.uk /Password:SuperPassword123!'"
