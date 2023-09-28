package=qt
$(package)_version=6.5.3
$(package)_download_path=https://download.qt.io/official_releases/qt/6.5/$($(package)_version)/submodules
$(package)_suffix=everywhere-src-$($(package)_version).tar.xz
$(package)_file_name=qtbase-$($(package)_suffix)
$(package)_sha256_hash=df2f4a230be4ea04f9798f2c19ab1413a3b8ec6a80bef359f50284235307b546
$(package)_darwin_dependencies=native_cctools native_qt openssl
$(package)_mingw32_dependencies=openssl native_qt
$(package)_linux_dependencies=openssl native_qt freetype fontconfig libxcb libxkbcommon libxcb_util libxcb_util_render libxcb_util_keysyms libxcb_util_image libxcb_util_wm libxcb_util_cursor dbus
$(package)_patches += fast_fixed_dtoa_no_optimize.patch
$(package)_patches += guix_cross_lib_path.patch
$(package)_patches += qtbase-moc-ignore-gcc-macro.patch
$(package)_patches += qtmultimedia-fixes.patch
$(package)_patches += rcc_hardcode_timestamp.patch
$(package)_patches += root_CMakeLists.txt
$(package)_patches += v4l2.patch
$(package)_patches += windows_func_fix.patch
$(package)_patches += revert_f99ee441.patch
$(package)_patches += xcb-util-image-fix.patch
$(package)_patches += libxau-fix.patch
$(package)_patches += toolchain.cmake
#$(package)_patches += fix-static-fontconfig-static-linking.patch

$(package)_qttools_file_name=qttools-$($(package)_suffix)
$(package)_qttools_sha256_hash=fc91d32b3f696725bbb48b0df240c25b606bbee3bd22627cfcbee876a6405e37

$(package)_qtsvg_file_name=qtsvg-$($(package)_suffix)
$(package)_qtsvg_sha256_hash=fc41c47b69ca1f80473cd4b11996394155781105345392961d064d04f95d5bef

$(package)_qtwebsockets_file_name=qtwebsockets-$($(package)_suffix)
$(package)_qtwebsockets_sha256_hash=04e2ae17594d56cf2930c99dbd2a97eb88ff514b445c17ff7b86e8978fc7a7c3

$(package)_qtmultimedia_file_name=qtmultimedia-$($(package)_suffix)
$(package)_qtmultimedia_sha256_hash=ed64f3d2bb98c20cd12df19dbf84dc0233d9fcb2078fea812adf42eef9a0ff27

$(package)_qtshadertools_file_name=qtshadertools-$($(package)_suffix)
$(package)_qtshadertools_sha256_hash=201b7b3a409f048e78c5defb90a70af423166313ad4386f8e6b83990ae0f3573

$(package)_extra_sources += $($(package)_qttools_file_name)
$(package)_extra_sources += $($(package)_qtsvg_file_name)
$(package)_extra_sources += $($(package)_qtwebsockets_file_name)
$(package)_extra_sources += $($(package)_qtmultimedia_file_name)
$(package)_extra_sources += $($(package)_qtshadertools_file_name)

define $(package)_set_vars
$(package)_config_opts += -DQT_HOST_PATH=$(build_prefix)/qt-host
$(package)_config_opts += -DCMAKE_LIBRARY_PATH=/home/user/.guix-profile/lib
$(package)_config_opts += -DBUILD_SHARED_LIBS=OFF
$(package)_config_opts += -DCMAKE_INSTALL_PREFIX=$(host_prefix)
$(package)_config_opts += -DINSTALL_LIBEXECDIR=$(build_prefix)/bin
$(package)_config_opts += -DQT_BUILD_EXAMPLES=FALSE
$(package)_config_opts += -DQT_BUILD_TESTS=FALSE
$(package)_config_opts += -DCMAKE_TOOLCHAIN_FILE=toolchain.cmake

$(package)_config_opts += -DINPUT_cups=no
$(package)_config_opts += -DINPUT_egl=no
$(package)_config_opts += -DINPUT_eglfs=no
$(package)_config_opts += -DINPUT_evdev=no
$(package)_config_opts += -DINPUT_gif=no
$(package)_config_opts += -DINPUT_glib=no
$(package)_config_opts += -DINPUT_icu=no
$(package)_config_opts += -DINPUT_ico=no
$(package)_config_opts += -DINPUT_kms=no
$(package)_config_opts += -DINPUT_linuxfb=no
$(package)_config_opts += -DINPUT_libudev=no
$(package)_config_opts += -DINPUT_mtdev=no
$(package)_config_opts += -DINPUT_openssl=linked
$(package)_config_opts += -DINPUT_openvg=no
$(package)_config_opts += -DINPUT_reduce_relocations=no
$(package)_config_opts += -DINPUT_schannel=no
$(package)_config_opts += -DINPUT_sctp=no
$(package)_config_opts += -DINPUT_securetransport=no
$(package)_config_opts += -DINPUT_system_proxies=no
$(package)_config_opts += -DINPUT_use_gold_linker_alias=no
$(package)_config_opts += -DINPUT_zstd=no
$(package)_config_opts += -DINPUT_pkg_config=yes
$(package)_config_opts += -DINPUT_libpng=qt
$(package)_config_opts += -DINPUT_pcre=qt
$(package)_config_opts += -DINPUT_harfbuzz=qt
$(package)_config_opts += -DINPUT_system_zlib=no
$(package)_config_opts += -DINPUT_colordialog=no
$(package)_config_opts += -DINPUT_dial=no
$(package)_config_opts += -DINPUT_fontcombobox=no
$(package)_config_opts += -DINPUT_image_heuristic_mask=no
$(package)_config_opts += -DINPUT_keysequenceedit=no
$(package)_config_opts += -DINPUT_lcdnumber=no
$(package)_config_opts += -DINPUT_networkdiskcache=no
$(package)_config_opts += -DINPUT_pdf=no
$(package)_config_opts += -DINPUT_printdialog=no
$(package)_config_opts += -DINPUT_printer=no
$(package)_config_opts += -DINPUT_printpreviewdialog=no
$(package)_config_opts += -DINPUT_printpreviewwidget=no
$(package)_config_opts += -DINPUT_printsupport=no
$(package)_config_opts += -DINPUT_sessionmanager=no
$(package)_config_opts += -DINPUT_sql=no
$(package)_config_opts += -DINPUT_syntaxhighlighter=no
$(package)_config_opts += -DINPUT_textmarkdownwriter=no
$(package)_config_opts += -DINPUT_textodfwriter=no
$(package)_config_opts += -DINPUT_topleveldomain=no
$(package)_config_opts += -DINPUT_undocommand=no
$(package)_config_opts += -DINPUT_undogroup=no
$(package)_config_opts += -DINPUT_undostack=no
$(package)_config_opts += -DINPUT_undoview=no
$(package)_config_opts += -DINPUT_vnc=no

$(package)_config_opts_linux += -DQT_QMAKE_TARGET_MKSPEC=linux-g++
$(package)_config_opts_linux += -DINPUT_xcb=yes
$(package)_config_opts_linux += -DINPUT_xcb_xlib=no
$(package)_config_opts_linux += -DINPUT_xlib=no
$(package)_config_opts_linux += -DINPUT_freetype=system
$(package)_config_opts_linux += -DINPUT_fontconfig=yes
$(package)_config_opts_linux += -DINPUT_opengl=no
$(package)_config_opts_linux += -DINPUT_vulkan=no
$(package)_config_opts_linux += -DINPUT_backtrace=no
$(package)_config_opts_linux += -DINPUT_dbus=linked
$(package)_config_opts_linux += -DBUILD_WITH_PCH=OFF

$(package)_config_opts_mingw32 += -DQT_QMAKE_TARGET_MKSPEC=win32-g++
$(package)_config_opts_mingw32 += -DINPUT_opengl=no
$(package)_config_opts_mingw32 += -DINPUT_dbus=no
$(package)_config_opts_mingw32 += -DINPUT_freetype=no
$(package)_config_opts_mingw32 += -DINPUT_wmf=yes
$(package)_config_opts_mingw32 += -DBUILD_WITH_PCH=ON

$(package)_config_opts_darwin += -DQT_QMAKE_TARGET_MKSPEC=macx-clang
$(package)_config_opts_darwin += -DINPUT_dbus=no
$(package)_config_opts_darwin += -DINPUT_freetype=no
$(package)_config_opts_darwin += -DINPUT_ffmpeg=no
$(package)_config_opts_darwin += -DQMAKE_MACOSX_DEPLOYMENT_TARGET=11.0
$(package)_config_opts_darwin += -DBUILD_WITH_PCH=OFF
$(package)_config_opts_darwin += '-DQT_QMAKE_DEVICE_OPTIONS=MAC_SDK_PATH=$(host_prefix)/native/SDK;MAC_SDK_VERSION=$(OSX_SDK_VERSION);CROSS_COMPILE=$(host)-;MAC_TARGET=$(host);XCODE_VERSION=$(XCODE_VERSION)'

$(package)_config_opts += -G Ninja

$(package)_openssl_flags_$(host_os)="-lssl -lcrypto -lpthread -ldl"
$(package)_openssl_flags_mingw32="-lssl -lcrypto -lws2_32"
endef

define $(package)_fetch_cmds
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_download_file),$($(package)_file_name),$($(package)_sha256_hash)) && \
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_qttools_file_name),$($(package)_qttools_file_name),$($(package)_qttools_sha256_hash)) && \
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_qtsvg_file_name),$($(package)_qtsvg_file_name),$($(package)_qtsvg_sha256_hash)) && \
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_qtwebsockets_file_name),$($(package)_qtwebsockets_file_name),$($(package)_qtwebsockets_sha256_hash)) && \
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_qtmultimedia_file_name),$($(package)_qtmultimedia_file_name),$($(package)_qtmultimedia_sha256_hash)) && \
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_qtshadertools_file_name),$($(package)_qtshadertools_file_name),$($(package)_qtshadertools_sha256_hash))
endef

define $(package)_extract_cmds
  mkdir -p $($(package)_extract_dir) && \
  echo "$($(package)_sha256_hash)  $($(package)_source)" > $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  echo "$($(package)_qttools_sha256_hash)  $($(package)_source_dir)/$($(package)_qttools_file_name)" >> $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  echo "$($(package)_qtsvg_sha256_hash)  $($(package)_source_dir)/$($(package)_qtsvg_file_name)" >> $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  echo "$($(package)_qtwebsockets_sha256_hash)  $($(package)_source_dir)/$($(package)_qtwebsockets_file_name)" >> $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  echo "$($(package)_qtmultimedia_sha256_hash)  $($(package)_source_dir)/$($(package)_qtmultimedia_file_name)" >> $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  echo "$($(package)_qtshadertools_sha256_hash)  $($(package)_source_dir)/$($(package)_qtshadertools_file_name)" >> $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  $(build_SHA256SUM) -c $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  mkdir qtbase && \
  $(build_TAR) --no-same-owner --strip-components=1 -xf $($(package)_source) -C qtbase && \
  mkdir qttools && \
  $(build_TAR) --no-same-owner --strip-components=1 -xf $($(package)_source_dir)/$($(package)_qttools_file_name) -C qttools && \
  mkdir qtsvg && \
  $(build_TAR) --no-same-owner --strip-components=1 -xf $($(package)_source_dir)/$($(package)_qtsvg_file_name) -C qtsvg && \
  mkdir qtwebsockets && \
  $(build_TAR) --no-same-owner --strip-components=1 -xf $($(package)_source_dir)/$($(package)_qtwebsockets_file_name) -C qtwebsockets && \
  mkdir qtmultimedia && \
  $(build_TAR) --no-same-owner --strip-components=1 -xf $($(package)_source_dir)/$($(package)_qtmultimedia_file_name) -C qtmultimedia && \
  mkdir qtshadertools && \
  $(build_TAR) --no-same-owner --strip-components=1 -xf $($(package)_source_dir)/$($(package)_qtshadertools_file_name) -C qtshadertools
endef

define $(package)_preprocess_cmds
  cp $($(package)_patch_dir)/root_CMakeLists.txt CMakeLists.txt && \
  patch -p1 -i $($(package)_patch_dir)/qtbase-moc-ignore-gcc-macro.patch && \
  patch -p1 -i $($(package)_patch_dir)/rcc_hardcode_timestamp.patch && \
  patch -p1 -i $($(package)_patch_dir)/fast_fixed_dtoa_no_optimize.patch && \
  patch -p1 -i $($(package)_patch_dir)/guix_cross_lib_path.patch && \
  patch -p1 -i $($(package)_patch_dir)/windows_func_fix.patch && \
  mv $($(package)_patch_dir)/toolchain.cmake . && \
  sed -i -e 's|@cmake_system_name@|$($(host_os)_cmake_system)|' \
	     -e 's|@target@|$(host)|' \
	     -e 's|@host_prefix@|$(host_prefix)|' \
	     -e 's|@cmake_c_flags@|$(darwin_CC_)|' \
	     -e 's|@cmake_cxx_flags@|$(darwin_CXX_)|' \
	     -e 's|@wmf_libs@|$(WMF_LIBS)|' \
      toolchain.cmake && \
  cd qtbase && \
  patch -p1 -i $($(package)_patch_dir)/revert_f99ee441.patch && \
  patch -p1 -i $($(package)_patch_dir)/xcb-util-image-fix.patch && \
  patch -p1 -i $($(package)_patch_dir)/libxau-fix.patch && \
  cd ../qtmultimedia && \
  patch -p1 -i $($(package)_patch_dir)/qtmultimedia-fixes.patch && \
  patch -p1 -i $($(package)_patch_dir)/v4l2.patch
endef

define $(package)_config_cmds
  export OPENSSL_LIBS=${$(package)_openssl_flags_$(host_os)} \
  export PKG_CONFIG_SYSROOT_DIR=/ && \
  export PKG_CONFIG_LIBDIR=$(host_prefix)/lib/pkgconfig && \
  export QT_MAC_SDK_NO_VERSION_CHECK=1 && \
  env -u C_INCLUDE_PATH -u CPLUS_INCLUDE_PATH -u OBJC_INCLUDE_PATH -u OBJCPLUS_INCLUDE_PATH -u CPATH -u LIBRARY_PATH cmake $($(package)_config_opts)
endef

define $(package)_build_cmds
  export LD_LIBRARY_PATH="${build_prefix}/lib/:$(QT_LIBS_LIBS)" && \
  env -u C_INCLUDE_PATH -u CPLUS_INCLUDE_PATH -u OBJC_INCLUDE_PATH -u OBJCPLUS_INCLUDE_PATH -u CPATH -u LIBRARY_PATH cmake --build . --parallel
endef

define $(package)_stage_cmds
  DESTDIR=$($(package)_staging_dir) cmake --install .
endef
