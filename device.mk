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

# Inherit from the common tree
$(call inherit-product, device/samsung/s5e8825-common/common.mk)

PRODUCT_CHARACTERISTICS := phone

# Variant props
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/props/system_a25x/system_a2560.prop:$(TARGET_COPY_OUT_SYSTEM)/build_SM-A2560.prop \
    $(LOCAL_PATH)/configs/props/system_a25x/system_a256e.prop:$(TARGET_COPY_OUT_SYSTEM)/build_SM-A256E.prop \
    $(LOCAL_PATH)/configs/props/system_a25x/system_a256b.prop:$(TARGET_COPY_OUT_SYSTEM)/build_SM-A256B.prop \
    $(LOCAL_PATH)/configs/props/vendor_a25x/vendor_a2560.prop:$(TARGET_COPY_OUT_VENDOR)/build_SM-A2560.prop \
    $(LOCAL_PATH)/configs/props/vendor_a25x/vendor_a256e.prop:$(TARGET_COPY_OUT_VENDOR)/build_SM-A256E.prop \
    $(LOCAL_PATH)/configs/props/vendor_a25x/vendor_a256b.prop:$(TARGET_COPY_OUT_VENDOR)/build_SM-A256B.prop \
    $(LOCAL_PATH)/configs/props/odm_a25x/odm_a2560.prop:$(TARGET_COPY_OUT_ODM)/build_SM-A2560.prop \
    $(LOCAL_PATH)/configs/props/odm_a25x/odm_a256e.prop:$(TARGET_COPY_OUT_ODM)/build_SM-A256E.prop \
    $(LOCAL_PATH)/configs/props/odm_a25x/odm_a256b.prop:$(TARGET_COPY_OUT_ODM)/build_SM-A256B.prop \
    $(LOCAL_PATH)/configs/props/product_a25x/product_a2560.prop:$(TARGET_COPY_OUT_PRODUCT)/build_SM-A2560.prop \
    $(LOCAL_PATH)/configs/props/product_a25x/product_a256e.prop:$(TARGET_COPY_OUT_PRODUCT)/build_SM-A256E.prop \
    $(LOCAL_PATH)/configs/props/product_a25x/product_a256b.prop:$(TARGET_COPY_OUT_PRODUCT)/build_SM-A256B.prop \
    $(LOCAL_PATH)/configs/props/system_ext_a25x/system_ext_a2560.prop:$(TARGET_COPY_OUT_SYSTEM_EXT)/build_SM-A2560.prop \
    $(LOCAL_PATH)/configs/props/system_ext_a25x/system_ext_a256e.prop:$(TARGET_COPY_OUT_SYSTEM_EXT)/build_SM-A256E.prop \
    $(LOCAL_PATH)/configs/props/system_ext_a25x/system_ext_a256b.prop:$(TARGET_COPY_OUT_SYSTEM_EXT)/build_SM-A256B.prop

# Inherit proprietary files
$(call inherit-product, vendor/samsung/a25x/a25x-vendor.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

DEVICE_PATH := device/samsung/a25x

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/audio_board_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_board_info.xml \
    $(DEVICE_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# FM Radio
PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni

$(call soong_config_set,libfmjni,vendor,slsi)

# init
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/init/init.s5e8825.unify.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.s5e8825.unify.rc

# Nfc
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/nfc/libnfc-hal-st.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st.conf

DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/configs/vintf/android.hardware.nfc@1.2-service.st.xml

PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service.st

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
PRODUCT_ENFORCE_RRO_TARGETS += *

EMPTY_PLACEHOLDER := $(DEVICE_PATH)/configs/placeholder

# Placeholders
PRODUCT_COPY_FILES += \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/AP_AUDIO_SLSI.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/APDV_AUDIO_SLSI.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/calliope_sram.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/mfc_fw.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/os.checked.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/NPU.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/vts.bin

# WiFi
PRODUCT_PACKAGES += \
    WifiOverlayA25X
