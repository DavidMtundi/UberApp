import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uberdriver/models/route.dart';

class RideRequestModel {
  static const ID = "id";
  static const USERNAME = "username";
  static const USERvalueID = "userId";
  static const DESTINATION = "destination";
  static const DESTINATIONvalueLAT = "destinationvaluelatitude";
  static const DESTINATIONvalueLNG = "destinationvaluelongitude";
  static const USERvalueLAT = "uservaluelatitude";
  static const USERvalueLNG = "uservaluelongitude";
  static const DISTANCEvalueTEXT = "distancevaluetext";
  static const DISTANCEvalueVALUE = "distancevaluevalue";

  late String valueid;
  late String valueusername;
  late String valueuserId;
  late String valuedestination;
  late double valuedLatitude;
  late double valuedLongitude;
  late double valueuLatitude;
  late double valueuLongitude;
  late Distance valuedistance;
  RideRequestModel({
    required this.valueid,
    required this.valueusername,
    required this.valueuserId,
    required this.valuedestination,
    required this.valuedLatitude,
    required this.valuedLongitude,
    required this.valueuLatitude,
    required this.valueuLongitude,
    //this.valuedistance =Distance(text: "text", value: 0),
  });

  String get id => valueid;

  String get username => valueusername;

  String get userId => valueuserId;

  String get destination => valuedestination;

  double get dLatitude => valuedLatitude;

  double get dLongitude => valuedLongitude;

  double get uLatitude => valueuLatitude;

  double get uLongitude => valueuLongitude;

  Distance get distance => valuedistance;

  RideRequestModel.fromMap(Map data) {
    String valued = data[DESTINATION];
    valueid = data[ID];
    valueusername = data[USERNAME];
    valueuserId = data[USERvalueID];
    valuedestination = valued.substring(0, valued.indexOf(','));
    valuedLatitude = double.parse(data[DESTINATIONvalueLAT]);
    valuedLongitude = double.parse(data[DESTINATIONvalueLNG]);
    valueuLatitude = double.parse(data[USERvalueLAT]);
    valueuLongitude = double.parse(data[USERvalueLAT]);
    valuedistance = Distance.fromMap({
      "text": data[DISTANCEvalueTEXT],
      "value": int.parse(data[DISTANCEvalueVALUE])
    });
  }

  @override
  String toString() {
    return 'RideRequestModel(valueid: $valueid, valueusername: $valueusername, valueuserId: $valueuserId, valuedestination: $valuedestination, valuedLatitude: $valuedLatitude, valuedLongitude: $valuedLongitude, valueuLatitude: $valueuLatitude, valueuLongitude: $valueuLongitude, valuedistance: $valuedistance)';
  }
}

class Distance {
  late String text;
  late int value;
  Distance({
    required this.text,
    required this.value,
  });

  Distance.fromMap(Map data) {
    text = data["text"];
    value = data["value"];
  }

  Map toJson() => {"text": text, "value": value};
}

class RequestModelFirebase {
  static const ID = "id";
  static const USERNAME = "username";
  static const USERvalueID = "userId";
  static const DRIVERvalueID = "driverId";
  static const STATUS = "status";
  static const POSITION = "position";
  static const DESTINATION = "destination";

  late String valueid;
  late String valueusername;
  late String valueuserId;
  late String valuedriverId;
  late String valuestatus;
  late Map valueposition;
  late Map valuedestination;
  RequestModelFirebase({
    required this.valueid,
    required this.valueusername,
    required this.valueuserId,
    required this.valuedriverId,
    required this.valuestatus,
  });

  String get id => valueid;
  String get username => valueusername;
  String get userId => valueuserId;
  String get driverId => valuedriverId;
  String get status => valuestatus;
  Map get position => valueposition;
  Map get destination => valuedestination;

  RequestModelFirebase.fromSnapshot(DocumentSnapshot snapshot) {
    valueid = snapshot.get(FieldPath([ID]));
    valueusername = snapshot.get(FieldPath([USERNAME]));
    valueuserId = snapshot.get(FieldPath([USERvalueID]));
    valuedriverId = snapshot.get(FieldPath([DRIVERvalueID]));
    valuestatus = snapshot.get(FieldPath([STATUS]));
    valueposition = snapshot.get(FieldPath([POSITION]));
    valuedestination = snapshot.get(FieldPath([DESTINATION]));
  }

  LatLng getCoordinates() =>
      LatLng(valueposition['latitude'], valueposition['longitude']);
}
