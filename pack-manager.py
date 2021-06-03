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
# * Path variables to shorten required hard linking. E.g. pack-path='this/is/a/path/*'
# * Arrays to loop through folder to pick out targets for Hard symlinks
# * Arrays to loop through folders for Junction symlinking
#
# Look at twitch-export-builder for how to replicate behaviour. https://gaz492.github.io/twitch-export-builder/usage and https://github.com/Gaz492/twitch-export-builder/.
#   NOTE There's also nothing stopping me from simply using the binaries by launching them via. this script or anything. Something to consider.
# This is a tad older and is made in Python, but it may still be helpful. https://github.com/cdbbnnyCode/modpack-installer.
# NOTE https://github.com/NillerMedDild/ModpackUploader
#
# This also looks like it is pretty much what I wanted, for the management side of installing mods and such and aside from the auto uploading releases part. https://github.com/dizzyd/mcdex
# NOTE Being a cli tool, this may also be rather helpful to use *in* this script. E.g. looping through an array that is piped to the install of mcdex... That could work. Will investigate.
# REMARK Didn't really work that well. Didn't bother testing *too* much, but it had errors from the beginning and wouldn't add mods without doing the path to the modpack. Too cumbersome.
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

import json

#‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾#
#                   Modlists                    #
#_______________________________________________#

# ["projectID", "fileID"]
# ["projectID"] # If a fileID is not specified, use latest available on curseforge
# Alternative: mods_performance.append(["354143", "3329629"])
# mods_performance = [
#     ["354143", "3329629"]  # Performant : v2-5-3.64m
# ]
# 
# mods_fixes = [
#     ["fixes_projectID", "fixes_fileID"]
# ]
# 
# mods_QoL = [
#     ["QoL_projectID", "QoL_fileID"]
# ]
# 
# mods_aesthetic = [
#     ["aesthetic_projectID", "aesthetic_fileID"]
# ]
# 
# mods_utility = [
#     ["utility_projectID", "utility_fileID"]
# ]
#  
# mods_general = [
#     ["general_projectID", "general_fileID"]
# ]

# test = []
# test.append(mods_fixes)
# test.append(mods_utility)

# modlist = [*mods_performance, *mods_fixes, *mods_utility, *mods_general]
# modlist = mods_performance + mods_fixes + mods_QoL + mods_aesthetic + mods_utility + mods_general

mods_performance = '[ "Performant": { "projectID":354143, "fileID":3329629, "Enabled": "true" }, ' \
                    '"Example": { "projectID":341453, "fileID":926233, "Enabled": "true" }]'

mods_fixes = '{ "projectID":"fixes_projectID", "fileID":fixes_fileID }'

modlist = mods_performance, mods_fixes

print(modlist["ProjectID"])

#‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾#
#           modlist exporter function           #
#_______________________________________________#

# Join the various mod lists
# Resolve urls and 'owner'
# Add to modlist following scheme

# Download link https://addons-ecs.forgesvc.net/api/v2/addon/${projectID}/file/${fileID}/download-url

# for x in mods:
#   add(x)

#‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾#
#           manifest exporter function          #
#_______________________________________________#

# Resolve projectID (unless specified in modlists)
# Specify fileID or grab latest
# Add to manifest following scheme

#‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾#
#               Exporter function               #
#_______________________________________________#

# import shutil
# import zipfile
# import os
# 
# # Create base import and export folders
# if not os.path.exists('.exports'):
#     os.makedirs('.exports')
# 
# # Create temporary folder for processing new release data.
# if not os.path.exists('.processing'):
#     os.makedirs('.processing')
# else: # I don't why I added this, but I remember it being for a reason and I'm afraid to remove it, so I'll just leave it...
#     shutil.rmtree('.processing')
# 
# # # Extract modpack zip file to '.processing'
# # # TODO currently hardcoded, fix later by making it grab whichever is placed in imports
# # with zipfile.ZipFile('.imports/All+the+Mods+6-1.6.4.zip', 'r') as zip_ref:
# #     zip_ref.extractall('.processing/')
# # 
# # # Copy mod addition configs to '.processing/overrides/config/'
# # shutil.copytree('.remix-patch/config', '.processing/overrides/config', symlinks=False, ignore=shutil.ignore_patterns('.ignore'), dirs_exist_ok=True)
# # 
# # # TODO Modify configuration files for already existing files using hardcoded values
# # # TODO Modify manifest.json and modlist.toml
# 
# # Package '.processing' into a zip file
# # TODO Make the export name variable and return import name with some additions like a version counter
# # e.g. a var for the import name, + -remix- + var for version counter or something
# shutil.make_archive('.exports/test', 'zip', '.processing')
# 
# # Delete '.processing'
# shutil.rmtree('.processing')