class GooglePlace {
  GooglePlace(
      {required this.id,
        required this.name,
        required this.latitude,
        required this.longitude});

  final String id;
  final String name;
  final double latitude;
  final double longitude;

  factory GooglePlace.fromMap(Map<String, dynamic> map) => GooglePlace(
    id: map['place_id'],
    name: map['place_name'],
    latitude: map['lat'],
    longitude: map['long'],
  );
}
