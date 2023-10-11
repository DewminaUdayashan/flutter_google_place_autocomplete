import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'enums/auto_complete_dialog_mode.dart';
import 'enums/place_field.dart';
import 'flutter_google_place_autocomplete_method_channel.dart';
import 'models/prediction.dart';

abstract class FlutterGooglePlaceAutocompletePlatform
    extends PlatformInterface {
  /// Constructs a FlutterGooglePlaceAutocompletePlatform.
  FlutterGooglePlaceAutocompletePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterGooglePlaceAutocompletePlatform _instance =
      MethodChannelFlutterGooglePlaceAutocomplete();

  /// The default instance of [FlutterGooglePlaceAutocompletePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterGooglePlaceAutocomplete].
  static FlutterGooglePlaceAutocompletePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterGooglePlaceAutocompletePlatform] when
  /// they register themselves.
  static set instance(FlutterGooglePlaceAutocompletePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Prediction?> showAutoCompleteDialog({
    required List<PlaceField> fields,
    AutoCompleteDialogMode autoCompleteDialogMode =
        AutoCompleteDialogMode.overlay,
  }) {
    throw UnimplementedError(
        'showAutoCompleteDialog() has not been implemented.');
  }

  Future<void> initializeGPA(String apiKey) {
    throw UnimplementedError('initializeGPA() has not been implemented.');
  }
}
