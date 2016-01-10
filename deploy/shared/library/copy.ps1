#!powershell

# WANT_JSON
# POWERSHELL_COMMON

$params = Parse-Args $args;

$result = New-Object psobject @{
    copy = New-Object psobject
    changed = $false
}

If ($params.src) {
    $src = $params.src
}
Else {
    Fail-Json $result "mising required argument: src"
}

If ($params.dest) {
    $dest = $params.dest
}
Else {
    Fail-Json $result "missing required argument: dest"
}


Try {
    Move-Item $src $dest -Force
    $result.changed = $true
}
Catch {
    Fail-Json $result "Error copying $src to $dest"
}

Set-Attr $result.copy "src" $src
Set-Attr $result.copy "dest" $dest

Exit-Json $result;
