#![allow(unused_variables)]

use flutter_rust_bridge::{SyncReturn};

pub fn sync_return_random_number() -> SyncReturn<Vec<u8>> {
    let rng = rand::random::<u8>();
    SyncReturn(vec![rng])
}