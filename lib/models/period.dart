import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'time_of_week.dart';

@immutable
class Period {
  const Period({
    this.close,
    this.open,
  });

  final TimeOfWeek? close;
  final TimeOfWeek? open;

  factory Period.fromMap(Map<String, dynamic> map) {
    return Period(
      close: map['close'] != null
          ? TimeOfWeek.fromMap(Map<String, dynamic>.from(map['close']))
          : null,
      open: map['open'] != null
          ? TimeOfWeek.fromMap(Map<String, dynamic>.from(map['open']))
          : null,
    );
  }

  factory Period.fromJson(String source) =>
      Period.fromMap(json.decode(source) as Map<String, dynamic>);

  Period copyWith({
    TimeOfWeek? close,
    TimeOfWeek? open,
  }) {
    return Period(
      close: close ?? this.close,
      open: open ?? this.open,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'close': close?.toMap(),
      'open': open?.toMap(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'Period(close: $close, open: $open)';

  @override
  bool operator ==(covariant Period other) {
    if (identical(this, other)) return true;

    return other.close == close && other.open == open;
  }

  @override
  int get hashCode => close.hashCode ^ open.hashCode;
}
