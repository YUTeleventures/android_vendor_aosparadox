PRODUCT_BRAND ?= SSHD

# Boot animation
PRODUCT_COPY_FILES += \
	vendor/sshd/prebuilt/common/bootanimation/bootanimation.zip:system/media/bootanimation.zip
	
# SSHD init.rc
PRODUCT_COPY_FILES += \
	vendor/sshd/prebuilt/common/etc/init.sshd.rc:root/init.sshd.rc

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=true \
	ro.com.android.dataroaming=false \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.setupwizard.enterprise_mode=1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=0

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

# Embed SuperUser
SUPERUSER_EMBEDDED := true

# Backup Tool
ifneq ($(WITH_GMS),true)
PRODUCT_COPY_FILES += \
    vendor/sshd/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/sshd/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/sshd/prebuilt/common/bin/50-sshd.sh:system/addon.d/50-sshd.sh \
	vendor/sshd/prebuilt/common/bin/99-backup.sh:system/addon.d/99-backup.sh \
	vendor/sshd/prebuilt/common/etc/backup.conf:system/etc/backup.conf \
    vendor/sshd/prebuilt/common/bin/blacklist:system/addon.d/blacklist
endif

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/sshd/prebuilt/common/bin/otasigcheck.sh:system/bin/otasigcheck.sh

ifneq ($(TARGET_BUILD_VARIANT),user)
# userinit support
PRODUCT_COPY_FILES += \
    vendor/sshd/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
endif	
	
# init.d support
PRODUCT_COPY_FILES += \
	vendor/sshd/prebuilt/common/bin/sysinit:system/bin/sysinit \
	vendor/sshd/prebuilt/common/etc/init.d/00sshd:system/etc/init.d/00sshd

# Bring in camera effects	
PRODUCT_COPY_FILES +=  \
    vendor/sshd/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/sshd/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/sshd/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties	
	
# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl	
	
# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/sshd/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# Include librsjni explicitly to workaround GMS issue
PRODUCT_PACKAGES += \
    librsjni	

# Required SSHD packages
PRODUCT_PACKAGES += \
	BluetoothExt \
	Development \
	Launcher3 \
	Trebuchet \
	ExactCalculator \
	libemoji \
	Terminal \
	SpareParts \
	Eleven
   		
# Extra tools in SSHD
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

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    procmem \
    procrank \
    su
endif
	
# Stagefright FFMPEG plugin
#PRODUCT_PACKAGES += \
    #libffmpeg_extractor \
    #libffmpeg_omx \
    #media_codecs_ffmpeg.xml

#PRODUCT_PROPERTY_OVERRIDES += \
    #media.sf.omx-plugin=libffmpeg_omx.so \
    #media.sf.extractor-plugin=libffmpeg_extractor.so
	
# SSHD overlays
PRODUCT_PACKAGE_OVERLAYS := vendor/sshd/overlay/common

# easy way to extend to add more packages
$(call prepend-product-if-exists, vendor/extra/product.mk)

# SSHD Versioning
-include vendor/sshd/config/version.mk