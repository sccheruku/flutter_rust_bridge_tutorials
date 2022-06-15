# flutter_rust_bridge_tutorials

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Generate Code with separate files
```
flutter_rust_bridge_codegen --rust-input rust/src/counter.rs --dart-output lib/bridge_generated_counter.dart --rust-output rust/src/bridge_generated_counter.rs --class-name CounterApi

flutter_rust_bridge_codegen --rust-input rust/src/repo_info.rs --dart-output lib/bridge_generated_repo_info.dart --rust-output rust/src/bridge_generated_repo_info.rs --class-name RepoInfoApi --exclude-sync-execution-mode-utility true

flutter_rust_bridge_codegen --rust-input rust/src/ticker.rs --dart-output lib/bridge_generated_ticker.dart --rust-output rust/src/bridge_generated_ticker.rs --class-name TickerApi --exclude-sync-execution-mode-utility true

flutter_rust_bridge_codegen --rust-input rust/src/api.rs --dart-output lib/bridge_generated_api.dart --rust-output rust/src/bridge_generated_api.rs --class-name Api --exclude-sync-execution-mode-utility true

```