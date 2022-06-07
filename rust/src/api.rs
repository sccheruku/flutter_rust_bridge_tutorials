#![allow(unused_variables)]

use anyhow::Result;
use flutter_rust_bridge::StreamSink;
use serde_derive::{Deserialize, Serialize};
use std::sync::atomic::{AtomicU64, Ordering};
use std::{thread::sleep, time::Duration};

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

#[derive(Serialize, Deserialize, Debug)]
pub struct RepoInfo {
    pub stargazers_count: i32,
    pub language: String,
    pub forks: i32,
    pub open_issues: i32,
    pub subscribers_count: i32,
    pub network_count: i32,
}

/*
// Non blocking async approach does not work yet.
#[tokio::main(flavor = "current_thread")]
pub async fn get_repo_info(repo_name: String) -> Result<RepoInfo> {
    // url: https://api.github.com/repos/fzyzcjy/flutter_rust_bridge
    let url = format!("https://api.github.com/repos/{}", repo_name);
    let res = reqwest::blocking::get(url).unwrap().json::<RepoInfo>();
    match res.ok() {
        Some(repo_info) => Ok(repo_info),
        None => Err(anyhow::Error::msg("message"))
    }
}
*/

pub fn get_repo_info(repo_name: String) -> RepoInfo {
    let url = format!("https://api.github.com/repos/{}", repo_name);

    let client = reqwest::blocking::Client::new();

    let repo_info = client
        .get(url)
        .header(reqwest::header::USER_AGENT, "android-flutter")
        .send()
        .unwrap()
        .json::<RepoInfo>()
        .unwrap();

    repo_info
}
