import 'package:cloud_firestore/cloud_firestore.dart';

class RideRequestModel {
  static const ID = "id";
  static const USERNAME = "username";
  static const USER_ID = "userId";
  static const DRIVER_ID = "driverId";
  static const STATUS = "status";
  static const POSITION = "position";
  static const DESTINATION = "destination";

  late String _id;
  late String _username;
  late String _userId;
  late String _driverId;
  late String _status;
  late Map _position;
  late Map _destination;

  String get id => _id;
  String get username => _username;
  String get userId => _userId;
  String get driverId => _driverId;
  String get status => _status;
  Map get position => _position;
  Map get destination => _destination;

  RideRequestModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.get(FieldPath(const [ID]));
    _username = snapshot.get(FieldPath(const [USERNAME]));
    _userId = snapshot.get(FieldPath(const [USER_ID]));
    _driverId = snapshot.get(FieldPath(const [DRIVER_ID]));
    _status = snapshot.get(FieldPath(const [STATUS]));
    _position = snapshot.get(FieldPath(const [POSITION]));
    _destination = snapshot.get(FieldPath(const [DESTINATION]));
  }
}
