import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:browser_api/browser_api.dart';

void main() {
  const MethodChannel channel = MethodChannel('browser_api');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  /// No tests required
}
