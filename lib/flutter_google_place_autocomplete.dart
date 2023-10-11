import 'enums/auto_complete_dialog_mode.dart';
import 'enums/place_field.dart';
import 'exceptions/fgpa_exceptions.dart';
import 'flutter_google_place_autocomplete_platform_interface.dart';
import 'models/prediction.dart';

class FlutterGooglePlaceAutocomplete {
  static Future<Prediction?> showAutoCompleteDialog({
    required List<PlaceField> fields,
    AutoCompleteDialogMode autoCompleteDialogMode =
        AutoCompleteDialogMode.overlay,
  }) {
    if (fields.toSet().isEmpty) {
      throw AutocompleteRequestFieldsEmptyException();
    }
    return FlutterGooglePlaceAutocompletePlatform.instance
        .showAutoCompleteDialog(
      fields: fields.toSet().toList(),
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
