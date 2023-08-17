#!/bin/bash

# Binaries
basename="/usr/bin/basename"
dirname="/usr/bin/dirname"
munkipkg="/usr/local/munki-pkg/munkipkg"
PlistBuddy="/usr/libexec/PlistBuddy"
python3="/Library/ManagedFrameworks/Python/Python3.framework/Versions/Current/bin/python3"
rm="/bin/rm"

# Change to this project's directory
project_folder=$(${dirname} "$0")
cd "${project_folder}"

# Determine variables to make this script more generic
pkg_name="$(${basename} ${PWD})"
pkg_version="$(${PlistBuddy} -c 'print version' ./build-info.plist)"

# Delete stray .DS_Store file in /payload
# This fixes the error: The operation couldn’t be completed. Can't find "." in bom file
if [[ -e ./payload/.DS_Store ]]; then
 ${rm} ./payload/.DS_Store
fi

# Build the pkg
# Normally, we'd run `${python3} ${munkipkg} .` but instead we're exporting Bom info to Bom.txt for Git tracking of permissions
# If building this package after running `git clone`, be sure to run `${python3} ${munkipkg} --sync .` first
${python3} ${munkipkg} --export-bom-info .

exit
