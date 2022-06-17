#!/system/bin/sh
MODDIR=${0%/*}

max_wait=180
interval=1
BOOT_COMPLETED=false
while [[ "$max_wait" -gt 0 ]]; do
  pidof adbd
  ret=$0
  if [ $ret -eq 0 ];then
    BOOT_COMPLETED=true
    break
  fi
  sleep ${interval}
  max_wait=$((max_wait-1))
done

if [ "$BOOT_COMPLETED" = "false" ];then
    touch $MODDIR/disable
fi