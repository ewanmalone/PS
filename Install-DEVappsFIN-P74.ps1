
################################################################################
##  File:  Install-DEVappsFIN-P74.ps1
##  Desc:  Choco installs for AVD applications
################################################################################
Write-Output "Installing AVD DevApps no additional parameters"
$uninstall = false
$choco_apps = @(
    "postman",
    "soapui",
    "eclipse",
    "vscode",
    "nodejs-lts",
    "git",
    "filezilla",
    "winscp",
    "notepadplusplus",
    "putty"
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