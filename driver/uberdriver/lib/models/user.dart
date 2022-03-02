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
  static const PHOTO = "photo";

  late String idvalue;
  late String namevalue;
  late String emailvalue;
  late String phonevalue;
  late String tokenvalue;
  late String photovalue;
  late int votesvalue;
  late int tripsvalue;
  late double ratingvalue;
  UserModel({
    required this.idvalue,
    required this.namevalue,
    required this.emailvalue,
    required this.phonevalue,
    required this.tokenvalue,
    required this.photovalue,
    required this.votesvalue,
    required this.tripsvalue,
    required this.ratingvalue,
  });

//  getters
  String get name => namevalue;
  String get email => emailvalue;
  String get id => idvalue;
  String get phone => phonevalue;
  int get votes => votesvalue;
  int get trips => tripsvalue;
  double get rating => ratingvalue;
  String get token => tokenvalue;
  String get photo => photovalue;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    namevalue = snapshot.get(FieldPath([NAME]));
    emailvalue = snapshot.get(FieldPath([EMAIL]));
    idvalue = snapshot.get(FieldPath([ID]));
    phonevalue = snapshot.get(FieldPath([PHONE]));
    tokenvalue = snapshot.get(FieldPath([TOKEN]));
    photovalue = snapshot.get(FieldPath([TOKEN]));
    votesvalue = snapshot.get(FieldPath([VOTES]));
    tripsvalue = snapshot.get(FieldPath([TRIPS]));
    ratingvalue = snapshot.get(FieldPath([RATING]));
  }
}
