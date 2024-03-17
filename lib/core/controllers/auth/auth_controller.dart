import 'package:cloud_firestore/cloud_firestore.dart';
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

  //for signup
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  //for login
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  //for forgot password
  final forgotPasswordEmailController = TextEditingController();

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

  Future<void> logIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final prefs = await SharedPreferences.getInstance();
      prefs
        ..setBool('isLoggedIn', true)
        ..setString('userId', FirebaseAuth.instance.currentUser!.uid);
      Get.offAll(() => const NavigationScreen());
    } on FirebaseAuthException catch (e) {
      final ex = e;
      // Get.snackbar("Error", ex.message ?? "Error");
      throw ex.message!;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      throw e as Exception;
    }
  }

  Future<void> signUp(String email, String password, String username) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // store user data in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'email': email,
        'username': username,
        'uid': FirebaseAuth.instance.currentUser!.uid,
        'address': '',
      }, SetOptions(merge: true));

      final prefs = await SharedPreferences.getInstance();
      prefs
        ..setBool('isLoggedIn', true)
        ..setString('userId', FirebaseAuth.instance.currentUser!.uid);
      Get.offAll(() => const NavigationScreen());
    } on FirebaseAuthException catch (e) {
      final ex = e;
      Get.snackbar("Error", ex.message ?? "Error");
      throw ex.message! as Exception;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      throw e as Exception;
    }
  }

  Future<void> googleSignIn() async {
    try {
      isGoogleLoading.value = true;
      await signInWithGoogle();
      isGoogleLoading.value = false;
      Get.offAll(() => const NavigationScreen());
    } catch (e) {
      isGoogleLoading.value = false;
      Get.snackbar("Error", e.toString());
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
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
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      // print(userCredential.user!.email);
      // print(userCredential.user!.displayName);
      // print(userCredential.user!.photoURL);
      // print(userCredential.user!.uid);

      // store user data in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'email': userCredential.user!.email,
        'username': userCredential.user!.displayName,
        'uid': userCredential.user!.uid,
        'address': '',
      }, SetOptions(merge: true));

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
      // Get.snackbar("Error", ex.message ?? "Error");
      throw ex.message! as Exception;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      throw e as Exception;
    }
  }

  Future<bool> forgotPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (err) {
      throw Exception(err.message.toString());

    } catch (err) {
      throw Exception(err.toString());
    }

  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.dispose();
  }
}
