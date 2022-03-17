import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverModel {
  static const ID = "id";
  static const NAME = "name";
  static const LATITUDE = "latitude";
  static const LONGITUDE = "longitude";
  static const HEADING = "heading";
  static const POSITION = "position";
  static const CAR = "car";
  static const PLATE = "plate";
  static const PHOTO = "photo";
  static const RATING = "rating";
  static const VOTES = "votes";
  static const PHONE = "phone";

  late String _id;
  late String _name;
  late String _car;
  late String _plate;
  late String _photo;
  late String _phone;

  late double _rating;
  late int _votes;

  late DriverPosition _position;

  String get id => _id;

  String get name => _name;

  String get car => _car;

  String get plate => _plate;

  String get photo => _photo;

  String get phone => _phone;

  DriverPosition get position => _position;

  double get rating => _rating;

  int get votes => _votes;

  DriverModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.get(FieldPath(const [NAME]));
    _id = snapshot.get(FieldPath(const [ID]));
    _car = snapshot.get(FieldPath(const [CAR]));
    _plate = snapshot.get(FieldPath(const [PLATE]));
    _photo = snapshot.get(FieldPath(const [PHOTO]));
    _phone = snapshot.get(FieldPath(const [PHONE]));
    _rating = snapshot.get(FieldPath(const [RATING]));
    _votes = snapshot.get(FieldPath(const [VOTES]));
    _position = DriverPosition(
        lat: snapshot.get(FieldPath(const [POSITION, LATITUDE])),
        lng: snapshot.get(FieldPath(const [POSITION, LONGITUDE])),
        heading: snapshot.get(FieldPath(const [POSITION, HEADING])));
  }

  LatLng getPosition() {
    return LatLng(_position.lat, _position.lng);
  }
}

class DriverPosition {
  final double lat;
  final double lng;
  final double heading;

  DriverPosition({required this.lat, required this.lng, required this.heading});
}
