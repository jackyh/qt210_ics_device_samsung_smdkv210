# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS := device/samsung/smdkv210/overlay

PRODUCT_COPY_FILES := \
	device/samsung/smdkv210/egl.cfg:system/lib/egl/egl.cfg \
	device/samsung/smdkv210/init.smdkv210.rc:root/init.smdkv210.rc \
	device/samsung/smdkv210/init.smdkv210.usb.rc:root/init.smdkv210.usb.rc \
	device/samsung/smdkv210/ueventd.smdkv210.rc:root/ueventd.smdkv210.rc \
        device/samsung/smdkv210/rtlwifi.ko:system/lib/modules/rtlwifi.ko \
        device/samsung/smdkv210/rtl8192c-common.ko:system/lib/modules/rtl8192c-common.ko \
        device/samsung/smdkv210/rtl8192cu.ko:system/lib/modules/rtl8192cu.ko \
	device/samsung/smdkv210/samsung-keypad.kl:system/usr/keylayout/samsung-keypad.kl \
        device/samsung/smdkv210/samsung-keypad.kcm:system/usr/keychars/samsung-keypad.kcm \
        device/samsung/smdkv210/s3c_ts.idc:system/usr/idc/s3c_ts.idc \
	device/samsung/smdkv210/wm97xx_touchscreen.idc:system/usr/idc/wm97xx_touchscreen.idc \
        device/samsung/smdkv210/Goodix_TouchScreen.idc:system/usr/idc/Goodix_TouchScreen.idc \
	device/samsung/smdkv210/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
        frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
        frameworks/base/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml


# Live Wallpapers
#MFC Firmware
PRODUCT_COPY_FILES += \
        device/samsung/smdkv210/samsung_mfc_fw.bin:system/vendor/firmware/samsung_mfc_fw.bin
PRODUCT_PACKAGES += \
	librs_jni

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=240

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
        persist.sys.usb.config=mass_storage

PRODUCT_TAGS += dalvik.gc.type-precise
# These are the OpenMAX IL modules
PRODUCT_PACKAGES += \
	libSEC_OMX_Core \
	libOMX.SEC.AVC.Decoder \
	libOMX.SEC.M4V.Decoder \
	libOMX.SEC.M4V.Encoder \
	libOMX.SEC.AVC.Encoder

PRODUCT_PACKAGES += \
	hwcomposer.s5pc110 \
	librs_jni

#audio
PRODUCT_PACKAGES += \
        audio_policy.smdkv210 \
        audio.primary.s5pc110 \
        audio.a2dp.default \
        lights.smdkv210 \
        libaudioutils

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs
# Libs
PRODUCT_PACKAGES += \
	libstagefrighthw 

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product-if-exists, vendor/samsung/smdkv210/device-vendor.mk)

$(call inherit-product, frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk)
