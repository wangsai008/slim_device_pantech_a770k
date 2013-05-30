#
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# common msm8960 configs
$(call inherit-product, device/pantech/msm8660-common/msm8660.mk)

PRODUCT_LOCALES += hdpi

DEVICE_PACKAGE_OVERLAYS += device/pantech/ef34k/overlay

# Boot ramdisk setup
PRODUCT_COPY_FILES += \
    device/pantech/ef34k/ramdisk/init:root/init \
    device/pantech/ef34k/ramdisk/init.qcom.rc:root/init.qcom.rc \
    device/pantech/ef34k/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/pantech/ef34k/ramdisk/init.target.rc:root/init.target.rc \
    device/pantech/ef34k/ramdisk/ueventd.qcom.rc:root/ueventd.qcom.rc \
    device/pantech/ef34k/ramdisk/init.qcom.sh:root/init.qcom.sh \
    device/pantech/ef34k/ramdisk/init.qcom.usb.sh:root/init.qcom.usb.sh \
    device/pantech/ef34k/ramdisk/initlogo.rle:root/initlogo.rle \
    device/pantech/ef34k/ramdisk/logo2.rle:root/logo2.rle \
    device/pantech/ef34k/ramdisk/reboot.rle:root/reboot.rle



# GPS config
PRODUCT_COPY_FILES += device/common/gps/gps.conf_AS:system/etc/gps.conf


# vold config
PRODUCT_COPY_FILES += \
    device/pantech/ef34k/configs/vold.fstab:system/etc/vold.fstab

# thermald config
PRODUCT_COPY_FILES += \
    device/pantech/ef34k/configs/thermald.conf:/system/etc/thermald.conf


# Input device config
PRODUCT_COPY_FILES += \
    device/pantech/ef34k/idc/cyttsp-i2c.idc:system/usr/idc/cyttsp-i2c.idc


# Torch
PRODUCT_PACKAGES += \
    Torch

# Extra properties
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    dalvik.vm.dexopt-data-only=1 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.heapsize=256m \
    dalvik.vm.dexopt-flags=m=y

# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES := zh_CN zh_TW en_US ko_KR xhdpi

# call the proprietary setup
$(call inherit-product-if-exists, vendor/pantech/ef34k/ef34k-vendor.mk)

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
