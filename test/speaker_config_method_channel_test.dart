import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speaker_config/speaker_config_method_channel.dart';

void main() {
  MethodChannelSpeakerConfig platform = MethodChannelSpeakerConfig();
  const MethodChannel channel = MethodChannel('speaker_config');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
