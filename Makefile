#
# Copyright (C) 2012-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=musl-libc
PKG_VERSION:=1.2.3
PKG_RELEASE:=1

PKG_SOURCE:=musl-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://musl.libc.org/releases/
PKG_HASH:=7d5b0b6062521e4627e099e4c9dc8248d32a30285e959b7eecaa780cf8cfd4a4

PKG_BUILD_DIR:=$(BUILD_DIR)/musl-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/musl-libc
  SECTION:=libs
  CATEGORY:=Base system
  DEPENDS:=@!USE_MUSL
  TITLE:=musl libc
  URL:=https://musl.libc.org/
endef

define Package/musl-libc/description
  musl is a C standard library to power a new generation
  of Linux-based devices. It is lightweight, fast, simple,
  free, and strives to be correct in the sense of standards
  conformance and safety.
endef

define Package/musl-libc/install
	$(INSTALL_DIR) $(1)/lib
	$(CP) $(PKG_BUILD_DIR)/lib/libc.so $(1)/lib/ld-musl-$(ARCH).so.1
	$(LN) -sf ld-musl-$(ARCH).so.1 $(1)/lib/libc.musl-$(ARCH).so.1
endef

$(eval $(call BuildPackage,musl-libc))