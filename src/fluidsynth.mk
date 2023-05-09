# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := fluidsynth
$(PKG)_WEBSITE  := http://fluidsynth.org/
$(PKG)_DESCR    := FluidSynth - a free software synthesizer based on the SoundFont 2 specifications
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.3.2
$(PKG)_CHECKSUM := cd610810f30566e28fb98c36501f00446a06fa6bae3dc562c8cd3868fe1c0fc7
$(PKG)_GH_CONF  := FluidSynth/fluidsynth/tags,v
$(PKG)_DEPS     := cc glib mman-win32

define $(PKG)_BUILD
    cd '$(BUILD_DIR)' && '$(TARGET)-cmake' '$(SOURCE_DIR)' \
        -Dbuild-bins=OFF \
        -Dbuild-docs=OFF \
        -Dbuild-tests=OFF \
        -Denable-dbus=OFF \
        -Denable-jack=OFF \
        -Denable-libsndfile=OFF \
        -Denable-portaudio=OFF \
        -Denable-readline=OFF \
        -Denable-aufile=OFF \
        -Denable-ipv6=OFF \
        -Denable-ladspa=OFF \
        -Denable-libinstpatch=OFF \
        -Denable-midishare=OFF \
        -Denable-opensles=OFF \
        -Denable-network=OFF \
        -Denable-dsound=OFF \
        -Denable-oss=OFF \
        -Denable-wasapi=OFF \
        -Denable-waveout=OFF \
        -Denable-winmidi=OFF \
        -Denable-sdl2=OFF \
        -Denable-pulseaudio=OFF \
        -Denable-threads=ON \
        $($(PKG)_CONFIGURE_OPTS)
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)' VERBOSE=1
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install VERBOSE=1

    # compile test
    '$(TARGET)-gcc' \
        -W -Wall -Werror -ansi -pedantic \
        -Wl,--allow-multiple-definition \
        '$(TEST_FILE)' -o '$(PREFIX)/$(TARGET)/bin/test-fluidsynth.exe' \
        `'$(TARGET)-pkg-config' --cflags --libs fluidsynth` -luuid
endef
