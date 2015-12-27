# Inherit common SSHD stuff
$(call inherit-product, vendor/sshd/config/common.mk)

# Optional yu-aosp packages
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