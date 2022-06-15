#![allow(unused_variables)]

use serde_derive::{Deserialize, Serialize};

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