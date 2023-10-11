// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LatLng {
  LatLng({required this.latitude, required this.longitude});

  final double latitude;
  final double longitude;

  factory LatLng.fromMap(Map<String, dynamic> map) {
    return LatLng(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

  @override
  String toString() => 'LatLng(latitude: $latitude, longitude: $longitude)';

  LatLng copyWith({
    double? latitude,
    double? longitude,
  }) {
    return LatLng(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  String toJson() => json.encode(toMap());

  factory LatLng.fromJson(String source) =>
      LatLng.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant LatLng other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude && other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}
