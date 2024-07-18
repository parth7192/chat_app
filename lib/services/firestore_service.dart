import 'package:chat_app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_service.dart';

class FireStoreService {
  FireStoreService._() {
    getUser();
  }
  static final FireStoreService instance = FireStoreService._();

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  String collectionPath = "Todo";
  String userCollection = "allUsers";

  late UserModel currentUser;

  Future<void> addUser({required User user}) async {
    Map<String, dynamic> data = {
      'uid': user.uid,
      'displayName': user.displayName ?? "DEMO USER",
      'email': user.email ?? "demo_mail",
      'phoneNumber': user.phoneNumber ?? "NO DATA",
      'photoURL': user.photoURL ??
          "https://static.vecteezy.com/system/resources/previews/002/318/271/non_2x/user-profile-icon-free-vector.jpg",
    };

    await fireStore.collection(userCollection).doc(user.uid).set(data);
  }

  Future<void> getUser() async {
    DocumentSnapshot snapshot = await fireStore
        .collection(userCollection)
        .doc(AuthService.instance.auth.currentUser!.uid)
        .get();

    currentUser = UserModel.froMap(snapshot.data() as Map);
  }
}
