import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'speaker_config_platform_interface.dart';

/// An implementation of [SpeakerConfigPlatform] that uses method channels.
class MethodChannelSpeakerConfig extends SpeakerConfigPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('speaker_config');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
