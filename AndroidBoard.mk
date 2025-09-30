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

MKDTBOIMG                      := $(HOST_OUT_EXECUTABLES)/mkdtboimg$(HOST_EXECUTABLE_SUFFIX)
DTBO_DIR                       := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ//arch/$(KERNEL_ARCH)/boot/dts/exynos/samsung/m34x
DTBO_CFG                       := $(DEVICE_PATH)/configs/kernel/m34x.cfg
INSTALLED_DTBOIMAGE_M34X_TARGET := $(PRODUCT_OUT)/dtbo_m34x.img

$(INSTALLED_DTBOIMAGE_M34X_TARGET): $(PRODUCT_OUT)/kernel $(MKDTBOIMG)
	$(hide) echo "Building dtbo_m34x.img"
	$(hide) $(MKDTBOIMG) cfg_create $@ $(DTBO_CFG) -d $(DTBO_DIR)
	$(hide) $(call assert-max-image-size,$@,$(BOARD_DTBOIMG_M34X_PARTITION_SIZE),raw)

.PHONY: dtboimage
dtboimage: $(INSTALLED_DTBOIMAGE_M34X_TARGET)

INSTALLED_RADIOIMAGE_TARGET += $(INSTALLED_DTBOIMAGE_M34X_TARGET)
