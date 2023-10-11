import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_google_place_autocomplete/enums/auto_complete_dialog_mode.dart';
import 'package:flutter_google_place_autocomplete/enums/place_field.dart';
import 'package:flutter_google_place_autocomplete/exceptions/fgpa_exceptions.dart';
import 'package:flutter_google_place_autocomplete/flutter_google_place_autocomplete.dart';
import 'package:flutter_google_place_autocomplete/models/prediction.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    FlutterGooglePlaceAutocomplete.initializeGPA(dotenv.env['GOOGLE_API_KEY']!);
    print("GOOGLEAPIKEY ${dotenv.env['GOOGLE_API_KEY']!}");
  }

  void showDialog() async {
    try {
      final Prediction? place =
          await FlutterGooglePlaceAutocomplete.showAutoCompleteDialog(
        fields: [PlaceField.id, PlaceField.name],
        autoCompleteDialogMode: AutoCompleteDialogMode.overlay,
      );
      if (place == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("null"),
          ));
        }
        return;
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("RES $place"),
        ));
      }
    } catch (e) {
      if (e is AutocompleteRequestFieldsEmptyException) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red,
          ));
        }
        return;
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString()),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      floatingActionButton: FloatingActionButton.small(onPressed: () {
        showDialog();
      }),
    );
  }
}
