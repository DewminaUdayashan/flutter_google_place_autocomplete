import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class SpecialDay {
  const SpecialDay({
    required this.date,
    required this.exceptional,
  });

  final DateTime date;
  final bool exceptional;

  SpecialDay copyWith({
    DateTime? date,
    bool? exceptional,
  }) {
    return SpecialDay(
      date: date ?? this.date,
      exceptional: exceptional ?? this.exceptional,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date.millisecondsSinceEpoch,
      'exceptional': exceptional,
    };
  }

  factory SpecialDay.fromMap(Map<String, dynamic> map) {
    return SpecialDay(
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      exceptional: map['exceptional'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpecialDay.fromJson(String source) =>
      SpecialDay.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SpecialDay(date: $date, exceptional: $exceptional)';

  @override
  bool operator ==(covariant SpecialDay other) {
    if (identical(this, other)) return true;

    return other.date == date && other.exceptional == exceptional;
  }

  @override
  int get hashCode => date.hashCode ^ exceptional.hashCode;
}
