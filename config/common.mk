PRODUCT_BRAND ?= YUOS

# Boot animation
PRODUCT_COPY_FILES += \
	vendor/yuos/prebuilt/common/bootanimation/bootanimation.zip:system/media/bootanimation.zip
	
# YU init.rc
PRODUCT_COPY_FILES += \
	vendor/yuos/prebuilt/common/etc/init.yu.rc:root/init.yu.rc

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# Proprietary latinime libs needed for Keyboard swyping
ifneq ($(filter arm64,$(TARGET_ARCH)),)
PRODUCT_COPY_FILES += \
    vendor/yuos/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so
else
PRODUCT_COPY_FILES += \
    vendor/yuos/prebuilt/common/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so
endif

# by default, do not update the recovery with system updates
PRODUCT_PROPERTY_OVERRIDES += persist.sys.recovery_update=false
	
# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0	

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0
endif

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Backup Tool
ifneq ($(WITH_GMS),true)
PRODUCT_COPY_FILES += \
    vendor/yuos/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/yuos/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/yuos/prebuilt/common/bin/50-yu.sh:system/addon.d/50-yu.sh \
	vendor/yuos/prebuilt/common/bin/99-backup.sh:system/addon.d/99-backup.sh \
	vendor/yuos/prebuilt/common/etc/backup.conf:system/etc/backup.conf \
    vendor/yuos/prebuilt/common/bin/blacklist:system/addon.d/blacklist
endif

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/yuos/prebuilt/common/bin/otasigcheck.sh:system/bin/otasigcheck.sh

ifneq ($(TARGET_BUILD_VARIANT),user)
# userinit support
PRODUCT_COPY_FILES += \
    vendor/yuos/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
endif	
	
# init.d support
PRODUCT_COPY_FILES += \
	vendor/yuos/prebuilt/common/bin/sysinit:system/bin/sysinit \
	vendor/yuos/prebuilt/common/etc/init.d/00yu:system/etc/init.d/00yu

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/yuos/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties	
	
# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Include librsjni explicitly to workaround GMS issue
PRODUCT_PACKAGES += \
    librsjni
 
# Required YUOS packages
PRODUCT_PACKAGES += \
	BluetoothExt \
	Development \
	SnapdragonCamera \
	Launcher3 \
	ExactCalculator \
	libemoji \
	Terminal \
	SpareParts
   		
# Extra tools in YUOS
PRODUCT_PACKAGES += \
	libsepol \
    mke2fs \
    tune2fs \
    nano \
    htop \
    mkfs.ntfs \
    fsck.ntfs \
    mount.ntfs \
    gdbserver \
    micro_bench \
    oprofiled \
    sqlite3 \
    strace \
    pigz

WITH_EXFAT ?= true
ifeq ($(WITH_EXFAT),true)
TARGET_USES_EXFAT := true
PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
endif

# rsync
PRODUCT_PACKAGES += \
    rsync
	
# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so
	
# YUOS overlays
PRODUCT_PACKAGE_OVERLAYS := vendor/yuos/overlay/common

# YUOS Extra Tools
FINISHER_SCRIPT := vendor/yuos/tools/finisher
SQUISHER_SCRIPT := vendor/yuos/tools/squisher
CHANGELOG_SCRIPT := vendor/yuos/tools/changelog.sh
 
# easy way to extend to add more packages
$(call prepend-product-if-exists, vendor/extra/product.mk)

# YUOS Prop Tweaks & Fixes.
-include vendor/yuos/config/sshd_prop.mk

# YUOS Versioning
-include vendor/yuos/config/version.mk
