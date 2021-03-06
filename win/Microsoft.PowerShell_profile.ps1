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

Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Invoke-Expression (&starship init powershell)
iex ($(lua 'C:\Users\Robin\scoop\apps\z.lua\current\z.lua' --init powershell) -join "`n")
# function prompt {"PS $pwd 🍭 >" }
