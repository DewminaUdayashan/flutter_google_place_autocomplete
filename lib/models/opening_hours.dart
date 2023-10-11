// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_google_place_autocomplete/enums/hours_type.dart';
import 'package:flutter_google_place_autocomplete/models/period.dart';
import 'package:flutter_google_place_autocomplete/models/special_day.dart';

@immutable
class OpeningHours {
  const OpeningHours({
    this.hoursType,
    required this.periods,
    required this.specialDays,
    required this.weekdayText,
  });

  final HoursType? hoursType;
  final List<Period> periods;
  final List<SpecialDay> specialDays;
  final List<String> weekdayText;

  OpeningHours copyWith({
    HoursType? hoursType,
    List<Period>? periods,
    List<SpecialDay>? specialDays,
    List<String>? weekdayText,
  }) {
    return OpeningHours(
      hoursType: hoursType ?? this.hoursType,
      periods: periods ?? this.periods,
      specialDays: specialDays ?? this.specialDays,
      weekdayText: weekdayText ?? this.weekdayText,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hoursType': hoursType?.label,
      'periods': periods.map((x) => x.toMap()).toList(),
      'specialDays': specialDays.map((x) => x.toMap()).toList(),
      'weekdayText': weekdayText,
    };
  }

  factory OpeningHours.fromMap(Map<String, dynamic> map) {
    return OpeningHours(
      hoursType:
          map['hoursType'] != null ? HoursType.ofValue(map['hoursType']) : null,
      periods: List<Period>.from(
        (List<dynamic>.from(map['periods'])).map<Period>(
          (x) => Period.fromMap(Map<String, dynamic>.from(x)),
        ),
      ),
      specialDays: List<SpecialDay>.from(
        (List<dynamic>.from(map['specialDays'])).map<SpecialDay>(
          (x) => SpecialDay.fromMap(x as Map<String, dynamic>),
        ),
      ),
      weekdayText: List<String>.from((List<String>.from(map['weekdayText']))),
    );
  }

  String toJson() => json.encode(toMap());

  factory OpeningHours.fromJson(String source) =>
      OpeningHours.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OpeningHours(hoursType: $hoursType, periods: $periods, specialDays: $specialDays, weekdayText: $weekdayText)';
  }

  @override
  bool operator ==(covariant OpeningHours other) {
    if (identical(this, other)) return true;

    return other.hoursType == hoursType &&
        listEquals(other.periods, periods) &&
        listEquals(other.specialDays, specialDays) &&
        listEquals(other.weekdayText, weekdayText);
  }

  @override
  int get hashCode {
    return hoursType.hashCode ^
        periods.hashCode ^
        specialDays.hashCode ^
        weekdayText.hashCode;
  }
}
