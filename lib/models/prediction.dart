// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'coordinates.dart';

class Prediction {
  Prediction({
    this.id,
    this.name,
    this.coordinates,
  });

  final String? id;
  final String? name;
  final Coordinates? coordinates;

  factory Prediction.fromMap(Map<String, dynamic> map) {
    final lat = map['lat'];
    final long = map['long'];
    return Prediction(
      id: map['place_id'],
      name: map['place_name'],
      coordinates: lat != null && long != null
          ? Coordinates(latitude: lat, longitude: long)
          : null,
    );
  }

  @override
  String toString() =>
      'Prediction(id: $id, name: $name, coordinates: $coordinates)';
}
