// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_google_place_autocomplete/models/lat_lng.dart';

class LatLngBounds {
  LatLngBounds({
    this.southwest,
    this.northeast,
  });

  final LatLng? southwest;
  final LatLng? northeast;

  // bool contains(LatLng latLng) {
  //   final double lat = latLng.latitude;
  //   return southwest.latitude <= lat &&
  //       lat <= northeast.latitude &&
  //       _isLongitudeContained(latLng.longitude);
  // }

  // LatLngBounds including(LatLng latLng) {
  //   double minLat = southwest.latitude;
  //   double maxLat = northeast.latitude;
  //   double maxLng = northeast.longitude;
  //   double minLng = southwest.longitude;
  //   final double lng = latLng.longitude;

  //   if (!_isLongitudeContained(lng)) {
  //     final double delta1 = _calculateLongitudeDelta(minLng, lng);
  //     final double delta2 = _calculateLongitudeDelta(lng, maxLng);
  //     if (delta1 < delta2) {
  //       minLng = lng;
  //     } else {
  //       maxLng = lng;
  //     }
  //   }

  //   return LatLngBounds(
  //     southwest: LatLng(latitude: minLat, longitude: minLng),
  //     northeast: LatLng(latitude: maxLat, longitude: maxLng),
  //   );
  // }

  // double _calculateLongitudeDelta(double startLng, double endLng) {
  //   return (endLng - startLng + 360.0) % 360.0;
  // }

  // LatLng getCenter() {
  //   final double lat1 = southwest.latitude;
  //   final double lat2 = northeast.latitude;
  //   final double lng1 = southwest.longitude;
  //   final double lng2 = northeast.longitude;

  //   final double lat = (lat1 + lat2) / 2.0;
  //   double lng;

  //   if (lng1 <= lng2) {
  //     lng = (lng1 + lng2) / 2.0;
  //   } else {
  //     lng = (lng1 + 360.0 + lng2) / 2.0;
  //   }

  //   return LatLng(latitude: lat, longitude: lng);
  // }

  // bool _isLongitudeContained(double lng) {
  //   if (southwest.longitude <= northeast.longitude) {
  //     return southwest.longitude <= lng && lng <= northeast.longitude;
  //   } else {
  //     return southwest.longitude <= lng || lng <= northeast.longitude;
  //   }
  // }

  @override
  String toString() =>
      'LatLngBounds(southwest: $southwest, northeast: $northeast)';

  LatLngBounds copyWith({
    LatLng? southwest,
    LatLng? northeast,
  }) {
    return LatLngBounds(
      southwest: southwest ?? this.southwest,
      northeast: northeast ?? this.northeast,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'southwest': southwest?.toMap(),
      'northeast': northeast?.toMap(),
    };
  }

  factory LatLngBounds.fromMap(Map<String, dynamic> map) {
    final southwest = Map<String, dynamic>.from(map['southwest']);
    final northeast = Map<String, dynamic>.from(map['northeast']);
    return LatLngBounds(
      southwest: southwest.isNotEmpty ? LatLng.fromMap(southwest) : null,
      northeast: northeast.isNotEmpty ? LatLng.fromMap(northeast) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LatLngBounds.fromJson(String source) =>
      LatLngBounds.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant LatLngBounds other) {
    if (identical(this, other)) return true;

    return other.southwest == southwest && other.northeast == northeast;
  }

  @override
  int get hashCode => southwest.hashCode ^ northeast.hashCode;
}
