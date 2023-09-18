cargo build --release
rm -rf ~/path/to/EFI
mkdir -p ~/path/to/EFI/BOOT
cp target/x86_64-unknown-uefi/release/rusty-mikan-os.efi ~/path/to/EFI/BOOT/bootx64.efi
qemu-system-x86_64 -bios $HOME/path/to/OVMF.fd -drive format=raw,file=fat:rw:$HOME/path/to/