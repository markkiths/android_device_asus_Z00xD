$(call inherit-product, device/asus/Z00ED/full_Z00ED.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_Z00ED
PRODUCT_BRAND := asus
PRODUCT_MANUFACTURER := asus
PRODUCT_DEVICE := Z00ED

PRODUCT_GMS_CLIENTID_BASE := android-asus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="JP_Phone-user 6.0.1 MMB29P 13.1011.1711.16-20180103 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := "asus/JP_Phone/ASUS_Z00E_2:6.0.1/MMB29P/13.1011.1711.16-20180103:user/release-keys"