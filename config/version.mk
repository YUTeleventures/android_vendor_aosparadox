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

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# YUOS Versioning System
ifndef ROM_BUILDTYPE
    ROM_BUILDTYPE := UNOFFICIAL
endif

# Set all versions
YU_VERSION := $(ROM_BUILDTYPE)-$(shell date +%Y%m%d)-$(TARGET_PRODUCT)
YU_MOD_VERSION := YU-OPEN-OS-$(YU_VERSION)

# Apply it to build.prop
PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.yu.version=$(YU_VERSION) \
    ro.modversion=$(YU_MOD_VERSION) \
    ro.yu.releasetype=$(ROM_BUILDTYPE) \
    ro.yu.device=$(YU_BUILD)
