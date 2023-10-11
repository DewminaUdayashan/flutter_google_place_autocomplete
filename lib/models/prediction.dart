import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../enums/business_status.dart';
import '../enums/place_status.dart';
import '../enums/place_type.dart';
import 'address_component.dart';
import 'lat_lng.dart';
import 'lat_lng_bounds.dart';
import 'opening_hours.dart';
import 'plus_code.dart';

@immutable
class Prediction {
  factory Prediction.fromMap(Map<String, dynamic> map) {
    return Prediction(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      coordinates: map['coordinates'] != null
          ? LatLng.fromMap(Map<String, dynamic>.from(map['coordinates']))
          : null,
      viewport: map['viewport'] != null
          ? LatLngBounds.fromMap(Map<String, dynamic>.from(map['viewport']))
          : null,
      address: map['address'] != null ? map['address'] as String : null,
      addressComponents: map['addressComponents'] != null
          ? (map['addressComponents'] as List)
              .map(
                  (e) => AddressComponent.fromMap(Map<String, dynamic>.from(e)))
              .toList()
          : null,
      businessStatus: map['businessStatus'] != null
          ? BusinessStatus.valueOf(map['businessStatus'])
          : null,
      curbsidePickup: map['curbsidePickup'] != null
          ? PlaceStatus.valueOf(map['curbsidePickup'])
          : null,
      delivery:
          map['delivery'] != null ? PlaceStatus.valueOf(map['delivery']) : null,
      dineIn: map['dineIn'] != null ? PlaceStatus.valueOf(map['dineIn']) : null,
      reservable: map['reservable'] != null
          ? PlaceStatus.valueOf(map['reservable'])
          : null,
      servesBeer: map['servesBeer'] != null
          ? PlaceStatus.valueOf(map['servesBeer'])
          : null,
      servesBreakfast: map['servesBreakfast'] != null
          ? PlaceStatus.valueOf(map['servesBreakfast'])
          : null,
      editorialSummary: map['editorialSummary'] != null
          ? map['editorialSummary'] as String
          : null,
      iconUrl: map['iconUrl'] != null ? map['iconUrl'] as String : null,
      openingHours: map['openingHours'] != null
          ? OpeningHours.fromMap(Map<String, dynamic>.from(map['openingHours']))
          : null,
      currentOpeningHours: map['currentOpeningHours'] != null
          ? OpeningHours.fromMap(
              Map<String, dynamic>.from(map['currentOpeningHours']))
          : null,
      secondaryOpeningHours: map['secondaryOpeningHours'] != null
          ? List<OpeningHours>.from(
              (map['secondaryOpeningHours']).map<OpeningHours?>(
                (x) => OpeningHours.fromMap(x),
              ),
            )
          : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      plusCode: map['plusCode'] != null
          ? PlusCode.fromMap(Map<String, dynamic>.from(map['plusCode']))
          : null,
      priceLevel: map['priceLevel'] != null ? map['priceLevel'] as int : null,
      rating: map['rating'] != null ? map['rating'] as double : null,
      userRatingsTotal: map['userRatingsTotal'] != null
          ? map['userRatingsTotal'] as int
          : null,
      iconBackgroundColor: map['iconBackgroundColor'] != null
          ? Color(map['iconBackgroundColor'] as int)
          : null,
      servesBrunch: map['servesBrunch'] != null
          ? PlaceStatus.valueOf(map['servesBrunch'])
          : null,
      servesDinner: map['servesDinner'] != null
          ? PlaceStatus.valueOf(map['servesDinner'])
          : null,
      servesLunch: map['servesLunch'] != null
          ? PlaceStatus.valueOf(map['servesLunch'])
          : null,
      servesVegetarianFood: map['servesVegetarianFood'] != null
          ? PlaceStatus.valueOf(map['servesVegetarianFood'])
          : null,
      servesWine: map['servesWine'] != null
          ? PlaceStatus.valueOf(map['servesWine'])
          : null,
      takeout:
          map['takeout'] != null ? PlaceStatus.valueOf(map['takeout']) : null,
      wheelchairAccessibleEntrance: map['wheelchairAccessibleEntrance'] != null
          ? PlaceStatus.valueOf(map['wheelchairAccessibleEntrance'])
          : null,
      types: map['types'] != null
          ? List<PlaceType>.from(
              (map['types']).map<PlaceType?>(
                (x) => PlaceType.valueOf(x),
              ),
            )
          : null,
      utcOffset: map['utcOffset'] != null ? map['utcOffset'] as int : null,
      websiteUri:
          map['websiteUri'] != null ? Uri.parse(map['websiteUri']) : null,
    );
  }

  factory Prediction.fromJson(String source) =>
      Prediction.fromMap(json.decode(source) as Map<String, dynamic>);

  const Prediction({
    this.id,
    this.name,
    this.coordinates,
    this.viewport,
    this.address,
    this.addressComponents,
    this.editorialSummary,
    this.iconUrl,
    this.openingHours,
    this.currentOpeningHours,
    this.secondaryOpeningHours,
    this.phoneNumber,
    this.plusCode,
    this.priceLevel,
    this.rating,
    this.userRatingsTotal,
    this.iconBackgroundColor,
    this.curbsidePickup,
    this.delivery,
    this.dineIn,
    this.businessStatus,
    this.reservable,
    this.servesBeer,
    this.servesBreakfast,
    this.servesBrunch,
    this.servesDinner,
    this.servesLunch,
    this.servesVegetarianFood,
    this.servesWine,
    this.takeout,
    this.wheelchairAccessibleEntrance,
    this.types,
    this.utcOffset,
    this.websiteUri,
  });

  final String? id;
  final String? name;
  final LatLng? coordinates;
  final LatLngBounds? viewport;
  final String? address;
  final List<AddressComponent>? addressComponents;
  final String? editorialSummary;
  final String? iconUrl;
  final OpeningHours? openingHours;
  final OpeningHours? currentOpeningHours;
  final List<OpeningHours>? secondaryOpeningHours;
  final String? phoneNumber;
  final PlusCode? plusCode;
  final int? priceLevel;
  final double? rating;
  final int? userRatingsTotal;
  final Color? iconBackgroundColor;
  final PlaceStatus? curbsidePickup;
  final PlaceStatus? delivery;
  final PlaceStatus? dineIn;
  final BusinessStatus? businessStatus;
  final PlaceStatus? reservable;
  final PlaceStatus? servesBeer;
  final PlaceStatus? servesBreakfast;
  final PlaceStatus? servesBrunch;
  final PlaceStatus? servesDinner;
  final PlaceStatus? servesLunch;
  final PlaceStatus? servesVegetarianFood;
  final PlaceStatus? servesWine;
  final PlaceStatus? takeout;
  final PlaceStatus? wheelchairAccessibleEntrance;
  final List<PlaceType>? types;
  final int? utcOffset;
  final Uri? websiteUri;

  @override
  String toString() {
    return 'Prediction(id: $id, name: $name, coordinates: $coordinates, viewport: $viewport, address: $address, addressComponents: $addressComponents, editorialSummary: $editorialSummary, iconUrl: $iconUrl, openingHours: $openingHours, currentOpeningHours: $currentOpeningHours, secondaryOpeningHours: $secondaryOpeningHours, phoneNumber: $phoneNumber, plusCode: $plusCode, priceLevel: $priceLevel, rating: $rating, userRatingsTotal: $userRatingsTotal, iconBackgroundColor: $iconBackgroundColor, curbsidePickup: $curbsidePickup, delivery: $delivery, dineIn: $dineIn, businessStatus: $businessStatus, reservable: $reservable, servesBeer: $servesBeer, servesBreakfast: $servesBreakfast, servesBrunch: $servesBrunch, servesDinner: $servesDinner, servesLunch: $servesLunch, servesVegetarianFood: $servesVegetarianFood, servesWine: $servesWine, takeout: $takeout, wheelchairAccessibleEntrance: $wheelchairAccessibleEntrance, types: $types, utcOffset: $utcOffset, websiteUri: $websiteUri)';
  }

  Prediction copyWith({
    String? id,
    String? name,
    LatLng? coordinates,
    LatLngBounds? viewport,
    String? address,
    List<AddressComponent>? addressComponents,
    String? editorialSummary,
    String? iconUrl,
    OpeningHours? openingHours,
    OpeningHours? currentOpeningHours,
    List<OpeningHours>? secondaryOpeningHours,
    String? phoneNumber,
    PlusCode? plusCode,
    int? priceLevel,
    double? rating,
    int? userRatingsTotal,
    Color? iconBackgroundColor,
    PlaceStatus? curbsidePickup,
    PlaceStatus? delivery,
    PlaceStatus? dineIn,
    BusinessStatus? businessStatus,
    PlaceStatus? reservable,
    PlaceStatus? servesBeer,
    PlaceStatus? servesBreakfast,
    PlaceStatus? servesBrunch,
    PlaceStatus? servesDinner,
    PlaceStatus? servesLunch,
    PlaceStatus? servesVegetarianFood,
    PlaceStatus? servesWine,
    PlaceStatus? takeout,
    PlaceStatus? wheelchairAccessibleEntrance,
    List<PlaceType>? types,
    int? utcOffset,
    Uri? websiteUri,
  }) {
    return Prediction(
      id: id ?? this.id,
      name: name ?? this.name,
      coordinates: coordinates ?? this.coordinates,
      viewport: viewport ?? this.viewport,
      address: address ?? this.address,
      addressComponents: addressComponents ?? this.addressComponents,
      editorialSummary: editorialSummary ?? this.editorialSummary,
      iconUrl: iconUrl ?? this.iconUrl,
      openingHours: openingHours ?? this.openingHours,
      currentOpeningHours: currentOpeningHours ?? this.currentOpeningHours,
      secondaryOpeningHours:
          secondaryOpeningHours ?? this.secondaryOpeningHours,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      plusCode: plusCode ?? this.plusCode,
      priceLevel: priceLevel ?? this.priceLevel,
      rating: rating ?? this.rating,
      userRatingsTotal: userRatingsTotal ?? this.userRatingsTotal,
      iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
      curbsidePickup: curbsidePickup ?? this.curbsidePickup,
      delivery: delivery ?? this.delivery,
      dineIn: dineIn ?? this.dineIn,
      businessStatus: businessStatus ?? this.businessStatus,
      reservable: reservable ?? this.reservable,
      servesBeer: servesBeer ?? this.servesBeer,
      servesBreakfast: servesBreakfast ?? this.servesBreakfast,
      servesBrunch: servesBrunch ?? this.servesBrunch,
      servesDinner: servesDinner ?? this.servesDinner,
      servesLunch: servesLunch ?? this.servesLunch,
      servesVegetarianFood: servesVegetarianFood ?? this.servesVegetarianFood,
      servesWine: servesWine ?? this.servesWine,
      takeout: takeout ?? this.takeout,
      wheelchairAccessibleEntrance:
          wheelchairAccessibleEntrance ?? this.wheelchairAccessibleEntrance,
      types: types ?? this.types,
      utcOffset: utcOffset ?? this.utcOffset,
      websiteUri: websiteUri ?? this.websiteUri,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'coordinates': coordinates?.toMap(),
      'viewport': viewport?.toMap(),
      'address': address,
      'addressComponents': addressComponents?.map((x) => x.toMap()).toList(),
      'editorialSummary': editorialSummary,
      'iconUrl': iconUrl,
      'openingHours': openingHours?.toMap(),
      'currentOpeningHours': currentOpeningHours?.toMap(),
      'secondaryOpeningHours':
          secondaryOpeningHours?.map((x) => x.toMap()).toList(),
      'phoneNumber': phoneNumber,
      'plusCode': plusCode?.toMap(),
      'priceLevel': priceLevel,
      'rating': rating,
      'userRatingsTotal': userRatingsTotal,
      'iconBackgroundColor': iconBackgroundColor?.value,
      'curbsidePickup': curbsidePickup?.lable,
      'delivery': delivery?.lable,
      'dineIn': dineIn?.lable,
      'businessStatus': businessStatus?.lable,
      'reservable': reservable?.lable,
      'servesBeer': servesBeer?.lable,
      'servesBreakfast': servesBreakfast?.lable,
      'servesBrunch': servesBrunch?.lable,
      'servesDinner': servesDinner?.lable,
      'servesLunch': servesLunch?.lable,
      'servesVegetarianFood': servesVegetarianFood?.lable,
      'servesWine': servesWine?.lable,
      'takeout': takeout?.lable,
      'wheelchairAccessibleEntrance': wheelchairAccessibleEntrance?.lable,
      'types': types?.map((x) => x.lable).toList(),
      'utcOffset': utcOffset,
      'websiteUri': websiteUri?.path,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(covariant Prediction other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.coordinates == coordinates &&
        other.viewport == viewport &&
        other.address == address &&
        listEquals(other.addressComponents, addressComponents) &&
        other.editorialSummary == editorialSummary &&
        other.iconUrl == iconUrl &&
        other.openingHours == openingHours &&
        other.currentOpeningHours == currentOpeningHours &&
        listEquals(other.secondaryOpeningHours, secondaryOpeningHours) &&
        other.phoneNumber == phoneNumber &&
        other.plusCode == plusCode &&
        other.priceLevel == priceLevel &&
        other.rating == rating &&
        other.userRatingsTotal == userRatingsTotal &&
        other.iconBackgroundColor == iconBackgroundColor &&
        other.curbsidePickup == curbsidePickup &&
        other.delivery == delivery &&
        other.dineIn == dineIn &&
        other.businessStatus == businessStatus &&
        other.reservable == reservable &&
        other.servesBeer == servesBeer &&
        other.servesBreakfast == servesBreakfast &&
        other.servesBrunch == servesBrunch &&
        other.servesDinner == servesDinner &&
        other.servesLunch == servesLunch &&
        other.servesVegetarianFood == servesVegetarianFood &&
        other.servesWine == servesWine &&
        other.takeout == takeout &&
        other.wheelchairAccessibleEntrance == wheelchairAccessibleEntrance &&
        listEquals(other.types, types) &&
        other.utcOffset == utcOffset &&
        other.websiteUri == websiteUri;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        coordinates.hashCode ^
        viewport.hashCode ^
        address.hashCode ^
        addressComponents.hashCode ^
        editorialSummary.hashCode ^
        iconUrl.hashCode ^
        openingHours.hashCode ^
        currentOpeningHours.hashCode ^
        secondaryOpeningHours.hashCode ^
        phoneNumber.hashCode ^
        plusCode.hashCode ^
        priceLevel.hashCode ^
        rating.hashCode ^
        userRatingsTotal.hashCode ^
        iconBackgroundColor.hashCode ^
        curbsidePickup.hashCode ^
        delivery.hashCode ^
        dineIn.hashCode ^
        businessStatus.hashCode ^
        reservable.hashCode ^
        servesBeer.hashCode ^
        servesBreakfast.hashCode ^
        servesBrunch.hashCode ^
        servesDinner.hashCode ^
        servesLunch.hashCode ^
        servesVegetarianFood.hashCode ^
        servesWine.hashCode ^
        takeout.hashCode ^
        wheelchairAccessibleEntrance.hashCode ^
        types.hashCode ^
        utcOffset.hashCode ^
        websiteUri.hashCode;
  }
}
