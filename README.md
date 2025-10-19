# lexus_bringup_twrp

TWRP recovery bringup for the Lexus (Qualcomm) device — device tree, vendor blobs and recovery images needed to build and run TWRP on the target device.

Maintainer: Killshotxd

## What this repository contains

- Device makefiles and product configs (AndroidProducts.mk, BoardConfig.mk, device.mk, twrp_lexus.mk)
- Recovery rootfs and vendor files under `twrp/recovery/` (binaries, libraries, init scripts, firmware)
- Prebuilt kernel in `prebuilt/kernel`
- Device configuration files (system.prop, vendor.prop, recovery.fstab, vendorsetup.sh)
- Security certificates in `security/`

This repo is focused on packaging a working TWRP recovery image and the minimal vendor blobs and configs required for the device to boot into recovery.

## Quick start (developer)

Prerequisites

- Android build environment (repo, aosp sources or lineage/twrp manifests as applicable)
- Java, gcc/clang, make, and other Android build dependencies
- A build host with enough disk space (Android builds can require 100+ GB)

High level steps

1. Sync or place this device tree into your Android/TWRP source tree under `device/vendor/lexus` (or appropriate path).
1. Place the `prebuilt/kernel` or build kernel for the device and ensure any required vendor blobs are available in the vendor partition tree.
1. Build using the TWRP/Android build system (example below is illustrative — adapt to your tree):

```bash
# Example (run from your Android/TWRP source root)
source build/envsetup.sh
lunch twrp_device-userdebug
make recoveryimage -j$(nproc)
```

1. Flash the produced `recovery.img` to the device using fastboot (device must be unlocked and in fastboot mode):

```bash
fastboot flash recovery out/target/product/lexus/recovery.img
fastboot reboot
```

Notes

- The exact lunch target and output path will depend on how you integrate this device tree into your Android/TWRP build.
- This repo does not contain the full Android source. You must build within a full TWRP/AOSP/LineageOS environment.

## Repository layout (high level)

- `AndroidProducts.mk` — product inclusion for the build
- `BoardConfig.mk` — board-level build flags
- `device.mk` — device makefile
- `twrp_lexus.mk` — TWRP-specific packaging
- `recovery.fstab` — recovery partition layout
- `system.prop`, `vendor.prop` — property overrides
- `prebuilt/kernel` — prebuilt kernel(s)
- `security/otacert.x509.pem` — OTA cert(s)
- `twrp/recovery/` — recovery root filesystem: init scripts, binaries, libs, vendor files, firmware

## Tree + Grep: quick navigation helpers

When working with bringup trees, it's common to want a quick visual of the directory structure (`tree`) and to search files (`grep`). Below are cross-platform examples you can run from the repository root.

Linux / macOS / Git Bash (recommended when using Git on Windows)

Show a compact tree (3 levels deep):

```bash
tree -L 3 -a
```

Show tree filtered to only show files/dirs that match "twrp" or "recovery":

```bash
tree -a | grep -i "twrp\|recovery"
```

Search for a symbol (for example, "init.recovery.qcom.rc") across the repo and show filenames and line numbers:

```bash
grep -RIn "init.recovery.qcom.rc" .
```

PowerShell (Windows built-in)

List the directory tree recursively (rough equivalent):

```powershell
Get-ChildItem -Recurse -Force | Format-List FullName
```

Show directories up to a certain depth (PowerShell 3+):

```powershell
Get-ChildItem -Directory -Recurse | Where-Object { $_.FullName.Split([io.path]::DirectorySeparatorChar).Count -le ($pwd.Path.Split([io.path]::DirectorySeparatorChar).Count + 3) }
```

Search for text in files (grep equivalent):

```powershell
Select-String -Path * -Pattern "init.recovery.qcom.rc" -CaseSensitive:$false -List
```

Tip: If you have Git for Windows installed, use Git Bash which provides the familiar `tree`, `grep`, and other GNU utilities.

## Common maintenance tasks

- Update vendor blobs: place new files under `twrp/recovery/vendor` or update `prebuilt/kernel` and bump any build flags in `BoardConfig.mk`.
- Add missing libraries: copy required so/ndk shims under `twrp/recovery/root/system/lib*` as needed.
- Verify init scripts: ensure `init.recovery*.rc` files exist and reference correct device nodes.

## Contributing

1. Fork the repo and create a topic branch for your change.
2. Keep commits focused and add a short, clear commit message describing the change.
3. Open a pull request against `main` and mention the maintainer `@killshotxd` for review.

## License

This repository does not include a license file. If you intend to redistribute or publish changes, add a LICENSE file or clarify licensing with the maintainer.

## Contact / Maintainer

TeamWin (TWRP) – base recovery sources
minimal-manifest-twrp – manifest base
OnePlus – proprietary firmware
Tree Base: grep
Maintainer: Killshotxd
GitHub: [https://github.com/killshotxd](https://github.com/killshotxd)

If you need help integrating this tree into a full build or want me to add example integration patches (device path, BoardConfig tweaks, or a sample `Android.mk`/`Android.bp`), open an issue or PR and mention the device details.

---

Last updated: 2025-10-19
