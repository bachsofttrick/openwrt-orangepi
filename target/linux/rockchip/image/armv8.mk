# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2020 Tobias Maedel

define Device/xunlong_orangepi-r1-plus
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := OrangePi R1 Plus
  SOC := rk3328
  UBOOT_DEVICE_NAME := orangepi-r1-plus-rk3328
  IMAGE/sysupgrade.img.gz := boot-common | boot-script nanopi-r2s | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := kmod-usb-net-rtl8152
endef
TARGET_DEVICES += xunlong_orangepi-r1-plus

define Device/xunlong_orangepi-r1-plus-lts
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := OrangePi R1 Plus LTS
  SOC := rk3328
  UBOOT_DEVICE_NAME := orangepi-r1-plus-lts-rk3328
  IMAGE/sysupgrade.img.gz := boot-common | boot-script nanopi-r2s | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := kmod-usb-net-rtl8152 \
  kmod-usb-net-rndis kmod-usb-storage kmod-usb-storage-extras kmod-fs-exfat kmod-fs-ntfs3 \
  kmod-fs-vfat \
  
endef
TARGET_DEVICES += xunlong_orangepi-r1-plus-lts

define Device/xunlong_orangepi-r1-plus-spi
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := OrangePi R1 Plus for Spi Boot
  SOC := rk3328
  UBOOT_DEVICE_NAME := orangepi-r1-plus-rk3328-spi
  KERNEL_LOADADDR = 0x02080000
  KERNEL := kernel-bin | lzma | uImage lzma
  IMAGES := sysupgrade.bin uboot.bin dtb.bin firmware.bin
  UBOOT_SIZE := 1152k
  DTB_SIZE := 64k
  FIRMWARE_SIZE := 15168k
  IMAGE_SIZE := 16384k
  BLOCK_SIZE := 4k
  IMAGE/sysupgrade.bin := pine64-img-spi | pad-to $$$$(UBOOT_SIZE) | append-dtb | pad-to $$$$(DTB_SIZE) \
	  | append-kernel | append-rootfs | pad-rootfs | append-metadata | check-size $$$$(IMAGE_SIZE)
  IMAGE/uboot.bin := pine64-img-spi | pad-to $$$$(BLOCK_SIZE)
  IMAGE/dtb.bin := append-dtb | pad-to $$$$(BLOCK_SIZE)
  IMAGE/firmware.bin := append-kernel | append-rootfs | pad-rootfs | append-metadata | check-size $$$$(FIRMWARE_SIZE)
  DEVICE_PACKAGES := kmod-usb-net-rtl8152
endef

TARGET_DEVICES += xunlong_orangepi-r1-plus-spi

define Device/xunlong_orangepi-r1-plus-lts-spi
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := OrangePi R1 Plus LTS for Spi Boot
  SOC := rk3328
  UBOOT_DEVICE_NAME := orangepi-r1-plus-lts-rk3328-spi
  KERNEL_LOADADDR = 0x02080000
  KERNEL = kernel-bin | lzma | uImage lzma
  IMAGES = sysupgrade.bin uboot.bin dtb.bin firmware.bin
  UBOOT_SIZE := 1152k
  DTB_SIZE := 64k
  FIRMWARE_SIZE := 15168k
  IMAGE_SIZE := 16384k
  BLOCK_SIZE := 4k
  IMAGE/sysupgrade.bin := pine64-img-spi | pad-to $$$$(UBOOT_SIZE) | append-dtb | pad-to $$$$(DTB_SIZE) \
	  | append-kernel | append-rootfs | pad-rootfs | append-metadata | check-size $$$$(IMAGE_SIZE)
  IMAGE/uboot.bin := pine64-img-spi | pad-to $$$$(BLOCK_SIZE)
  IMAGE/dtb.bin := append-dtb | pad-to $$$$(BLOCK_SIZE)
  IMAGE/firmware.bin := append-kernel | append-rootfs | pad-rootfs | append-metadata | check-size $$$$(FIRMWARE_SIZE)
  DEVICE_PACKAGES := kmod-usb-net-rtl8152
endef

TARGET_DEVICES += xunlong_orangepi-r1-plus-lts-spi

define Device/friendlyarm_nanopi-r2s
  DEVICE_VENDOR := FriendlyARM
  DEVICE_MODEL := NanoPi R2S
  SOC := rk3328
  UBOOT_DEVICE_NAME := nanopi-r2s-rk3328
  IMAGE/sysupgrade.img.gz := boot-common | boot-script nanopi-r2s | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := kmod-usb-net-rtl8152
endef
TARGET_DEVICES += friendlyarm_nanopi-r2s

define Device/friendlyarm_nanopi-r4s
  DEVICE_VENDOR := FriendlyARM
  DEVICE_MODEL := NanoPi R4S
  DEVICE_VARIANT := 4GB LPDDR4
  SOC := rk3399
  UBOOT_DEVICE_NAME := nanopi-r4s-rk3399
  IMAGE/sysupgrade.img.gz := boot-common | boot-script nanopi-r4s | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := kmod-r8169
endef
TARGET_DEVICES += friendlyarm_nanopi-r4s

define Device/pine64_rockpro64
  DEVICE_VENDOR := Pine64
  DEVICE_MODEL := RockPro64
  SOC := rk3399
  UBOOT_DEVICE_NAME := rockpro64-rk3399
  IMAGE/sysupgrade.img.gz := boot-common | boot-script | pine64-img | gzip | append-metadata
endef
TARGET_DEVICES += pine64_rockpro64

define Device/radxa_rock-pi-4a
  DEVICE_VENDOR := Radxa
  DEVICE_MODEL := ROCK Pi 4A
  SOC := rk3399
  SUPPORTED_DEVICES := radxa,rockpi4a radxa,rockpi4
  UBOOT_DEVICE_NAME := rock-pi-4-rk3399
  IMAGE/sysupgrade.img.gz := boot-common | boot-script | pine64-img | gzip | append-metadata
endef
TARGET_DEVICES += radxa_rock-pi-4a
