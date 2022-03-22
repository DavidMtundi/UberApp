import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const PHONE = "phone";
  static const VOTES = "votes";
  static const TRIPS = "trips";
  static const RATING = "rating";
  static const TOKEN = "token";

  late String idvalue;
  late String namevalue;
  late String emailvalue;
  late String phonevalue;
  late String tokenvalue;
  late int votesvalue;
  late int tripsvalue;
  late double ratingsvalue;
  UserModel({
    required this.idvalue,
    required this.namevalue,
    required this.emailvalue,
    required this.phonevalue,
    required this.tokenvalue,
    required this.votesvalue,
    required this.tripsvalue,
    required this.ratingsvalue,
  });

//  getters
  String get name => namevalue;
  String get email => emailvalue;
  String get id => idvalue;
  String get token => tokenvalue;

  String get phone => phonevalue;
  int get votes => votesvalue;
  int get trips => tripsvalue;
  double get rating => ratingsvalue;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    namevalue = snapshot.get(FieldPath([NAME])) ?? "00";
    emailvalue = snapshot.get(FieldPath([EMAIL])) ?? "0";
    idvalue = snapshot.get(FieldPath([ID])) ?? "0";
    tokenvalue = snapshot.get(FieldPath([TOKEN])) ?? "0";
    phonevalue = snapshot.get(FieldPath([PHONE])) ?? "0";
    votesvalue = snapshot.get(FieldPath([VOTES])) ?? 0;
    tripsvalue = snapshot.get(FieldPath([TRIPS])) ?? 0;
    ratingsvalue = snapshot.get(FieldPath([RATING])) ?? 0;
  }
}
