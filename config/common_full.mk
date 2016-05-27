# Inherit common YUOS stuff
$(call inherit-product, vendor/yuos/config/common.mk)

# Optional YUOS packages
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    PhotoTable \
    PhotoPhase \
	Screencast

# Extra tools in SSHD
PRODUCT_PACKAGES += \
    7z \
    bash \
    bzip2 \
    curl \
    unrar \
    unzip \
    vim \
    wget \
    zip