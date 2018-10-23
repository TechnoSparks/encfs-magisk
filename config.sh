##########################################################################################
#
# Magisk Module Template Config Script
# by topjohnwu
#
##########################################################################################
##########################################################################################
#
# Instructions:
#
# 1. Place your files into system folder (delete the placeholder file)
# 2. Fill in your module's info into module.prop
# 3. Configure the settings in this file (config.sh)
# 4. If you need boot scripts, add them into common/post-fs-data.sh or common/service.sh
# 5. Add your additional or modified system properties into common/system.prop
#
##########################################################################################

##########################################################################################
# Configs
##########################################################################################

# Set to true if you need to enable Magic Mount
# Most mods would like it to be enabled
AUTOMOUNT=true

# Set to true if you need to load system.prop
PROPFILE=false

# Set to true if you need post-fs-data script
POSTFSDATA=false

# Set to true if you need late_start service script
LATESTARTSERVICE=false

##########################################################################################
# Installation Message
##########################################################################################

# Set what you want to show when installing your mod

print_modname() {
    ui_print "================================================"
    ui_print " EncFS v1.9.5"
    ui_print "================================================"
    ui_print "Built and provided by DualJoe"
    ui_print "Module proudly made by TechnoSparks"
    ui_print "Powered by Magisk (@topjohnwu)"
    ui_print " "
}

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info about how Magic Mount works, and why you need this

# This is an example
REPLACE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here, it will override the example above
# !DO NOT! remove this if you don't need to replace anything, leave it empty as it is now
REPLACE="
"

##########################################################################################
# Permissions
##########################################################################################

set_permissions() {
  # Only some special files require specific permissions
  # The default permissions should be good enough for most cases

  # Here are some examples for the set_perm functions:

  # set_perm_recursive  <dirname>                <owner> <group> <dirpermission> <filepermission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm_recursive  $MODPATH/system/lib       0       0       0755            0644

  # set_perm  <filename>                         <owner> <group> <permission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm  $MODPATH/system/bin/app_process32   0       2000    0755         u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0       2000    0755         u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0       0       0644

  # The following is default permissions, DO NOT remove
  set_perm_recursive  $MODPATH                0  0  0755  0644
  set_perm_recursive  $MODPATH/system/xbin    0  0  0755  0755
}

##########################################################################################
# Custom Functions
##########################################################################################

# This file (config.sh) will be sourced by the main flash script after util_functions.sh
# If you need custom logic, please add them here as functions, and call these functions in
# update-binary. Refrain from adding code directly into update-binary, as it will make it
# difficult for you to migrate your modules to newer template versions.
# Make update-binary as clean as possible, try to only do function calls in it.

extractAll() {
    if [ $ARCH = "arm64" ]; then
        ui_print "- Extracting arm64 binaries"
        unzip -o "$ZIP" 'arm64/*' -d $MODPATH >&2
        mv $MODPATH/arm64 $MODPATH/system
    elif [ $ARCH = "arm" ]; then
        ui_print "- Extracting arm binaries"
        unzip -o "$ZIP" 'arm/*' -d $MODPATH >&2
        mv $MODPATH/arm $MODPATH/system
    else
        ui_print "[!] Unrecognised architecture!"
        ui_print "    Binaries are for ARM only"
        ui_print "------------------------------------------------"
        abort
    fi
    unzip -o "$ZIP" README.md -d $MODPATH >&2
}

print_onFinish() {
    ui_print " "
    ui_print "[i] Flashing is done!"
    ui_print "------------------------------------------------"
}