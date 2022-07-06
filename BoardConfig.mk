#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from common msm8916-common
-include device/asus/msm8916-common/BoardConfigCommon.mk

DEVICE_PATH := device/asus/Z00xD

# Assert
TARGET_OTA_ASSERT_DEVICE := Z00ED,Z00E,Z00E_2,ASUS_Z00ED,ASUS_Z00E_2,Z00RD,Z00RD_1,ASUS_Z00RD,ASUS_Z00RD_1,Z00xD

# Kernel
TARGET_KERNEL_CONFIG := Z00xD-custom_defconfig
BOARD_KERNEL_CMDLINE += androidboot.btmacaddr=00:00:00:00:00:00

# Keymaster
TARGET_PROVIDES_KEYMASTER=true

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3623861248
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# releasetools
TARGET_RELEASETOOLS_EXTENSIONS += $(DEVICE_PATH)/releasetools

TARGET_INIT_VENDOR_LIB := libinit_Z00xD
TARGET_RECOVERY_DEVICE_MODULES := libinit_Z00xD

BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy
