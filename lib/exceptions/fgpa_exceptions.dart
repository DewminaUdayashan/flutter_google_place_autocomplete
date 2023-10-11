class FlutterGoogleAutocompleteException implements Exception {}

class InvalidAPIKeyException extends FlutterGoogleAutocompleteException {
  @override
  String toString() => 'Please check if you provided a valid Google API key';
}

class AutocompleteRequestFieldsEmptyException
    extends FlutterGoogleAutocompleteException {
  @override
  String toString() =>
      'You must provide at least a one FIELD with your request';
}

class AutocompleteUnexpectedException
    extends FlutterGoogleAutocompleteException {
  final String message;

  AutocompleteUnexpectedException({required this.message});

  @override
  String toString() => message;
}
