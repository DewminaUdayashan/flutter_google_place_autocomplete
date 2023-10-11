import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_place_autocomplete/exceptions/fgpa_exceptions.dart';

import 'enums/auto_complete_dialog_mode.dart';
import 'enums/place_field.dart';
import 'flutter_google_place_autocomplete_platform_interface.dart';
import 'models/prediction.dart';

/// An implementation of [FlutterGooglePlaceAutocompletePlatform] that uses method channels.
class MethodChannelFlutterGooglePlaceAutocomplete
    extends FlutterGooglePlaceAutocompletePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel =
      const MethodChannel('flutter_google_place_autocomplete');

  @override
  Future<Prediction?> showAutoCompleteDialog({
    required List<PlaceField> fields,
    AutoCompleteDialogMode autoCompleteDialogMode =
        AutoCompleteDialogMode.overlay,
  }) async {
    try {
      final map = await methodChannel.invokeMethod('show_default', {
        'mode': autoCompleteDialogMode.label,
        'fields': fields.map((e) => e.label).toList(),
      });
      if (map == null) return null;
      return Prediction.fromMap(Map<String, dynamic>.from(map));
    } on PlatformException catch (e) {
      switch (e.code) {
        case 'GPA_FIELDS_EMPTY':
          throw AutocompleteRequestFieldsEmptyException();
        default:
          rethrow;
      }
    }
  }

  @override
  Future<void> initializeGPA(String apiKey) async {
    await methodChannel.invokeMethod('initialize', {'key': apiKey});
  }
}
