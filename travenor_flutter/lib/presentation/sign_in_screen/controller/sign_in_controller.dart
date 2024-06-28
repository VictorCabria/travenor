import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';


import '/core/app_export.dart';
import 'package:travelappflutter/presentation/sign_in_screen/models/sign_in_model.dart';
import 'package:flutter/material.dart';

class SignInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  Rx<SignInModel> signInModelObj = SignInModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordcontroller.dispose();
  }

  Future<String?> authUser(String email, String pass) async {
    try {
      var response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass)
          .then((uid) => Get.offNamed(AppRoutes.homeScreen));

      print(response);
    } on FirebaseAuthException catch (e) {
      String errorMessage = translateFirebaseError(e.code);
      showErrorDialog(errorMessage);
    } catch (e) {
      showErrorDialog('Se produjo un error. Inténtalo de nuevo.');
    }
    return null;
  }

  String translateFirebaseError(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return 'No se encontró un usuario con ese correo electrónico.';
      case 'wrong-password':
        return 'Contraseña incorrecta proporcionada para ese usuario.';
      case 'email-already-in-use':
        return 'El correo electrónico ya está en uso por otra cuenta.';
      case 'invalid-email':
        return 'El correo electrónico no es válido.';
      case 'user-disabled':
        return 'El usuario con este correo electrónico ha sido deshabilitado.';
      case 'too-many-requests':
        return 'Demasiados intentos. Por favor, inténtalo de nuevo más tarde.';
      case 'operation-not-allowed':
        return 'El inicio de sesión con contraseña está deshabilitado.';
      default:
        return 'Se produjo un error. Inténtalo de nuevo.';
    }
  }

  void showErrorDialog(String message) {
    Get.dialog(
      AlertDialog(
        title: Text('Error de Autenticación'),
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
}
