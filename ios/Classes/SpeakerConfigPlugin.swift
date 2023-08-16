import Flutter
import UIKit
import AVFoundation

public class SpeakerConfigPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "speaker_config", binaryMessenger: registrar.messenger())
    let instance = SpeakerConfigPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "configureAudioSession" {
        // Configure the audio session here using AVAudioSession
        let session = AVAudioSession.sharedInstance();
        // Check if the microphone is being used
        if session.inputNumberOfChannels == 0 {
          do {
              try session.setCategory(.playAndRecord, options: [.allowBluetoothA2DP, .allowBluetooth, .defaultToSpeaker])
              try session.setActive(true)
              result("Audio session configured successfully")
            } catch {
              result("Failed to configure audio session: \(error)")
            }
        }
    } else {
        result(FlutterMethodNotImplemented)
    }
  }
}
