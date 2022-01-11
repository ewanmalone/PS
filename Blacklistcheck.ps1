$IP = Get-Content ".\ips.txt" 

foreach ($UIP in $IP) {

$reversedIP = ($UIP -split '\.')[3..0] -join '.'

$blacklistServers = @(
    'zen.spamhaus.org'
)

$blacklistedOn = @()


foreach ($server in $blacklistServers)
{
    $fqdn = "$reversedIP.$server"

    try
    {
        $null = [System.Net.Dns]::GetHostEntry($fqdn)
        $blacklistedOn += $server
    }
    catch { }
}

if ($blacklistedOn.Count -gt 0)
{

   Write-Host "$UIP is currently blacklisted on SpamHaus."
}
else
{
    Write-Host "$UIP is not currently blacklisted."
}
}
