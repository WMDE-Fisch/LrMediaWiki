# Development environment

* Install Adobe Lightroom Classic SDK

* Install a programming editor. "Atom" migt be a good choice.
  Install Lua syntax highlighting. It helps a lot!

* If not done yet, get a GitHub account.

* Fork the project from the "Hasenläufer" fork.

* Get a local GUI for GitHub. "GitKraken" is a good choice.

# Release build prerequsites

* For usage of the release script release.sh, it is needed to have a valid
GITHUB_TOKEN. Go to your GitHub account, generate a token and set the
environment variable to this token, like
  export GITHUB_TOKEN=abcdef
in .profile or .zprofile.

* Obtaining your GitHub personal access token
Sign in to your GitHub account. Change the settings for your GitHub profile by
clicking your profile image in the upper right, and then click Settings.
At the bottom of the left menu, in the Developer settings section, click
the Personal access tokens link.

* luac and luacheck
luac (the Lua compiler) and luacheck (a lua "lint" validator and check program)
are both used in "my-luacheck.sh".
luac is of low priority, luacheck is of high priority.
Both tools are used to identify syntax errors of the lua files.
** luac is part of the Adobe Lightroom SDK
** luacheck can be installed by
     homebrew install luacheck

# Build a release

* Use "my-luacheck.sh" to check the lua files. Fix any error and warning.
  It's a good idea to have an open command line window and run
  "scripts/my-luacheck.sh" after every edit of the lua files.

* Edit "Info.lua" and set a new release number.

* Edit "CHANGELOG.md" and add a description of the changes.

* Commit the changes with an appropriate commit comment.

* Push all

* Go to the Web GUI of GitHub and publish a new release.
  Use a syntax like "v1.42".

* In your local command line run "scripts/release.sh".