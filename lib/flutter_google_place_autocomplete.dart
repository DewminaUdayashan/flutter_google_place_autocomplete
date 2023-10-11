import 'package:flutter_google_place_autocomplete/exceptions/fgpa_exceptions.dart';
import 'package:flutter_google_place_autocomplete/models/prediction.dart';

import 'enums/auto_complete_dialog_mode.dart';
import 'enums/place_field.dart';
import 'flutter_google_place_autocomplete_platform_interface.dart';

class FlutterGooglePlaceAutocomplete {
  static Future<Prediction?> showAutoCompleteDialog({
    required List<PlaceField> fields,
    AutoCompleteDialogMode autoCompleteDialogMode =
        AutoCompleteDialogMode.overlay,
  }) {
    if (fields.isEmpty) {
      throw AutocompleteRequestFieldsEmptyException();
    }
    return FlutterGooglePlaceAutocompletePlatform.instance
        .showAutoCompleteDialog(
      fields: fields,
      autoCompleteDialogMode: autoCompleteDialogMode,
    );
  }

  static Future<void> initializeGPA(String apiKey) {
    if (apiKey.isEmpty) {
      throw InvalidAPIKeyException();
    }
    return FlutterGooglePlaceAutocompletePlatform.instance
        .initializeGPA(apiKey);
  }
}
