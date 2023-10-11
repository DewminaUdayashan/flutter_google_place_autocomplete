import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class TimePeriod {
  const TimePeriod({
    this.hours,
    this.minutes,
  });

  final int? hours;
  final int? minutes;

  TimePeriod copyWith({
    int? hours,
    int? minutes,
  }) {
    return TimePeriod(
      hours: hours ?? this.hours,
      minutes: minutes ?? this.minutes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hours': hours,
      'minutes': minutes,
    };
  }

  factory TimePeriod.fromMap(Map<String, dynamic> map) {
    return TimePeriod(
      hours: map['hours'] != null ? map['hours'] as int : null,
      minutes: map['minutes'] != null ? map['minutes'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TimePeriod.fromJson(String source) =>
      TimePeriod.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TimePeriod(hours: $hours, minutes: $minutes)';

  @override
  bool operator ==(covariant TimePeriod other) {
    if (identical(this, other)) return true;

    return other.hours == hours && other.minutes == minutes;
  }

  @override
  int get hashCode => hours.hashCode ^ minutes.hashCode;
}
