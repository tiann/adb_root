#!/system/bin/sh

ADBD_APEX="/apex/com.android.adbd/"

install() {

    SYSTEM_ADBD_PATH="$ADBD_APEX/bin/adbd"
    SYSTEM_ADBD_PATH_REAL="$SYSTEM_ADBD_PATH.real"

    MOD_ADBD_PATH="$MODPATH/system/apex/com.android.adbd/bin/adbd"
    MOD_ADBD_PATH_REAL="$MOD_ADBD_PATH.real"

    if [ -e $SYSTEM_ADBD_PATH_REAL ];then
        ui_print "backup $SYSTEM_ADBD_PATH_REAL.."
        cp -f $SYSTEM_ADBD_PATH_REAL "$MOD_ADBD_PATH_REAL"
    else
        ui_print "backup $SYSTEM_ADBD_PATH.."
        cp -f $SYSTEM_ADBD_PATH "$MOD_ADBD_PATH_REAL"
    fi

    ui_print "set permissions.."
    chmod +x "$MOD_ADBD_PATH"
    chcon --reference=$SYSTEM_ADBD_PATH "$MOD_ADBD_PATH" "$MOD_ADBD_PATH_REAL"
}

if [ -d "$ADBD_APEX" ]; then
    ui_print "replacing adbd.."

    install
else
    echo "ro.debuggable=1" >> "$MODPATH"/system.prop
fi

ui_print "adb_root installed"
