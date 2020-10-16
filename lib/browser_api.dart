
import 'dart:async';

import 'package:flutter/services.dart';

class BrowserApi {
  static const MethodChannel _channel = const MethodChannel('browser_api');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
