#
# Copyright (C) 2018 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define KernelPackage/i2c-tlc59208f
  SUBMENU:=$(LEDS_MENU)
  TITLE:=TI TLC59208F driver
  KCONFIG:=CONFIG_I2C_TLC59208F
  FILES:=$(LINUX_DIR)/drivers/i2c/i2c-tlc59208f.ko
  AUTOLOAD:=$(call AutoLoad,60,i2c-tlc59208f)
endef

define KernelPackage/i2c-tlc59208f/description
 Driver for the TI TLC59208F I2C 8 bit LED
 driver
endef

$(eval $(call KernelPackage,i2c-tlc59208f))
