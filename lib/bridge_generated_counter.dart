// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`.

// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports

import 'dart:convert';
import 'dart:typed_data';

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'dart:ffi' as ffi;

abstract class CounterApi {
  Future<int> getCounter({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kGetCounterConstMeta;

  Future<int> increment({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kIncrementConstMeta;

  Future<int> decrement({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDecrementConstMeta;
}

class CounterApiImpl extends FlutterRustBridgeBase<CounterApiWire>
    implements CounterApi {
  factory CounterApiImpl(ffi.DynamicLibrary dylib) =>
      CounterApiImpl.raw(CounterApiWire(dylib));

  CounterApiImpl.raw(CounterApiWire inner) : super(inner);

  Future<int> getCounter({dynamic hint}) => executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_get_counter(port_),
        parseSuccessData: _wire2api_u64,
        constMeta: kGetCounterConstMeta,
        argValues: [],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kGetCounterConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "get_counter",
        argNames: [],
      );

  Future<int> increment({dynamic hint}) => executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_increment(port_),
        parseSuccessData: _wire2api_u64,
        constMeta: kIncrementConstMeta,
        argValues: [],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kIncrementConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "increment",
        argNames: [],
      );

  Future<int> decrement({dynamic hint}) => executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_decrement(port_),
        parseSuccessData: _wire2api_u64,
        constMeta: kDecrementConstMeta,
        argValues: [],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kDecrementConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "decrement",
        argNames: [],
      );

  // Section: api2wire

  // Section: api_fill_to_wire

}

// Section: wire2api
int _wire2api_u64(dynamic raw) {
  return raw as int;
}

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.

/// generated by flutter_rust_bridge
class CounterApiWire implements FlutterRustBridgeWireBase {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  CounterApiWire(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  CounterApiWire.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void wire_tick(
    int port_,
  ) {
    return _wire_tick(
      port_,
    );
  }

  late final _wire_tickPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>('wire_tick');
  late final _wire_tick = _wire_tickPtr.asFunction<void Function(int)>();

  void free_WireSyncReturnStruct(
    WireSyncReturnStruct val,
  ) {
    return _free_WireSyncReturnStruct(
      val,
    );
  }

  late final _free_WireSyncReturnStructPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(WireSyncReturnStruct)>>(
          'free_WireSyncReturnStruct');
  late final _free_WireSyncReturnStruct = _free_WireSyncReturnStructPtr
      .asFunction<void Function(WireSyncReturnStruct)>();

  void wire_get_repo_info(
    int port_,
    ffi.Pointer<wire_uint_8_list> repo_name,
  ) {
    return _wire_get_repo_info(
      port_,
      repo_name,
    );
  }

  late final _wire_get_repo_infoPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64, ffi.Pointer<wire_uint_8_list>)>>('wire_get_repo_info');
  late final _wire_get_repo_info = _wire_get_repo_infoPtr
      .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  ffi.Pointer<wire_uint_8_list> new_uint_8_list(
    int len,
  ) {
    return _new_uint_8_list(
      len,
    );
  }

  late final _new_uint_8_listPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<wire_uint_8_list> Function(
              ffi.Int32)>>('new_uint_8_list');
  late final _new_uint_8_list = _new_uint_8_listPtr
      .asFunction<ffi.Pointer<wire_uint_8_list> Function(int)>();

  void wire_get_counter(
    int port_,
  ) {
    return _wire_get_counter(
      port_,
    );
  }

  late final _wire_get_counterPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_get_counter');
  late final _wire_get_counter =
      _wire_get_counterPtr.asFunction<void Function(int)>();

  void wire_increment(
    int port_,
  ) {
    return _wire_increment(
      port_,
    );
  }

  late final _wire_incrementPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_increment');
  late final _wire_increment =
      _wire_incrementPtr.asFunction<void Function(int)>();

  void wire_decrement(
    int port_,
  ) {
    return _wire_decrement(
      port_,
    );
  }

  late final _wire_decrementPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_decrement');
  late final _wire_decrement =
      _wire_decrementPtr.asFunction<void Function(int)>();

  void store_dart_post_cobject(
    DartPostCObjectFnType ptr,
  ) {
    return _store_dart_post_cobject(
      ptr,
    );
  }

  late final _store_dart_post_cobjectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(DartPostCObjectFnType)>>(
          'store_dart_post_cobject');
  late final _store_dart_post_cobject = _store_dart_post_cobjectPtr
      .asFunction<void Function(DartPostCObjectFnType)>();
}

class wire_uint_8_list extends ffi.Struct {
  external ffi.Pointer<ffi.Uint8> ptr;

  @ffi.Int32()
  external int len;
}

typedef DartPostCObjectFnType = ffi.Pointer<
    ffi.NativeFunction<ffi.Uint8 Function(DartPort, ffi.Pointer<ffi.Void>)>>;
typedef DartPort = ffi.Int64;
