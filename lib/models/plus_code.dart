import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class PlusCode {
  const PlusCode({
    this.compoundCode,
    this.globalCode,
  });

  final String? compoundCode;
  final String? globalCode;

  factory PlusCode.fromMap(Map<String, dynamic> map) {
    return PlusCode(
      compoundCode:
          map['compoundCode'] != null ? map['compoundCode'] as String : null,
      globalCode:
          map['globalCode'] != null ? map['globalCode'] as String : null,
    );
  }

  factory PlusCode.fromJson(String source) =>
      PlusCode.fromMap(json.decode(source) as Map<String, dynamic>);

  PlusCode copyWith({
    String? compoundCode,
    String? globalCode,
  }) {
    return PlusCode(
      compoundCode: compoundCode ?? this.compoundCode,
      globalCode: globalCode ?? this.globalCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'compoundCode': compoundCode,
      'globalCode': globalCode,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'PlusCode(compoundCode: $compoundCode, globalCode: $globalCode)';

  @override
  bool operator ==(covariant PlusCode other) {
    if (identical(this, other)) return true;

    return other.compoundCode == compoundCode && other.globalCode == globalCode;
  }

  @override
  int get hashCode => compoundCode.hashCode ^ globalCode.hashCode;
}
