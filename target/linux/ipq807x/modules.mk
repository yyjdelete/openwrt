define KernelPackage/phy-qca807x
  SUBMENU:=$(NETWORK_DEVICES_MENU)
  TITLE:=Qualcomm QCA807X PHYs driver
  DEPENDS:=@TARGET_ipq807x +kmod-of-mdio
  KCONFIG:= CONFIG_QCA807X_PHY
  FILES:= $(LINUX_DIR)/drivers/net/phy/qca807x.ko
  AUTOLOAD:=$(call AutoProbe,phy-qca807x)
endef

define KernelPackage/phy-qca807x/description
 Currently supports the QCA8072 and QCA8075 models.
endef

$(eval $(call KernelPackage,phy-qca807x))
