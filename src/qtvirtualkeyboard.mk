# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := qtvirtualkeyboard
$(PKG)_WEBSITE  := https://www.qt.io/
$(PKG)_DESCR    := Qt
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qtbase_VERSION)
$(PKG)_CHECKSUM := 5b31a91ea95562fa5d5ceb08b22b06adfcb20a2b90385f905a71dddb9dc88bf0
$(PKG)_SUBDIR    = $(subst qtbase,qtvirtualkeyboard,$(qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qtvirtualkeyboard,$(qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qtvirtualkeyboard,$(qtbase_URL))
$(PKG)_DEPS     := cc qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg

define $(PKG)_UPDATE
    echo $(qtbase_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && '$(PREFIX)/$(TARGET)/qt5/bin/qmake'
    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install
endef
