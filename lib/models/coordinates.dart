class Coordinates {
  Coordinates({required this.latitude, required this.longitude});

  final int latitude;
  final int longitude;

  @override
  String toString() => 'Latitude : $latitude, Longitude : $longitude';
}
