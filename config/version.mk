# Copyright (C) 2015-2016 The SSHD Project.
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

# SSHD Versioning System
PRODUCT_VERSION_MAJOR = MM-6.0.1-$(BUILD_ID)
PRODUCT_VERSION_MINOR =PRE
PRODUCT_VERSION_MAINTENANCE =RELEASE
ifdef SSHD_BUILD_EXTRA
    SSHD_POSTFIX := -$(SSHD_BUILD_EXTRA)
endif
ifndef SSHD_BUILD_TYPE
    SSHD_BUILD_TYPE := UNOFFICIAL
    PLATFORM_VERSION_CODENAME := UNOFFICIAL
    SSHD_POSTFIX := -$(shell date +"%Y%m%d")
endif


# Set all versions
SSHD_VERSION := SSHD-$(PRODUCT_VERSION_MAJOR)-$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(SSHD_BUILD_TYPE)$(SSHD_POSTFIX)
SSHD_MOD_VERSION := SSHD-$(PRODUCT_VERSION_MAJOR)-$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(SSHD_BUILD_TYPE)$(SSHD_POSTFIX)-$(SSHD_BUILD)

# Apply it to build.prop
PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    sshd.ota.version=$(PRODUCT_VERSION_MAJOR)-$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE) \
    ro.sshd.version=$(SSHD_VERSION) \
	ro.sshd.display.version=$(SSHD_VERSION) \
    ro.modversion=$(SSHD_MOD_VERSION) \
    ro.sshd.releasetype=$(SSHD_BUILD_TYPE)