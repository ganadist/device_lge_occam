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

PRODUCT_PACKAGES := \
	Stk \

PRODUCT_PACKAGES += \
	mpcpusetd \

PRODUCT_PACKAGE_OVERLAYS := \
	device/lge/occam/overlay-occam \

$(call inherit-product, vendor/google/product/gapps-stubs.mk)
$(call inherit-product, vendor/fake_nexus/product/fake_nexus.mk)
$(call inherit-product, device/lge/mako/full_mako.mk)

PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=true \

$(call inherit-product, vendor/google/product/facelock.mk)

PRODUCT_PROPERTY_OVERRIDES += \
	af.fast_track_multiplier=1 \
	ro.build.expect.bootloader=MAKOZ30f \
	ro.build.expect.baseband=M9615A-CEFWMAZM-2.0.1701.07 \
	ro.product.first_api_level=17 \

# reduce system image size
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi

PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 4
PRODUCT_NAME := occam

PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.product.name=$(PRODUCT_NAME) \

PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.default_network=3 \
	ro.ril.def.preferred.network=3 \

# Nexus 4 has no gesture sensor
PRODUCT_PROPERTY_OVERRIDES += \
	gesture.disable_camera_launch=1 \

PRODUCT_PROPERTY_OVERRIDES += \
	ro.hwui.texture_cache_size=48 \
	ro.hwui.layer_cache_size=32 \
	ro.hwui.r_buffer_cache_size=4 \
	ro.hwui.path_cache_size=24 \
	ro.hwui.gradient_cache_size=1 \
	ro.hwui.drop_shadow_cache_size=5 \
	ro.hwui.texture_cache_flushrate=0.5 \
	ro.hwui.text_small_cache_width=1024 \
	ro.hwui.text_small_cache_height=1024 \
	ro.hwui.text_large_cache_width=2048 \
	ro.hwui.text_large_cache_height=1024 \

