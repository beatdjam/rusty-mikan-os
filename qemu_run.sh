cargo build --release
cp target/x86_64-unknown-uefi/release/rusty-mikan-os.efi ~/path/to/EFI/BOOT/bootx64.efi
cd $HOME
qemu-system-x86_64 -bios path/to/OVMF.fd -drive format=raw,file=fat:rw:path/to/