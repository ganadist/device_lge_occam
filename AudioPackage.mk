LOCAL_PATH := device/lge/occam/sounds/

AUDIO_FILES := \
	ringtones/Ganymede.ogg \
	ringtones/Pyxis.ogg \
	ringtones/Oberon.ogg \
	ringtones/Titania.ogg \
	ringtones/Phobos.ogg \
	ringtones/Triton.ogg \
	ringtones/Dione.ogg \
	ringtones/Umbriel.ogg \
	ringtones/Luna.ogg \
	ringtones/Callisto.ogg \
	ringtones/Sedna.ogg \
	ringtones/Atria.ogg \
	alarms/Helium.ogg \
	alarms/Carbon.ogg \
	alarms/Krypton.ogg \
	alarms/Argon.ogg \
	alarms/Timer.ogg \
	alarms/Neon.ogg \
	alarms/Osmium.ogg \
	alarms/Oxygen.ogg \
	alarms/Platinum.ogg \
	notifications/Salacia.ogg \
	notifications/Rhea.ogg \
	notifications/Elara.ogg \
	notifications/Europa.ogg \
	notifications/Carme.ogg \
	notifications/Titan.ogg \
	notifications/Ariel.ogg \
	notifications/Io.ogg \
	notifications/Ceres.ogg \
	notifications/Iapetus.ogg \
	notifications/Tethys.ogg \


AUDIO_FILES += \
	ui/audio_end.ogg \
	ui/audio_initiate.ogg \
	ui/NFCTransferComplete.ogg \
	ui/NFCFailure.ogg \
	ui/NFCTransferInitiated.ogg \
	ui/NFCInitiated.ogg \
	ui/NFCSuccess.ogg \

#	ui/VideoStop.ogg \

PRODUCT_COPY_FILES := $(foreach fn,$(AUDIO_FILES),\
	$(LOCAL_PATH)/$(fn):system/media/audio/$(fn))

# use ui effect from aosp
$(call inherit-product, frameworks/base/data/sounds/AudioPackage13.mk)
