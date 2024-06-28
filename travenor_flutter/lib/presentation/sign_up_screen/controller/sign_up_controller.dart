import '../../../services/auth_service.dart';
import '/core/app_export.dart';
import 'package:travelappflutter/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:flutter/material.dart';

class SignUpController extends GetxController {
  TextEditingController groupFiftyOneController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController nombrecontroller = TextEditingController();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    groupFiftyOneController.dispose();
    emailController.dispose();
    passwordcontroller.dispose();
    nombrecontroller.dispose();
  }

  void signIp() {
    Get.offNamed(AppRoutes.signInScreen);
  }

  Future<String?> signUpUser(String email, String pass) async {
    try {
      var response = await auth.signUp(email: email, password: pass);
      if (response != null) {
        auth.postDetailsToFirestore(nombrecontroller.text);
        Get.offNamed(AppRoutes.signInScreen);
      }
    } catch (e) {}
    return null;
  }
}
