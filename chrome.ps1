$params = New-Object 'System.Collections.Generic.Dictionary[string,string]'

$params.Add('appguid', '{8A69D345-D564-463C-AFF1-A69D9E530F96}')
$params.Add('iid', '{7D7CAAF6-0F7A-3989-07FA-2A8380D458D2}')
$params.Add('lang', 'ja')
$params.Add('usagestats', '0')
$params.Add('ap', 'x64-stable-statsdef_1')
$params.Add('installdataindex', 'empty')

$tag = $params.Keys `
    | % {'{0}={1}' -f $_, $params[$_]} `
    | Join-String -Separator '&'

$url = 'https://dl.google.com/tag/s/{0}/update2/installers/ChromeSetup.exe' -f [System.Web.HttpUtility]::UrlEncode($tag)
$output = '{0}\ChromeSetup.exe' -f $env:TEMP

Write-Output $url
Invoke-WebRequest -Uri $url -OutFile $output

& $output
