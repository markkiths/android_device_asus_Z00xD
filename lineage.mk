$(call inherit-product, device/asus/Z00ED/full_Z00ED.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_Z00ED
PRODUCT_BRAND := asus
PRODUCT_MANUFACTURER := asus
PRODUCT_DEVICE := Z00ED

PRODUCT_GMS_CLIENTID_BASE := android-asus
