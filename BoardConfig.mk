# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := KIRIN
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := generic
TARGET_BOARD_PLATFORM_GPU := kirin

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive

BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x8000 --ramdisk_offset 0x01000000 --tags_offset 0x0100

# phony empty kernel to satisfy build system, but this device does not
# include a kernel in the recovery image -- flash to recovery_ramdisk
TARGET_PREBUILT_KERNEL := device/huawei/charlotte/dummykernel
# else uncomment below to build from sauce
# TARGET_KERNEL_SOURCE := kernel/huawei/charlotte
# TARGET_KERNEL_CONFIG := charlotte_defconfig

BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5905580032
BOARD_USERDATAIMAGE_PARTITION_SIZE := 119663493120
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_NO_SELECT_BUTTON := true

# NTFS (R/W access)
TW_INCLUDE_NTFS_3G := true

# TWRP specific build flags
TW_THEME := portrait_hdpi
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd_backlight0/brightness
TW_NO_HAPTICS := true
TW_NO_SCREEN_BLANK := true
TW_USE_TOOLBOX := true
TW_DEFAULT_BRIGHTNESS := "150"
TW_CUSTOM_BATTERY_PATH := /sys/class/power_supply/Battery
# Device crashes if /sbin/modprobe is present so this is needed:
BOARD_CUSTOM_BOOTIMG_MK := device/huawei/charlotte/custombootimg.mk
# MTP will not work until we update it to support ffs
TW_EXCLUDE_MTP := true

# SPECIAL FLAGS
# ignore a factory reset when using the phone's factory reset screen
# or since N (at least) when using <fastboot erase userdata> which set the same
# https://gerrit.omnirom.org/#/c/20750/
# this flag requires to build TWRP in branch 7.1 or later
# DO NOT SET TO FALSE WHEN YOU DO NOT KNOW WHAT YOU'RE DOING!
TW_IGNORE_MISC_WIPE_DATA := true

# CRYPTO
TW_INCLUDE_CRYPTO := true

# SEPOLICY stuff
# https://android.googlesource.com/platform/external/sepolicy/+/marshmallow-release/README
BOARD_SEPOLICY_DIRS += device/huawei/charlotte/sepolicy
# Ignore neverallow errors
SELINUX_IGNORE_NEVERALLOWS := true

# Extras
TW_EXCLUDE_TWRPAPP := true
