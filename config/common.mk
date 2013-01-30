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

# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

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

# userinit support
PRODUCT_COPY_FILES += \
    vendor/sshd/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
	
# init.d support
PRODUCT_COPY_FILES += \
	vendor/sshd/prebuilt/common/bin/sysinit:system/bin/sysinit \
	vendor/sshd/prebuilt/common/etc/init.d/00sshd:system/etc/init.d/00sshd

# Bring in camera effects	
PRODUCT_COPY_FILES +=  \
    vendor/sshd/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/sshd/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl	
	
# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/sshd/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel	

# Embed SuperUser
SUPERUSER_EMBEDDED := true	

# Required SSHD packages
PRODUCT_PACKAGES += \
	CellBroadcastReceiver \
	Development \
	Launcher3 \
	BluetoothExt \
	Superuser \
    su
	
# Optional SSHD packages
PRODUCT_PACKAGES += \
   	libemoji

# Custom SSHD packages	
PRODUCT_PACKAGES += \
    Eleven
	
# Extra tools in SSHD
PRODUCT_PACKAGES += \
    libsepol \
    e2fsck \
    mke2fs \
    tune2fs \
    bash \
    nano \
    htop \
    powertop \
    lsof \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs \
    ntfsfix \
    ntfs-3g \
    gdbserver \
    micro_bench \
    oprofiled \
    sqlite3 \
    strace

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync
	
# overlays
PRODUCT_PACKAGE_OVERLAYS := vendor/sshd/overlay/common

# easy way to extend to add more packages
$(call prepend-product-if-exists, vendor/extra/product.mk)
