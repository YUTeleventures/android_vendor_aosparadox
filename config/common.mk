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
	
# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/sshd/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/sshd/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/sshd/prebuilt/common/bin/50-sshd.sh:system/addon.d/50-sshd.sh \
	vendor/sshd/prebuilt/common/bin/99-backup.sh:system/addon.d/99-backup.sh \
	vendor/sshd/prebuilt/common/etc/backup.conf:system/etc/backup.conf \
    vendor/sshd/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/sshd/prebuilt/common/bin/otasigcheck.sh:system/bin/otasigcheck.sh

# init.d support
PRODUCT_COPY_FILES += \
	vendor/sshd/prebuilt/common/bin/sysinit:system/bin/sysinit \
	vendor/sshd/prebuilt/common/etc/init.d/00sshd:system/etc/init.d/00sshd
	
PRODUCT_COPY_FILES +=  \
    vendor/sshd/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/sshd/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd
	
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
