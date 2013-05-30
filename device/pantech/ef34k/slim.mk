# Specify phone tech before including full_phone
$(call inherit-product, vendor/slim/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := ef34k

# Bootanimation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Inherit some common CM stuff.
$(call inherit-product, vendor/slim/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/pantech/ef34k/device_ef34k.mk)

# Inherit device settings
$(call inherit-product, vendor/slim/config/common_sgs.mk)

# Inherit torch settings
$(call inherit-product, vendor/slim/config/common_ledflash.mk)

#Boot Animation
PRODUCT_COPY_FILES +=  \
    vendor/slim/prebuilt/hdpi/bootanimation.zip:system/media/bootanimation.zip
    
#copy 00check
PRODUCT_COPY_FILES += \
	vendor/slim/prebuilt/common/etc/init.d/00check:system/etc/init.d/00check
	
# Device naming
PRODUCT_DEVICE := ef34k
PRODUCT_NAME := slim_ef34k
PRODUCT_BRAND := SKY
PRODUCT_MODEL := IM-A770K
PRODUCT_MANUFACTURER := PANTECH
PRODUCT_DEFAULT_LANGUAGE := zh
PRODUCT_DEFAULT_REGION := CN

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SKY_IM-A770K BUILD_FINGERPRINT=SKY/SKY_IM-A770K/ef34k:4.0.4/IMM76D/EF34K_ICS_002:user/release-keys PRIVATE_BUILD_DESC="zhaochenw 4.0.4 IMM76I EF34K_ICS_002 release-keys" BUILD_NUMBER=EF34K_ICS_002
