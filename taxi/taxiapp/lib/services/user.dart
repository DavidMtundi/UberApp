import 'package:taxiapp/helpers/constants.dart';
import 'package:taxiapp/models/user.dart';

class UserServices {
  String collection = "users";

  Future createUser(
      {required String id,
      required String name,
      required String email,
      required String phone,
      int votes = 0,
      int trips = 0,
      String token = "0",
      double rating = 0,
      required Map position}) async {
    await firebaseFiretore.collection(collection).doc(id).set({
      "name": name,
      "id": id,
      "phone": phone,
      "email": email,
      "votes": votes,
      "trips": trips,
      "rating": rating,
      "token": token,
      "position": position
    });
  }

  void updateUserData(Map<String, dynamic> values) {
    firebaseFiretore.collection(collection).doc(values['id']).update(values);
  }

  Future<UserModel> getUserById(String id) =>
      firebaseFiretore.collection(collection).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });

  void addDeviceToken({required String token, required String userId}) {
    firebaseFiretore
        .collection(collection)
        .doc(userId)
        .update({"token": token});
  }
}
