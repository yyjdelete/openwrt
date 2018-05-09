include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/version.mk

PKG_NAME:=qca-9984-wifi
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Compile
endef

#ALLWIFIBOARDS:=<devicename>
ALLWIFIBOARDS:=netgear_orbipro
ALLWIFIPACKAGES:=$(foreach BOARD,$(ALLWIFIBOARDS),qca-9984-wifi-$(BOARD))

define Package/qca-9984-wifi-default
  SUBMENU:=ath10k QCA9948 Boarddata
  SECTION:=firmware
  CATEGORY:=Firmware
  TITLE:=Custom Board
endef

define generate-qca-9984-wifi-package
  define Package/qca-9984-wifi-$(1)
    $(call Package/qca-9984-wifi-default)
    TITLE:=Board for $(3)
    CONFLICTS:=$(PREV_BOARD)
  endef

  define Package/qca-9984-wifi-$(1)/description
This device custom package board-2.bin overwrites the board-2.bin
file which is supplied by the ath10k-firmware-qca9984 package.

This is package is only necessary for the $(3).
Don't install it for any other device!
  endef

  define Package/qca-9984-wifi-$(1)/install-overlay
	$(INSTALL_DIR) $$(1)/lib/firmware/ath10k/QCA9984/hw1.0
	$(INSTALL_DATA) ./$(2) $$(1)/lib/firmware/ath10k/QCA9984/hw1.0/board-2.bin
  endef

  PREV_BOARD+=qca-9984-wifi-$(1)
endef

#$(eval $(call generate-qca-9984-wifi-package,<devicename>,<filename>,<displayname>))
$(eval $(call generate-qca-9984-wifi-package,netgear_orbipro,board-netgear_orbipro.bin,Netgear Orbi Pro))

$(foreach PACKAGE,$(ALLWIFIPACKAGES),$(eval $(call BuildPackage,$(PACKAGE))))
