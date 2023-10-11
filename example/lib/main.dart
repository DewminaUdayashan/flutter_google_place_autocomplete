import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_google_place_autocomplete/flutter_google_place_autocomplete.dart';
import 'package:flutter_google_place_autocomplete/models/google_place.dart';

void main() {
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
    FlutterGooglePlaceAutocomplete.initializeGPA(
        'xxx');
  }

  void showDialog() async {
    try {
      final GooglePlace? place =
          await FlutterGooglePlaceAutocomplete.showAutoCompleteDialog();
      if (place == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("null"),
          ));
        }
        return;
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(place!.name +
              " " +
              place.longitude.toString() +
              ' ' +
              place.latitude.toString()),
        ));
      }
    } catch (e) {
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
