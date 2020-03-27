function open($file) {
  invoke-item $file
}

function explorer {
  explorer.exe .
}

function limit-HomeDirectory($Path) {
  $Path.Replace("$home", "~")
}

function get-path {
	($Env:Path).Split(";")
}

function profile {
	invoke-item $profile
}

function profile-update {
	& $profile
}

function make-link ($target, $link) {
    New-Item -Path $link -ItemType SymbolicLink -Value $target
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

function gst {
	git status
}

Import-Module posh-git
Import-Module oh-my-posh
Import-Module PSColor
Set-Theme Paradox
$DefaultUser = '11103475'
iex ($(lua 'C:\Users\11103475\scoop\shims\z.lua' --init powershell) -join "`n")
# function prompt {"PS $pwd 🍭 >" }
