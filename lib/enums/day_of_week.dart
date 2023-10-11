enum DayOfWeek {
  sunday("SUNDAY"),
  monday("MONDAY"),
  tuesday("TUESDAY"),
  wednesday("WEDNESDAY"),
  thursday("THURSDAY"),
  friday("FRIDAY"),
  saturday("SATURDAY");

  final String lable;

  const DayOfWeek(this.lable);

  static DayOfWeek? valueOf(String value) {
    final result = DayOfWeek.values.where((element) => element.lable == value);
    if (result.isEmpty) return null;
    return result.first;
  }
}
