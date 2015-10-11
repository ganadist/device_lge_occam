#
# Copyright 2013 The Android Open-Source Project
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
#
PRODUCT_PACKAGE_OVERLAYS := device/lge/occam/overlay-gms

PRODUCT_PROPERTY_OVERRIDES := \
	ro.com.android.dataroaming=false \
	net.bt.name=Nexus4 \

# override package for reduce system image
PRODUCT_PACKAGES := \
	EditorsDocsStub \
	EditorsSheetsStub \
	EditorsSlidesStub \
	NewsstandStub \
	PrebuiltBugleStub \
	PrebuiltKeepStub \

#	persist.sys.debug.multi_window=1 \ # enable multi window

$(call inherit-product, device/lge/mako/full_mako.mk)
$(call inherit-product, vendor/google/product/gms.mk)

PRODUCT_DEFAULT_DEV_CERTIFICATE := device/lge/occam/security/release-keys

PRODUCT_NAME := occam
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 4
