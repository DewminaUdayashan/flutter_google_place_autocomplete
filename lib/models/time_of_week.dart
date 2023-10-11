import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../enums/day_of_week.dart';
import 'time_period.dart';

@immutable
class TimeOfWeek {
  const TimeOfWeek({
    this.day,
    this.date,
    this.time,
  });

  final DayOfWeek? day;
  final DateTime? date;
  final TimePeriod? time;

  factory TimeOfWeek.fromMap(Map<String, dynamic> map) {
    return TimeOfWeek(
      day: map['day'] != null ? DayOfWeek.valueOf(map['day']) : null,
      time: map['time'] != null
          ? TimePeriod.fromMap(Map<String, dynamic>.from(map['time']))
          : null,
      date: DateTime.tryParse(map['date'] ?? ''),
    );
  }

  factory TimeOfWeek.fromJson(String source) =>
      TimeOfWeek.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day?.lable,
      'time': time,
      'date': date?.toLocal(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'TimeOfWeek(day: $day, time: $time)';

  @override
  bool operator ==(covariant TimeOfWeek other) {
    if (identical(this, other)) return true;

    return other.day == day && other.date == date && other.time == time;
  }

  @override
  int get hashCode => day.hashCode ^ date.hashCode ^ time.hashCode;

  TimeOfWeek copyWith({
    DayOfWeek? day,
    DateTime? date,
    TimePeriod? time,
  }) {
    return TimeOfWeek(
      day: day ?? this.day,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }
}
