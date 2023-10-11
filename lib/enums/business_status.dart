enum BusinessStatus {
  operational('OPERATIONAL'),
  closedTemporarily('CLOSED_TEMPORARILY'),
  closedPermanently('CLOSED_PERMANENTLY');

  const BusinessStatus(this.lable);

  final String lable;

  static BusinessStatus? valueOf(String value) {
    final result =
        BusinessStatus.values.where((element) => element.lable == value);
    if (result.isEmpty) return null;
    return result.first;
  }
}
