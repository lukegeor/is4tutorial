$source = "https://github.com/IdentityServer/IdentityServer4.Quickstart.UI/archive/master.zip"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

if (!(Test-Path -Path ui))  { mkdir ui }
Push-Location -Path ui
Invoke-WebRequest $source -OutFile ui.zip
Expand-Archive ui.zip
Pop-Location

if (!(Test-Path -Path Quickstart))  { mkdir Quickstart }
if (!(Test-Path -Path Views))       { mkdir Views }
if (!(Test-Path -Path wwwroot))     { mkdir wwwroot }

Copy-Item .\ui\IdentityServer4.Quickstart.UI-master\Quickstart\* Quickstart -recurse -force
Copy-Item .\ui\IdentityServer4.Quickstart.UI-master\Views\* Views -recurse -force
Copy-Item .\ui\IdentityServer4.Quickstart.UI-master\wwwroot\* wwwroot -recurse -force

Remove-Item ui -recurse