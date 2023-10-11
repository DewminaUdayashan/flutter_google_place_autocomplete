import 'flutter_google_place_autocomplete_platform_interface.dart';
import 'models/google_place.dart';

class FlutterGooglePlaceAutocomplete {
  static Future<GooglePlace?> showAutoCompleteDialog() {
    return FlutterGooglePlaceAutocompletePlatform.instance
        .showAutoCompleteDialog();
  }

  static Future<void> initializeGPA(String apiKey) {
    return FlutterGooglePlaceAutocompletePlatform.instance
        .initializeGPA(apiKey);
  }
}
