# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := qtcoap
$(PKG)_WEBSITE  := https://www.qt.io/
$(PKG)_DESCR    := Qt
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qtbase_VERSION)
$(PKG)_CHECKSUM := ed783b3004fafd1a6353feafd9cb58b1d6be1d408958e0ba2edd95a15a0125af
$(PKG)_SUBDIR    = $(subst qtbase,qtcoap,$(qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qtcoap,$(qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qtcoap,$(qtbase_URL))
$(PKG)_DEPS     := cc qtbase

define $(PKG)_UPDATE
    echo $(qtbase_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && '$(PREFIX)/$(TARGET)/qt5/bin/qmake'
    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install
endef
