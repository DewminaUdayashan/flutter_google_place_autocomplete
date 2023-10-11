enum HoursType {
  access('ACCESS'),
  breakfast('BREAKFAST'),
  brunch('BRUNCH'),
  delivery('DELIVERY'),
  dinner('DINNER'),
  driveTrough('DRIVE_TROUGH'),
  happyHour('HAPPY_HOUR'),
  kitchen('KITCHEN'),
  lunch('LUNCH'),
  onlineServiceHours('ONLINE_SERVICE_HOURS'),
  pickup('PICKUP'),
  seniorHours('SENIOR_HOURS'),
  takeout('TAKEOUT');

  const HoursType(this.label);

  final String label;

  static HoursType? ofValue(String value) {
    final results = HoursType.values.where((element) => element.label == value);
    if (results.isEmpty) return null;
    return results.first;
  }
}

extension HoursTypeExtension on HoursType {
  static HoursType? fromString(String? value) {
    return HoursType.values.firstWhere(
      (e) => e.toString() == value,
    );
  }
}
