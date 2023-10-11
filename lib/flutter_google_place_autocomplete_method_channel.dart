import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_google_place_autocomplete_platform_interface.dart';
import 'models/google_place.dart';

/// An implementation of [FlutterGooglePlaceAutocompletePlatform] that uses method channels.
class MethodChannelFlutterGooglePlaceAutocomplete
    extends FlutterGooglePlaceAutocompletePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel =
      const MethodChannel('flutter_google_place_autocomplete');

  @override
  Future<GooglePlace?> showAutoCompleteDialog() async {
    final map = await methodChannel.invokeMethod('show_overlay');
    if (map == null) return null;
    return GooglePlace.fromMap(Map<String, dynamic>.from(map));
  }

  @override
  Future<void> initializeGPA(String apiKey) async {
    await methodChannel.invokeMethod('initialize', {'key': apiKey});
  }
}
