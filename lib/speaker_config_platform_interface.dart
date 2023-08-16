import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'speaker_config_method_channel.dart';

abstract class SpeakerConfigPlatform extends PlatformInterface {
  /// Constructs a SpeakerConfigPlatform.
  SpeakerConfigPlatform() : super(token: _token);

  static final Object _token = Object();

  static SpeakerConfigPlatform _instance = MethodChannelSpeakerConfig();

  /// The default instance of [SpeakerConfigPlatform] to use.
  ///
  /// Defaults to [MethodChannelSpeakerConfig].
  static SpeakerConfigPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SpeakerConfigPlatform] when
  /// they register themselves.
  static set instance(SpeakerConfigPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
