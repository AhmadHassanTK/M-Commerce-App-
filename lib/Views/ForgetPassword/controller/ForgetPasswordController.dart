import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Backend/AuthenticationRepository.dart';
import 'package:shoes_app/Views/ForgetPassword/Screens/SuccessScreen.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/helpers/network_manager.dart';
import 'package:shoes_app/utils/loaders/FullScreenLoader.dart';
import 'package:shoes_app/utils/loaders/Loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetpasswordkey = GlobalKey<FormState>();

  Future<void> sendResetPasswordEmail() async {
    try {
      CFullScreenLoader.openLoadingDialog(
          'Logging you in...', CImages.dockeranimation);

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        CFullScreenLoader.stoploading();
        return;
      }

      if (!forgetpasswordkey.currentState!.validate()) {
        CFullScreenLoader.stoploading();
        return;
      }

      await AuthenticationRepository.instance.sendResetPasswordEmail(
        email: email.text.trim(),
      );

      CFullScreenLoader.stoploading();
      CLoaders.successSnackbar(
        title: 'Email Sent',
        message: 'Email Link sent to reset your password',
      );
      Get.to(() => ForgetPasswordSuccessScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      CFullScreenLoader.stoploading();
      CLoaders.errorSnackbar(title: 'Oh snap!', message: e.toString());
    }
  }

  Future<void> resendResetPasswordEmail(String email) async {
    try {
      CFullScreenLoader.openLoadingDialog(
          'Logging you in...', CImages.dockeranimation);

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        CFullScreenLoader.stoploading();
        return;
      }

      await AuthenticationRepository.instance.sendResetPasswordEmail(
        email: email,
      );

      CFullScreenLoader.stoploading();

      CLoaders.successSnackbar(
        title: 'Email Sent',
        message: 'Email Link sent to reset your password',
      );
    } catch (e) {
      CFullScreenLoader.stoploading();
      CLoaders.errorSnackbar(title: 'Oh snap!', message: e.toString());
    }
  }
}
