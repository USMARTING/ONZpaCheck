Try {
	$url = Invoke-WebRequest "http://ip.zscaler.com/"
    $OnZPA = $false
    $checkzscaler = ($URL.ParsedHtml.getElementsByTagName('div') | where{ $_.className -eq 'headline' }).innertext
    $OnZPA = $checkzscaler -like "You are accessing the Internet via Zscaler Cloud:*"
}
catch {

		Write-Output "No Internet Access : $($_.Exception.Response.StatusCode.Value__) - $($_.Exception.Response.StatusDescription)"
		Exit 0
}
return $OnZPA
