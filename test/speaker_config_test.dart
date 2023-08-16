import 'package:flutter_test/flutter_test.dart';
import 'package:speaker_config/speaker_config.dart';
import 'package:speaker_config/speaker_config_platform_interface.dart';
import 'package:speaker_config/speaker_config_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSpeakerConfigPlatform
    with MockPlatformInterfaceMixin
    implements SpeakerConfigPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SpeakerConfigPlatform initialPlatform = SpeakerConfigPlatform.instance;

  test('$MethodChannelSpeakerConfig is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSpeakerConfig>());
  });

  test('getPlatformVersion', () async {
    SpeakerConfig speakerConfigPlugin = SpeakerConfig();
    MockSpeakerConfigPlatform fakePlatform = MockSpeakerConfigPlatform();
    SpeakerConfigPlatform.instance = fakePlatform;

    expect(await speakerConfigPlugin.getPlatformVersion(), '42');
  });
}
