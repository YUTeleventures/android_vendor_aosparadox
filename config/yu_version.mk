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

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# YU Versioning System
PRODUCT_VERSION_MAJOR = MM-6.0.1-$(BUILD_ID)
PRODUCT_VERSION_MINOR =PRE
PRODUCT_VERSION_MAINTENANCE =RELEASE
ifdef YU_BUILD_EXTRA
    YU_POSTFIX := -$(YU_BUILD_EXTRA)
endif
ifndef YU_BUILD_TYPE
    YU_BUILD_TYPE := UNOFFICIAL
    PLATFORM_VERSION_CODENAME := UNOFFICIAL
    YU_POSTFIX := -$(shell date +"%Y%m%d")
endif


# Set all versions
YU_VERSION := YU-GAND-OS-$(PRODUCT_VERSION_MAJOR)-$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(YU_BUILD_TYPE)$(YU_POSTFIX)
YU_MOD_VERSION := YU-GAND-OS-$(PRODUCT_VERSION_MAJOR)-$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(YU_BUILD_TYPE)$(YU_POSTFIX)

# Apply it to build.prop
PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    YU.ota.version=$(PRODUCT_VERSION_MAJOR)-$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE) \
    ro.yu.version=$(YU_VERSION) \
    ro.yu.display.version=$(YU_VERSION) \
    ro.modversion=$(YU_MOD_VERSION) \
    ro.yu.releasetype=$(YU_BUILD_TYPE)
