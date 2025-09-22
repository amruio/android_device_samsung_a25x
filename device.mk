#
# Copyright (C) The LineageOS Project
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

# Inherit proprietary files
$(call inherit-product, vendor/samsung/a25x/a25x-vendor.mk)

# Inherit common makefile
$(call inherit-product, device/samsung/s5e8825-common/common.mk)

# Inherit Dalvik VM configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

DEVICE_PATH := device/samsung/a25x

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/mixer_paths_a25x.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_a25x.xml \
    $(DEVICE_PATH)/configs/audio/mixer_gains_a25x.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_gains_a25x.xml \
    $(DEVICE_PATH)/configs/audio/audio_board_info_a25x.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_board_info_a25x.xml \
    $(DEVICE_PATH)/configs/audio/mixer_paths_m34x.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(DEVICE_PATH)/configs/audio/mixer_gains_m34x.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_gains.xml \
    $(DEVICE_PATH)/configs/audio/audio_board_info_m34x.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_board_info.xml

# FM Radio
PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni

$(call soong_config_set,libfmjni,vendor,slsi)

# Init
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/init/init.a25x.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.a25x.rc \
    $(DEVICE_PATH)/configs/init/init.s5e8825.unify.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.s5e8825.unify.rc

# Nfc
PRODUCT_PACKAGES += android.hardware.nfc@1.2-service.st

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(DEVICE_PATH)/configs/nfc/libnfc-hal-st.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st.conf

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

# Placeholders
EMPTY_PLACEHOLDER := $(DEVICE_PATH)/configs/placeholder

PRODUCT_COPY_FILES += \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/calliope_sram.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/mfc_fw.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/os.checked.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/NPU.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/vts.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/calliope_dram.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/is_lib.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/is_rta.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/sb_others.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/setfile_4ha.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/setfile_gc02m1.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/setfile_hi1339.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/setfile_jn1.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/SoundBoosterParam.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/tfa9878.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/tfa98xx.cnt \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/txse1.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/txse2.bin

