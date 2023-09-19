cargo build --release
qemu-img create -f raw disk.img 200M
mkfs.fat -n 'MIKAN OS' -s 2 -f 2 -R 32 -F 32 disk.img
hdiutil attach disk.img
mkdir -p /Volumes/MIKAN\ OS/EFI/BOOT
cp target/x86_64-unknown-uefi/release/rusty-mikan-os.efi /Volumes/MIKAN\ OS/EFI/BOOT/BOOTX64.EFI
hdiutil detach /Volumes/MIKAN\ OS
qemu-system-x86_64 -drive if=pflash,format=raw,file=$HOME/ghq/github.com/uchan-nos/mikanos-build/devenv/OVMF_CODE.fd -drive if=pflash,format=raw,file=$HOME/ghq/github.com/uchan-nos/mikanos-build/devenv/OVMF_VARS.fd -hda disk.img