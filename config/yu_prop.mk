# Copyright (C) 2015-2016 The YUTeleventures.
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

PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=true \
	ro.com.android.dataroaming=false \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.setupwizard.enterprise_mode=1 \
	ro.setupwizard.network_required=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# YUOS Prop Tweaks & Fixes.
PRODUCT_PROPERTY_OVERRIDES += \
    pm.sleep.mode=1 \
    debug.performance.tuning=1 \
    ro.ril.power_collapse=1 \
    persist.service.lgospd.enable=0 \
    persist.service.pcsync.enable=0 \
    ro.facelock.black_timeout=400 \
    ro.facelock.det_timeout=1500 \
    ro.facelock.rec_timeout=2500 \
    ro.facelock.lively_timeout=2500 \
    ro.facelock.est_max_time=600 \
    ro.facelock.use_intro_anim=false

# Make ADB Debuggable & Insecure for Eng Builds.
ifneq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_PROPERTY_OVERRIDES += \
    persist.service.adb.enable=1 \
    persist.service.debuggable=1 \
    persist.sys.usb.config=mtp,adb \
    ro.adb.secure=0
edif	