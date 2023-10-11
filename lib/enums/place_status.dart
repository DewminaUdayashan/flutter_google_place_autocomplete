enum PlaceStatus {
  available('TRUE'),
  notAvailable('FALSE'),
  unknown('UNKNOWN');

  const PlaceStatus(this.lable);

  final String lable;

  static PlaceStatus? valueOf(String value) {
    final result =
        PlaceStatus.values.where((element) => element.lable == value);
    if (result.isEmpty) return null;
    return result.first;
  }
}
