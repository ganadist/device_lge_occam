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
PRODUCT_PACKAGE_OVERLAYS := \
	device/lge/occam/overlay-occam \
	device/lge/occam/overlay-nexus \
	device/lge/occam/overlay-gms \

#	device/lge/occam/overlay-car \

PRODUCT_PROPERTY_OVERRIDES := \
	ro.com.android.dateformat=MM-dd-yyyy \
	ro.com.android.dataroaming=false \
	net.bt.name=Nexus4 \
	ro.config.ringtone=Titania.ogg \
	ro.config.notification_sound=Tethys.ogg \
	ro.config.alarm_alert=Oxygen.ogg \

#	persist.sys.debug.multi_window=1 \ # enable multi window

PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.default_network=3 \
	ro.ril.def.preferred.network=3 \
	ro.com.android.mobiledata=false \

# override package for reduce system image
PRODUCT_PACKAGES := \
	EditorsDocsStub \
	EditorsSheetsStub \
	EditorsSlidesStub \
	NewsstandStub \
	PrebuiltBugleStub \
	PrebuiltKeepStub \

PRODUCT_PACKAGES += \
	PartnerBookmarksProvider \
	CellBroadcastReceiver \

$(call inherit-product, vendor/google/product/gms.mk)
$(call inherit-product, vendor/google/product/gms-nexus.mk)
$(call inherit-product, device/lge/mako/full_mako.mk)
$(call inherit-product, frameworks/base/data/sounds/AudioPackage13.mk)

ifeq ($(TARGET_BUILD_VARIANT),user)
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.adb.secure=1 \

endif

PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=true \
	af.fast_track_multiplier=1 \
	ro.build.expect.bootloader=MAKOZ30f \
	ro.build.expect.baseband=M9615A-CEFWMAZM-2.0.1701.07 \

# reduce system image size
PRODUCT_AAPT_CONFIG := normal
PRODUCT_LOCALES := en_US cs_CZ da_DK de_AT de_CH de_DE de_LI el_GR en_AU en_CA en_GB en_NZ en_SG eo_EU es_ES fr_CA fr_CH fr_BE fr_FR it_CH it_IT ja_JP ko_KR nb_NO nl_BE nl_NL pl_PL pt_PT ru_RU sv_SE tr_TR zh_CN zh_HK zh_TW am_ET hi_IN

PRODUCT_DEFAULT_DEV_CERTIFICATE := device/lge/occam/security/release-keys

PRODUCT_NAME := occam
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 4
