import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:native_routing/native_routing.dart';

void main() {
  const MethodChannel channel = MethodChannel('native_routing');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await NativeRouting.platformVersion, '42');
  });
}
