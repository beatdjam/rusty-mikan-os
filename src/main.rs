#![no_std]
#![no_main]

use uefi::prelude::*;
use core::fmt::Write;

#[entry]
fn efi_main(_handle: Handle, mut st: SystemTable<Boot>) -> Status {
    uefi_services::init(&mut st).unwrap();
    writeln!(st.stdout(), "Hello, world!").unwrap();

    loop {}
    // Status::SUCCESS
}