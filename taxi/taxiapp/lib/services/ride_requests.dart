import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxiapp/helpers/constants.dart';

class RideRequestServices {
  String collection = "requests";

  void createRideRequest({
    required String id,
    required String userId,
    required String username,
    required Map<String, dynamic> destination,
    required Map<String, dynamic> position,
    required Map distance,
  }) {
    firebaseFiretore.collection(collection).doc(id).set({
      "username": username,
      "id": id,
      "userId": userId,
      "driverId": "",
      "position": position,
      "status": 'pending',
      "destination": destination,
      "distance": distance
    });
  }

  void updateRequest(Map<String, dynamic> values) {
    firebaseFiretore.collection(collection).doc(values['id']).update(values);
  }

  Stream<QuerySnapshot> requestStream() {
    CollectionReference reference =
        FirebaseFirestore.instance.collection(collection);
    return reference.snapshots();
  }
}
