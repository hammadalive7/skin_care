import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxString username = ''.obs;
  RxString email = ''.obs;
  RxString address = ''.obs;
  RxString imageUrl = ''.obs;

  //fetch user data from Firestore
  Future<Map<String, dynamic>> fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    final userObj = userData.data();
    userObj!.forEach((key, value) {
      if (key == 'username') {
        username.value = value.toString();
      }
      if (key == 'email') {
        email.value = value.toString();
      }
      if (key == 'address') {
        address.value = value.toString();
      }
      if (key == 'imageUrl') {
        imageUrl.value = value.toString();
      }
    });

    return userObj;

  }
}
