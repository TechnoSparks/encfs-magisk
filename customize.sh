SKIPUNZIP=1
# must handle extraction manually

ui_print "- Identifying arch: $ARCH"
if [ "$ARCH" != "arm64" ] && [ "$ARCH" != "arm" ]; then
    ui_print "[!] Unrecognised architecture!"
    ui_print "    Binaries are for ARM only"
    ui_print "    Installation aborted"
    abort
fi

ui_print "- Extracting module files"
unzip -o "$ZIPFILE" -x 'META-INF/*' -d $MODPATH >&2

# Default permissions
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm_recursive $MODPATH/arm 0 2000 0755 0755
set_perm_recursive $MODPATH/arm64 0 2000 0755 0755
#set_perm_recursive $MODPATH/system/xbin 0 2000 0755 0755
#set_perm_recursive $MODPATH/system/system_ext/bin 0 2000 0755 0755
#set_perm_recursive $MODPATH/system/vendor/bin 0 2000 0755 0755 u:object_r:vendor_file:s0

ui_print "- Trimming non-compatible arch"
if [ "$ARCH" == "arm64" ]; then
    rm -rf $MODPATH/arm
    mv $MODPATH/arm64 $MODPATH/system
elif [ "$ARCH" == "arm" ]; then
    rm -rf $MODPATH/arm64
    mv $MODPATH/arm $MODPATH/system
fi

ui_print "- Preserve README!"
mv $MODPATH/README.md $MODPATH/Module-Readme.md