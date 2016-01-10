#!powershell

# WANT_JSON
# POWERSHELL_COMMON

$params = Parse-Args $args;

$result = New-Object psobject @{
    win_get_url_2 = New-Object psobject
    changed = $false
}

If ($params.url) {
    $url = $params.url
}
Else {
    Fail-Json $result "mising required argument: url"
}

If ($params.dest) {
    $dest = $params.dest
}
Else {
    Fail-Json $result "missing required argument: dest"
}

If ($params.url_username) {
    $credentials = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $params.url_username,$params.url_password)))
    $headers = @{Authorization=("Basic {0}" -f $credentials)}
}
Else {
    $headers = @{}
}

Try {
    $tmp_dest = "${dest}.downloading"
    Invoke-RestMethod -Headers $headers $url -Method Get -OutFile $tmp_dest
    Move-Item $tmp_dest $dest
    $result.changed = $true
}
Catch {
    Fail-Json $result "Error downloading ${url} to ${dest}: $($_.Exception.Message)"
}

Set-Attr $result.win_get_url_2 "url" $url
Set-Attr $result.win_get_url_2 "dest" $dest

Exit-Json $result;
