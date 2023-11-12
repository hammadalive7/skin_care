

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:skin_care/ui/views/navigation/navigation_screen.dart';

class AuthController extends GetxController {
  RxString resetPassword = "".obs;
  RxString confirmResetPassword = "".obs;
  RxBool loginRememberMe = false.obs;
  final isGoogleLoading = false.obs;

  // final user = FirebaseAuth.instance.currentUser;

  final formKey = GlobalKey<FormState>();

  void changePassword(String password) {
    resetPassword.value = password;
  }

  void changeConfirmPassword(String password) {
    confirmResetPassword.value = password;
  }

  bool validateResetPassword() {
    return resetPassword.value == confirmResetPassword.value;
  }

  void setLoginRememberMe(bool val) {
    loginRememberMe.value = val;
  }

  void reset() {
    resetPassword.value = "";
    confirmResetPassword.value = "";
  }

  Future<void> googleSignIn() async {
    try{
      isGoogleLoading .value = true;
      await signInWithGoogle();
      isGoogleLoading .value = false;
      Get.offAll(()=> const NavigationScreen());
    }catch (e){
      isGoogleLoading .value = false;
      Get.snackbar("Error",  e.toString());

    }
  }


  Future<UserCredential> signInWithGoogle() async {

    try{
      // Trigger the authentication flow
      final googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Once signed in, return the UserCredential
      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      print(userCredential.user!.email);
      print(userCredential.user!.displayName);
      print(userCredential.user!.photoURL);
      print(userCredential.user!.uid);

      final prefs = await SharedPreferences.getInstance();

      if (userCredential.user != null) {

        // User is logged in
        prefs.setBool('isLoggedIn', true);
        prefs.setString('userId', userCredential.user!.uid);
      } else {
        // User is not logged in
        prefs.setBool('isLoggedIn', false);
        prefs.remove('userId');
      }
      
      return userCredential;

    } on FirebaseException catch (e) {
      final ex = e as FirebaseAuthException;
      Get.snackbar("Error", ex.message ?? "Error");
      throw ex.message! as Exception;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      throw e as Exception;
    }

  }
}
