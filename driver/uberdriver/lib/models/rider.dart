import 'package:cloud_firestore/cloud_firestore.dart';

class RiderModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const PHONE = "phone";
  static const VOTES = "votes";
  static const TRIPS = "trips";
  static const RATING = "rating";
  static const TOKEN = "token";
  static const PHOTO = "photo";

  late String valueid;
  late String valuename;
  late String valueemail;
  late String valuephone;
  late String valuetoken;
  late String valuephoto;
  late int valuevotes;
  late int valuetrips;
  late double valuerating;
  RiderModel({
    required this.valueid,
    required this.valuename,
    required this.valueemail,
    required this.valuephone,
    required this.valuetoken,
    required this.valuephoto,
    required this.valuevotes,
    required this.valuetrips,
    required this.valuerating,
  });

//  getters
  String get name => valuename;
  String get email => valueemail;
  String get id => valueid;
  String get phone => valuephone;
  int get votes => valuevotes;
  int get trips => valuetrips;
  double get rating => valuerating;
  String get token => valuetoken;
  String get photo => valuephoto;

  RiderModel.fromSnapshot(DocumentSnapshot snapshot) {
    valuename = snapshot.get(FieldPath([NAME]));
    valueemail = snapshot.get(FieldPath([EMAIL]));
    valueid = snapshot.get(FieldPath([ID]));
    valuephone = snapshot.get(FieldPath([PHONE]));
    valuetoken = snapshot.get(FieldPath([TOKEN]));
    valuevotes = snapshot.get(FieldPath([VOTES]));
    valuetrips = snapshot.get(FieldPath([TRIPS]));
    valuerating = snapshot.get(FieldPath([RATING]));
    valuephoto = snapshot.get(FieldPath([PHOTO]));
  }
}
