# TWRP Device Tree for OnePlus CPH2709 (lexus)

This is a modernized **TWRP bring-up device tree** for **OnePlus CPH2709 (lexus)** based on **Qualcomm SM8475 (Pineapple)**.

---

## 📱 Device Info

| Property               | Value                                                 |
| ---------------------- | ----------------------------------------------------- |
| **Device**             | OnePlus CPH2709                                       |
| **Codename**           | `lexus`                                               |
| **Platform**           | Qualcomm SM8475 (Pineapple)                           |
| **Architecture**       | ARM64                                                 |
| **Partition Scheme**   | A/B, Dynamic                                          |
| **Recovery Partition** | ✅ Dedicated (`BOARD_USES_RECOVERY_AS_BOOT := false`) |
| **Android Base**       | Android 15 / OxygenOS 15                              |
| **Manifest Base**      | minimal-manifest-twrp `twrp-12.1`                     |
| **Build Status**       | ✅ Compiling successfully                             |

---

## ⚙️ Features

- ✅ Dynamic partitions
- ✅ A/B OTA support
- ✅ FastbootD integration
- ✅ Metadata & FBEv2 decryption hooks
- ✅ AVB / DM-Verity disabled for TWRP
- ✅ Prebuilt kernel, DTBO, and recovery placeholders
- ✅ ext4 / f2fs / ntfs_3g support
- ✅ Modern Soong SEPolicy paths
- ✅ Clean build environment (no legacy add_lunch_combo)

---

## 📁 Directory Structure

├── AndroidProducts.mk
├── BoardConfig.mk
├── recovery.fstab
├── sepolicy/
│ ├── public/
│ └── private/
├── twrp_lexus.mk
├── vendorsetup.sh
└── prebuilt/
├── Image.gz-dtb
├── dtbo.img
└── recovery.img

---

## 🏗️ Build Instructions

### 1️⃣ Initialize TWRP manifest

repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync

### 2️⃣ Clone this device tree

git clone https://github.com/killshotxd/lexus_bringup_twrp.git device/oneplus/lexus

### 3️⃣ Build TWRP

export ALLOW_MISSING_DEPENDENCIES=true
. build/envsetup.sh
lunch twrp_lexus-eng
mka recoveryimage -j8

### 4️⃣ Output

out/target/product/lexus/recovery.img

---

## 🔧 Flashing Instructions

### 🧪 Test Boot (Recommended)

fastboot boot out/target/product/lexus/recovery.img

### 💾 Flash Permanently

fastboot flash recovery out/target/product/lexus/recovery.img
fastboot reboot

---

## 🧠 Notes

- `BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600` (100 MB)
- `BOARD_USES_RECOVERY_AS_BOOT := false` → dedicated recovery partition
- `AB_OTA_PARTITIONS` excludes `vendor_boot`
- Kernel & DTBO prebuilts:
  device/oneplus/lexus/prebuilt/Image.gz-dtb
  device/oneplus/lexus/prebuilt/dtbo.img

---

## 🧩 Credits

- **TeamWin (TWRP)** – base recovery sources
- **minimal-manifest-twrp** – manifest base
- **OnePlus** – proprietary firmware
- **@killshotxd** – device bring-up & modernization
- **grep** – helping in bring-up

---

## 👨‍💻 Maintainer

**(@killshotxd)**

---

## 🪄 License

This project is licensed under the **GNU General Public License v3.0 (GPL-3)**.  
You are free to use, modify, and redistribute with proper attribution.

---

> “Because even recovery deserves to look premium.” 💫
