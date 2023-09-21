#![no_std]
#![no_main]

extern crate alloc;

use alloc::vec;
use alloc::vec::Vec;
use uefi::prelude::*;
use core::fmt::Write;
use core::mem;
use uefi::table::boot::MemoryDescriptor;

#[entry]
fn efi_main(_handle: Handle, mut st: SystemTable<Boot>) -> Status {
    uefi_services::init(&mut st).unwrap();
    writeln!(st.stdout(), "Hello, world!").unwrap();

    // MemoryMapの取得
    let _: Vec<_>  = get_memory_map(st.boot_services());

    loop {}
    // Status::SUCCESS
}

fn get_memory_map(bs: &BootServices) -> Vec<MemoryDescriptor> {
    let size = bs.memory_map_size().map_size + 8 * mem::size_of::<MemoryDescriptor>();
    let mut buf = vec![0; size];
    return bs.memory_map(&mut buf).unwrap().entries().copied().collect();
}
