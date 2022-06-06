#![allow(unused_variables)]

use std::sync::atomic::{AtomicU64, Ordering};
use anyhow::Result;
use std::{thread::sleep, time::Duration};
use flutter_rust_bridge::StreamSink;

static TICKER: AtomicU64 = AtomicU64::new(0);
const ONE_SECOND: Duration = Duration::from_secs(1);

pub fn tick(sink: StreamSink<u64>) -> Result<()> {
    loop {
        sink.add(TICKER.fetch_add(1, Ordering::SeqCst));
        sleep(ONE_SECOND);
    }
    Ok(()) // Required. limitation of framework
}


static COUNTER: AtomicU64 = AtomicU64::new(0);

pub fn get_counter() -> u64 {
    COUNTER.load(Ordering::SeqCst)
}

pub fn increment() -> u64 {
    COUNTER.fetch_add(1, Ordering::SeqCst);
    COUNTER.load(Ordering::SeqCst)
}

pub fn decrement() -> u64 {
    COUNTER.fetch_sub(1, Ordering::SeqCst);
    COUNTER.load(Ordering::SeqCst)
}
