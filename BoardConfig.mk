#
# Copyright (C) 2011 The Android Open-Source Project
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

# These two variables are set first, so they can be overridden
# by BoardConfigVendor.mk
BOARD_USES_GENERIC_AUDIO := false 
USE_CAMERA_STUB := true

# Use the non-open-source parts, if they're present
-include vendor/samsung/smdkv210/BoardConfigVendor.mk

TARGET_BOARD_PLATFORM :=  s5pc110
TARGET_NO_BOOTLOADER := true	#uses u-boot instead
TARGET_NO_KERNEL := true
TARGET_NO_RECOVERY := true
TARGET_NO_RADIOIMAGE := true
# TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

BOARD_HAVE_BLUETOOTH := false
BOARD_HAVE_WIFI := true

TARGET_BOOTLOADER_BOARD_NAME := smdkv210

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi

BOARD_EGL_CFG := device/samsung/smdkv210/egl.cfg

USE_OPENGL_RENDERER := true

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 268435456
BOARD_USERDATAIMAGE_PARTITION_SIZE := 536870912
BOARD_FLASH_BLOCK_SIZE := 4096

#ifeq ($(BOARD_USES_GENERIC_AUDIO),false)
#BOARD_USES_ALSA_AUDIO := true
#BUILD_WITH_ALSA_UTILS := true
#BOARD_USES_CIRCULAR_BUF_AUDIO := true
#USE_ULP_AUDIO := true
#endif

ifeq ($(USE_CAMERA_STUB),false)
BOARD_CAMERA_LIBRARIES := libcamera
endif

DEFAULT_FB_NUM	:= 0

#Add for wifi
BOARD_WIFI_VENDOR := realtek
ifeq ($(BOARD_WIFI_VENDOR), realtek)
    WPA_SUPPLICANT_VERSION := VER_0_8_X
    BOARD_WPA_SUPPLICANT_DRIVER := WEXT
    BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext_rtl
    #BOARD_HOSTAPD_DRIVER        := NL80211
    #BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd

    BOARD_WLAN_DEVICE := rtl8192cu
    #BOARD_WLAN_DEVICE := rtl8192du
    #BOARD_WLAN_DEVICE := rtl8192ce
    #BOARD_WLAN_DEVICE := rtl8192de
    #BOARD_WLAN_DEVICE := rtl8723as
    #BOARD_WLAN_DEVICE := rtl8723au
    #BOARD_WLAN_DEVICE := rtl8188es

    WIFI_DRIVER_MODULE_NAME   := "rtl8192cu"
    WIFI_DRIVER_MODULE_PATH   := "/system/lib/modules/rtl8192cu.ko"

    WIFI_DRIVER_MODULE_ARG    := ""
    WIFI_FIRMWARE_LOADER      := ""
    WIFI_DRIVER_FW_PATH_STA   := ""
    WIFI_DRIVER_FW_PATH_AP    := ""
    WIFI_DRIVER_FW_PATH_P2P   := ""
    WIFI_DRIVER_FW_PATH_PARAM := ""
endif

