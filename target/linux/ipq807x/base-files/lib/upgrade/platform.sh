#
# Copyright (C) 2010 OpenWrt.org
#

PART_NAME=firmware
REQUIRE_IMAGE_METADATA=1

RAMFS_COPY_BIN='fw_printenv fw_setenv'
RAMFS_COPY_DATA='/etc/fw_env.config /var/lock/fw_printenv.lock'

platform_check_image() {
	return 0
}

platform_do_upgrade() {
	local board=$(board_name)

	case "$board" in
	xiaomi,ax3600 |\
	redmi,ax6)
		CI_UBIPART="$(awk -F 'ubi.mtd=' '{printf $2}' /proc/cmdline | sed -e 's/ .*$//')"
		if [ "$CI_UBIPART" = "" ]; then
			if [ "$(fw_printenv -n flag_boot_rootfs 2>/dev/null)" = "1" ]; then
				CI_UBIPART="rootfs_1"
			else
				CI_UBIPART="rootfs"
			fi
		fi
		nand_do_upgrade "$1"
		;;
	*)
		default_do_upgrade "$1"
		;;
	esac
}
