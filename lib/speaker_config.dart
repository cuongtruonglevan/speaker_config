import 'package:flutter/services.dart';

import 'speaker_config_platform_interface.dart';

class SpeakerConfig {
  static const methodChannel = MethodChannel('speaker_config');

  static Future<String> configureAudioSession() async {
    try {
      final String result =
          await methodChannel.invokeMethod('configureAudioSession');
      return result;
    } catch (e) {
      return "Error on Configuring Audio Session: $e";
    }
  }

  Future<String?> getPlatformVersion() {
    return SpeakerConfigPlatform.instance.getPlatformVersion();
  }
}
