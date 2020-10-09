on pathExists(thePath)
	if thePath starts with "~" then set thePath to POSIX path of (path to home folder) & text 3 thru -1 of (get thePath)
	try
		POSIX file thePath as alias
		return true
	on error
		return false
	end try
end pathExists

set theResponse to display dialog "Enter your home directory name or username" default answer "" with icon note buttons {"Cancel", "Continue"} default button "Continue"
display dialog "Do you want to remove the Discord cache?" with icon note buttons {"Cancel", "Continue"} default button "Continue"

set canaryDirectory to "Macintosh HD:Users:" & (text returned of theResponse) & ":Library:Application Support:discordcanary:Cache"
set stableDirectory to "Macintosh HD:Users:" & (text returned of theResponse) & ":Library:Application Support:discord:Cache"

if pathExists("~/Library/Application Support/discordcanary/Cache/") = true then
	tell application "Finder"
		delete (every item of folder canaryDirectory)
	end tell
end if


if pathExists("~/Library/Application Support/discord/Cache/") = true then
	tell application "Finder"
		delete (every item of folder stableDirectory)
	end tell
end if
