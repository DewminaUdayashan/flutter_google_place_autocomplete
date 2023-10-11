// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_google_place_autocomplete/flutter_google_place_autocomplete.dart';
// import 'package:flutter_google_place_autocomplete/flutter_google_place_autocomplete_platform_interface.dart';
// import 'package:flutter_google_place_autocomplete/flutter_google_place_autocomplete_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';
//
// class MockFlutterGooglePlaceAutocompletePlatform
//     with MockPlatformInterfaceMixin
//     implements FlutterGooglePlaceAutocompletePlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }
//
// void main() {
//   final FlutterGooglePlaceAutocompletePlatform initialPlatform = FlutterGooglePlaceAutocompletePlatform.instance;
//
//   test('$MethodChannelFlutterGooglePlaceAutocomplete is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelFlutterGooglePlaceAutocomplete>());
//   });
//
//   test('getPlatformVersion', () async {
//     FlutterGooglePlaceAutocomplete flutterGooglePlaceAutocompletePlugin = FlutterGooglePlaceAutocomplete();
//     MockFlutterGooglePlaceAutocompletePlatform fakePlatform = MockFlutterGooglePlaceAutocompletePlatform();
//     FlutterGooglePlaceAutocompletePlatform.instance = fakePlatform;
//
//     expect(await flutterGooglePlaceAutocompletePlugin.getPlatformVersion(), '42');
//   });
// }
