# Inherit common SSHD stuff
$(call inherit-product, vendor/sshd/config/common.mk)

# Optional yu-aosp packages
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    PhotoTable \
    PhotoPhase

# Extra tools in SSHD
PRODUCT_PACKAGES += \
    vim \
    zip \
    unrar \
    wget \
    zip
