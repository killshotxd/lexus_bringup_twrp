#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from OP6131L1 device
$(call inherit-product, device/oneplus/OP6131L1/device.mk)

PRODUCT_DEVICE := OP6131L1
PRODUCT_NAME := omni_OP6131L1
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := CPH2709
PRODUCT_MANUFACTURER := oneplus

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="CPH2709-user 15 UKQ1.231108.001 V.R4T2.36f1d0c-182758a-182e0f3 release-keys"

BUILD_FINGERPRINT := OnePlus/CPH2709/OP6131L1:15/UKQ1.231108.001/V.R4T2.36f1d0c-182758a-182e0f3:user/release-keys
