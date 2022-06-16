#!/system/bin/sh

MODDIR=${0%/*}

# todo: overlayfs?
mount --bind $MODDIR/system/apex/com.android.adbd/bin /apex/com.android.adbd/bin