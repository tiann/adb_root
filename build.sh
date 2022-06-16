#! /bin/bash

if [ "$1" = "clean" ];then
    cd adbd_helper && ndk-build clean
    exit
fi

(cd adbd_helper && ndk-build)

cp README.md magisk_module/
cp adbd_helper/libs/arm64-v8a/adbd magisk_module/system/apex/com.android.adbd/bin/adbd
cp adbd_helper/libs/arm64-v8a/libadb_root_helper.so magisk_module/system/lib64/

(cd magisk_module && zip -r ../adb_root.zip * -x "*.DS_Store")
