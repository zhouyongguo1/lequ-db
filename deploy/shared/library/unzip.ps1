#!powershell

# WANT_JSON
# POWERSHELL_COMMON

$params = Parse-Args $args;

$result = New-Object psobject @{
    unzip = New-Object psobject
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
    # create tmp dir
    $base_name = [System.IO.Path]::GetFileNameWithoutExtension($src)
    $tmp_dest = Join-Path $Env:Temp "${base_name}.unzipping"
    if (Test-Path $tmp_dest) {
        Remove-Item $tmp_dest -Recurse
    }
    New-Item $tmp_dest -ItemType directory

    # unzip to tmp dir
    $shell_app = New-Object -Com shell.application
    $zip_file = $shell_app.namespace($src)
    $shell_app.namespace($tmp_dest).Copyhere($zip_file.items())

    # backup and rename
    $backup = "${dest}.bak"
    if (Test-Path $backup) {
        Remove-Item $backup -Recurse
    }
    if (Test-Path $dest) {
        Rename-Item $dest $backup
    }
    $dest_parent = Split-Path $dest
    Move-Item $tmp_dest $dest_parent
    Rename-Item (Join-Path $dest_parent "${base_name}.unzipping") $dest

    $result.changed = $true
}
Catch {
    Fail-Json $result "Error unzipping ${src} to ${dest}: $($_.Exception.Message)"
}

Set-Attr $result.copy "src" $src
Set-Attr $result.copy "dest" $dest

Exit-Json $result;
