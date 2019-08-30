function open($file) {
  invoke-item $file
}

function explorer {
  explorer.exe .
}

function settings {
  start-process ms-setttings:
}

function limit-HomeDirectory($Path) {
  $Path.Replace("$home", "~")
}

function get-path {
	($Env:Path).Split(";")
}

function edit-powershell-profile {
	edit $profileDir
}

function update-powershell-profile {
	& $profile
}

# Like Unix touch, creates new files and updates time on old ones
# PSCX has a touch, but it doesn't make empty files
function touch($file) {
	if ( Test-Path $file ) {
		Set-FileTime $file
	} else {
		New-Item $file -type file
	}
}

function grep($regex, $dir) {
	if ( $dir ) {
		get-childitem $dir | select-string $regex
		return
	}
	$input | select-string $regex
}

function which($name) {
	Get-Command $name | Select-Object -ExpandProperty Definition
}

Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox
$DefaultUser = 'Robin'
iex ($(lua C:\Users\Robin\z.lua\z.lua --init powershell) -join "`n") 