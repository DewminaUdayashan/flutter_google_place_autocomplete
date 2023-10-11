// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class AddressComponent {
  AddressComponent({
    required this.name,
    this.shortName,
    this.types,
  });

  final String name;
  final String? shortName;
  final List<String>? types;

  AddressComponent copyWith({
    String? name,
    String? shortName,
    List<String>? types,
  }) {
    return AddressComponent(
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
      types: types ?? this.types,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'shortName': shortName,
      'types': types,
    };
  }

  factory AddressComponent.fromMap(Map<String, dynamic> map) {
    return AddressComponent(
      name: map['name'] as String,
      shortName: map['shortName'] != null ? map['shortName'] as String : null,
      types: map['types'] != null
          ? List<String>.from((List<String>.from(map['types'])))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressComponent.fromJson(String source) =>
      AddressComponent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AddressComponent(name: $name, shortName: $shortName, types: $types)';

  @override
  bool operator ==(covariant AddressComponent other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.shortName == shortName &&
        listEquals(other.types, types);
  }

  @override
  int get hashCode => name.hashCode ^ shortName.hashCode ^ types.hashCode;
}
