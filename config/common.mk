# Copyright (C) 2016 The YUTeleventures
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

PRODUCT_BRAND ?= YUOS

# Boot animation
PRODUCT_COPY_FILES += \
	vendor/yuos/prebuilt/common/bootanimation/bootanimation.zip:system/media/bootanimation.zip
	
# APN list
PRODUCT_COPY_FILES += \
    vendor/yuos/prebuilt/common/apns-conf.xml:system/etc/apns-conf.xml	

# Proprietary latinime libs needed for Keyboard swyping
 ifneq ($(filter arm64,$(TARGET_ARCH)),)
 PRODUCT_COPY_FILES += \
     vendor/yuos/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so
 else
 PRODUCT_COPY_FILES += \
     vendor/yuos/prebuilt/common/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so
 endif
	
# YUOS-Packages
 PRODUCT_PACKAGES += \
     Browser \
	 Launcher2 \
     Launcher3 \
     SnapdragonCamera \
     libemoji \
     libsepol \
     messaging

# YUOS overlays
 PRODUCT_PACKAGE_OVERLAYS := vendor/yuos/overlay
 
# easy way to extend to add more packages
$(call prepend-product-if-exists, vendor/extra/product.mk)

# YUOS Prop Tweaks & Fixes.
-include vendor/yuos/config/yu_prop.mk

# YUOS Versioning
-include vendor/yuos/config/yu_version.mk
