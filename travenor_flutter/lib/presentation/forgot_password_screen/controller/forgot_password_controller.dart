import '../../../services/auth_service.dart';
import '/core/app_export.dart';
import 'package:travelappflutter/presentation/forgot_password_screen/models/forgot_password_model.dart';
import 'package:flutter/material.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();

  Rx<ForgotPasswordModel> forgotPasswordModelObj = ForgotPasswordModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }

  Future<String?> resetpassword(String email) async {
    try {
      var response = auth.sendPasswordReset(emailController.text);
      if (response != "") {
        Get.dialog(
          AlertDialog(
            title: Text('Envio a su correo'),
            content: Text("Se envio un link a su correo "),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                  Get.offNamed(AppRoutes.signInScreen);
                },
                child: Text('Aceptar'),
              ),
            ],
          ),
        );
      }
    } catch (e) {}
    return null;
  }
}
