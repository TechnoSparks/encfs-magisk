# EncFS
EncFS binaries for the Android environment, packaged as Magisk module

Built by [DualJoe](https://forum.xda-developers.com/member.php?u=4293606) @ XDA Developers

## About
Installing this module will allow you to have EncFS binary and other required binaries in `/system/bin`, thus allowing you to make use of the encryption for your files.

This module only packages the binary files! No feature is provided with this module.

Binary files are taken from "[Linux binaries for Android](https://forum.xda-developers.com/android/software/utils-data-recovery-tools-testdisk-t3709380)" XDA thread by DualJoe.

Note: Only report issues/questions on this GitHub repository and not XDA thread linked above. This module is packed and managed by TechnoSparks and not DualJoe!

## Usage

### Requirements
- Magisk version 23
- ARM device (32-bit (ARMv7) or 64-bit (ARMv8))

### Installing
Flash the zip (Releases section) in Magisk Manager or in recovery.

### Notes
- Make sure your "Mount Namespace Mode" is set to "Global", otherwise mounted `encfs` directories won't reflect to other apps!
- Using FUSE on Android require root. Since `encfs` uses FUSE, it inherently needs root as well. Execute encfs in a root shell always.
- Much more useful info can be gathered in [this post](https://forum.xda-developers.com/t/mod-encrypt-sdcard-with-encfs.3027711/#post-75721227)

## Building
- Requires `7z` (7zip) in PATH
- Run `build.cmd` on Windows.

## Disclaimer
- This is simply a module that puts the EncFS binaries into Android utilizing [Magisk](https://github.com/topjohnwu/Magisk)
- Binaries are cross-compiled from source to Android by DualJoe @ XDA
- [EncFS source on GitHub](https://github.com/vgough/encfs)