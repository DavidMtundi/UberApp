import 'package:uberdriver/helpers/constants.dart';
import 'package:uberdriver/models/user.dart';

class UserServices {
  String collection = "drivers";

  void createUser(
      {required String id,
      required String name,
      required String email,
      required String phone,
      required String token,
      int votes = 0,
      int trips = 0,
      double rating = 0,
      Map? position}) {
    firebaseFiretore.collection(collection).doc(id).set({
      "name": name,
      "id": id,
      "phone": phone,
      "email": email,
      "votes": votes,
      "trips": trips,
      "rating": rating,
      "position": position,
      "car": "Toyota Corolla",
      "plate": "CBA 321 7",
      "token": token
    });
  }

  void updateUserData(Map<String, dynamic> values) {
    firebaseFiretore.collection(collection).doc(values['id']).update(values);
  }

  void addDeviceToken({required String token, required String userId}) {
    firebaseFiretore
        .collection(collection)
        .doc(userId)
        .update({"token": token});
  }

  Future<UserModel> getUserById(String id) =>
      firebaseFiretore.collection(collection).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });
}
