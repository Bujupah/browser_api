import 'dart:async';
// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

import 'package:browser_api/api/audiorecorder.dart';
import 'package:browser_api/api/notification.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

/// A web implementation of the BrowserApi plugin.
class BrowserApiWeb {
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'browser_api',
      const StandardMethodCodec(),
      registrar.messenger,
    );

    final pluginInstance = BrowserApiWeb();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
  }

  /// Handles method calls over the MethodChannel of this plugin.
  /// Note: Check the "federated" architecture for a new way of doing this:
  /// https://flutter.dev/go/federated-plugins
  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details: 'browser_api for web doesn\'t implement \'${call.method}\'',
        );
    }
  }

  // This needs implementation with the new architecture
  // Someone reading this should help me out and do a PR
  // Thanks <3
  
  static BrowserApiWeb _instance;
  factory BrowserApiWeb() => _instance ??= BrowserApiWeb._internal();
  
  BrowserApiWeb._internal(){
    BrowserRecorder();
    BrowserNotify();
  }

  BrowserRecorder get audioRecorder => BrowserRecorder.instance;
  BrowserNotify get notify => BrowserNotify.instance;


}
