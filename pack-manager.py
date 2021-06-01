# Pack Manager
#
# This script exists to simplify development of Roots of Crystialis.
#
# Among its functions is symlinking various parts to the indev GDLauncher instance of Roots of Crystialis.
# It does this in two ways. It has a folder dedicated to 'all' configuration files that are not changed, and one for all that are.
# Using a variable or something similar, or just having the script be interactive, it copies these into '.processing' and joins them.
#   NOTE look at 'Example processing script' for an idea on how to accomplish this.
# Then it either takes a pre-built modlist.html and manifest.json, or generates it if I figure out how.
#   NOTE Look to 'Things of Interest' for more there.
#
# The script also does a few other things:
# * Automatically updating the version in manifest.json.
# * Pushing a new release on the GitHub repo, either on its own or in cojunction with a GitHub Actions that respond to tagging (if I figure that out)
# * (Optional) Releasing a new version on Curseforge
#   NOTE Only Releases will be available on Curseforge. The repository will contain Alphas, Betas and Releases.
#   NOTE Subject to change.
# * Path variables to shorten required hard linking
# * Arrays to loop through folder to pick out targets for Hard symlinks
# * Arrays to loop through folders for Junction symlinking
#
# Look at twitch-export-builder for how to replicate behaviour. https://github.com/Gaz492/twitch-export-builder/ and https://github.com/Gaz492/twitch-export-builder/.
#   NOTE There's also nothing stopping me from simply using the binaries by launching them via. this script or anything. Something to consider.
# This is a tad older and is made in Python, but it may still be helpful. https://github.com/tcheinen/twitch-modpack-exporter.
#
# This also looks like it is pretty much what I wanted, for the management side of installing mods and such and aside from the auto uploading releases part. https://github.com/dizzyd/mcdex
# NOTE Being a cli tool, this may also be rather helpful to use *in* this script. E.g. looping through an array that is piped to the install of mcdex... That could work. Will investigate.
#
# ---
#
# Things of interest:
#
# CurseForgeApp
## https://github.com/nathan130200/CurseForgeApp
### Found from: https://github.com/MultiMC/MultiMC5/issues/3422
#
# Curse-cli
## https://github.com/lupont/curse-cli
#
# Curse_api
## https://gist.github.com/crapStone/9a423f7e97e64a301e88a2f6a0f3e4d9
#
# GDLauncher
## export modlist.html: https://github.com/gorilla-devs/GDLauncher/pull/910/commits/cebb5dc57637aa445acfbaceca770fd64613e816
### return `<ul>${mappedMods
###      .map(
###        mod => `<li><a href=${mod?.url}>${mod?.name}(${mod?.author})</a></li>`
###      )
###      .join('')}</ul>`;
###  };
## https://github.com/gorilla-devs/GDLauncher/tree/master/src/common/modals
#
# ---
#
# Example processing script
#
# import shutil
# import zipfile
# import os
# 
# # Create base import and export folders
# if not os.path.exists('.exports'):
#     os.makedirs('.exports')
# if not os.path.exists('.imports'):
#     os.makedirs('.imports')
# 
# # Create temporary folder for processing new release data.
# if not os.path.exists('.processing'):
#     os.makedirs('.processing')
# else: # I don't why I added this, but I remember it being for a reason and I'm afraid to remove it, so I'll just leave it...
#     shutil.rmtree('.processing')
# 
# # Extract modpack zip file to '.processing'
# # TODO currently hardcoded, fix later by making it grab whichever is placed in imports
# with zipfile.ZipFile('.imports/All+the+Mods+6-1.6.4.zip', 'r') as zip_ref:
#     zip_ref.extractall('.processing/')
# 
# # Copy mod addition configs to '.processing/overrides/config/'
# shutil.copytree('.remix-patch/config', '.processing/overrides/config', symlinks=False, ignore=shutil.ignore_patterns('.ignore'), dirs_exist_ok=True)
# 
# # TODO Modify configuration files for already existing files using hardcoded values
# # TODO Modify manifest.json and modlist.toml
# 
# # Package '.processing' into a zip file
# # TODO Make the export name variable and return import name with some additions like a version counter
# # e.g. a var for the import name, + -remix- + var for version counter or something
# shutil.make_archive('.exports/test', 'zip', '.processing')
# 
# # Delete '.processing'
# shutil.rmtree('.processing')