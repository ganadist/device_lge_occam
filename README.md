# Fake Nexus Rom

## Introduction

This repository is collection of build scripts for Fake Nexus Rom.

XDA thread: http://forum.xda-developers.com/nexus-4/development/fake-nexus-rom-nexus-4-t3230268

## Build

### Preparing sources

First, please see [this page](http://s.android.com/source/requirements.html) for general instruction.

In this page, only describe specific this rom.

After prepare android sources, add this file on **.repo/local_manifests/mako.xml**


    <?xml version="1.0" encoding="UTF-8"?>
    <manifest>
      <remote  name="github_ganadist"
              fetch="https://github.com/ganadist/" />
      <remote  name="github_callmealdy"
              fetch="https://github.com/CallMeAldy/" />

      <remove-project name="platform/external/svox" />

      <project path="device/lge/mako" name="device_lge_mako"
            remote="github_ganadist"
            revision="mm-6.0"
            groups="device,mako,broadcom_pdk,generic_fs" />

      <project path="device/lge/occam" name="device_lge_occam"
            remote="github_ganadist"
            revision="android-6.0.0_r1"
            groups="device,mako,broadcom_pdk,generic_fs" />

      <project path="vendor/broadcom" name="mako_vendor_broadcom"
            remote="github_ganadist"
            revision="android-6.0.0_r1"
            groups="device,mako,broadcom_pdk,generic_fs" />

      <project path="vendor/lge" name="mako_vendor_lge"
            remote="github_ganadist"
            revision="android-6.0.0_r1"
            groups="device,mako,broadcom_pdk,generic_fs" />

      <project path="vendor/qcom" name="mako_vendor_qcom"
            remote="github_ganadist"
            revision="android-6.0.0_r1"
            groups="device,mako,broadcom_pdk,generic_fs" />


      <project path="vendor/google" name="gms_addon"
        remote="github_ganadist"
        revision="android-6.0.0_r1"
        groups="device,mako,broadcom_pdk,generic_fs" />

      <project path="kernel/msm" name="kernel_lge_mako"
            remote="github_callmealdy"
            revision="mm-6.0"
            groups="device,mako,broadcom_pdk,generic_fs" />

    </manifest>

And run **repo sync**

### Configure build environment for Nexus 4

run following command from android top directory

    $ source build/envsetup.sh
    including device/asus/deb/vendorsetup.sh
    including device/asus/flo/vendorsetup.sh
    including device/asus/fugu/vendorsetup.sh
    including device/generic/mini-emulator-arm64/vendorsetup.sh
    including device/generic/mini-emulator-armv7-a-neon/vendorsetup.sh
    including device/generic/mini-emulator-mips/vendorsetup.sh
    including device/generic/mini-emulator-x86/vendorsetup.sh
    including device/generic/mini-emulator-x86_64/vendorsetup.sh
    including device/htc/flounder/vendorsetup.sh
    including device/lge/hammerhead/vendorsetup.sh
    including device/lge/mako/vendorsetup.sh
    including device/lge/occam/build/vendorsetup.sh
    please prepare with following commands
     $ lunch occam-user
     $ kernel_build
     $ prepare
     $ make updatepackage
    including device/lge/occam/vendorsetup.sh
    including device/moto/shamu/vendorsetup.sh
    including vendor/google/build/vendorsetup.sh

    $ lunch occam-user

    ============================================
    PLATFORM_VERSION_CODENAME=REL
    PLATFORM_VERSION=6.0
    TARGET_PRODUCT=occam
    TARGET_BUILD_VARIANT=user
    TARGET_BUILD_TYPE=release
    TARGET_BUILD_APPS=
    TARGET_ARCH=arm
    TARGET_ARCH_VARIANT=armv7-a-neon
    TARGET_CPU_VARIANT=krait
    TARGET_2ND_ARCH=
    TARGET_2ND_ARCH_VARIANT=
    TARGET_2ND_CPU_VARIANT=
    HOST_ARCH=x86_64
    HOST_OS=linux
    HOST_OS_EXTRA=Linux-4.2.2-1-ARCH-x86_64-with-glibc2.2.5
    HOST_BUILD_TYPE=release
    BUILD_ID=MRA58K
    OUT_DIR=out
    ============================================

### build kernel

You can build kernel binary with following command

    device/lge/occam/build/kernel_build

### apply several patches for this rom

You can apply several patches with following command

    device/lge/occam/build/prepare

### prepare gapps

This source repository do not have gapps binaries.

