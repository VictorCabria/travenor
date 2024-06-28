import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/sign_up_screen/models/sign_up_model.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  AuthService(this._firebaseAuth);

  ///signIn
  Future<dynamic> signIn(
      {required String email, required String password}) async {
    String errorMessage = '';
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
    }
    return errorMessage;
  }

  ///signUp can be UserCredential or error string code
  Future<dynamic> signUp(
      {required String email, required String password}) async {
    String errorMessage = '';

    try {
      // Returns an UserCredential
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = translateFirebaseError(e.code);
      showErrorDialog(errorMessage);
    } catch (e) {
      showErrorDialog('Se produjo un error. Inténtalo de nuevo.');
    }
  }

  void showErrorDialog(String message) {
    Get.dialog(
      AlertDialog(
        title: Text('Error del registro'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  String translateFirebaseError(String errorCode) {
    switch (errorCode) {
      case 'weak-password':
        return 'Password is too weak.';
      case 'email-already-in-use':
        return 'El correo electrónico ya está en uso por otra cuenta.';
      case 'invalid-email':
        return 'El correo electrónico no es válido.';

      case 'too-many-requests':
        return 'Demasiados intentos. Por favor, inténtalo de nuevo más tarde.';

      default:
        return 'Se produjo un error. Inténtalo de nuevo.';
    }
  }

  postDetailsToFirestore(String nombre) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? user = FirebaseAuth.instance.currentUser;

    Usuarios userModel = Usuarios();

    userModel.correo = user!.email;

    userModel.id = user.uid;

    userModel.nombre = nombre;

    await firebaseFirestore
        .collection("usuarios")
        .doc(user.uid)
        .set(userModel.toJson());
  }

  ///sendPasswordReset
  Future<String> sendPasswordReset(String email) async {
    String errorMessage = "";
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
    }
    return errorMessage;
  }

  ///Change password
  Future<String> changePassword(
    String currentPassword,
    String email,
    String newPassword,
  ) async {
    try {
      var signInStatus = await signIn(email: email, password: currentPassword);
      if (signInStatus.isEmpty) {
        var user = _firebaseAuth.currentUser;

        await user!.updatePassword(newPassword);

        return "success";
      } else {
        return "error";
      }
    } catch (err) {
      debugPrint(err.toString());
      return "error";
    }
  }

  ///SignOut
  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  ///Get Currentuser
  User? getCurrentUser() {
    try {
      return _firebaseAuth.currentUser;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // Future<lizitUser.User?> getCurrentUserHome() async {
  //   try {
  //     return (await userService.getCurrentUser())!;
  //   } on FirebaseAuthException catch (e) {
  //     debugPrint(e.toString());
  //   }
  //   return null;
  // }
}

final AuthService auth = AuthService(FirebaseAuth.instance);
