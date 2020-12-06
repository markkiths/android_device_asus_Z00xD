#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from Z00xD device
$(call inherit-product, device/asus/Z00xD/device.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_l.mk)

# Inherit some common AOSP-AEX stuff.
ifeq ($(shell test -e vendor/aosp/config/aex_props.mk && echo -n yes), yes)
$(call inherit-product, vendor/aosp/common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
endif
# Inherit some common AOSP-PE stuff.
ifeq ($(shell test -e vendor/aosp/overlay-pixel && echo -n yes), yes)
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
TARGET_SUPPORTS_GOOGLE_RECORDER := true
endif

TARGET_BOOT_ANIMATION_RES := 720

# Device identifier. This must come after all inclusions
PRODUCT_NAME := aosp_Z00xD
PRODUCT_DEVICE := Z00xD
PRODUCT_BRAND := asus
PRODUCT_MODEL := Zenfone 2 Laser
PRODUCT_MANUFACTURER := asus

PRODUCT_GMS_CLIENTID_BASE := android-asus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="WW_Phone-user 6.0.1 MMB29P 13.1010.1612.53-20170202 release-keys" \
    TARGET_DEVICE="ZE500KL"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := "asus/WW_Phone/ASUS_Z00E_2:6.0.1/MMB29P/13.1010.1612.53-20170202:user/release-keys"
