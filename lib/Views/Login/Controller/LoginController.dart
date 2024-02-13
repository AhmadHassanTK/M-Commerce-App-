import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoes_app/Backend/AuthenticationRepository.dart';
import 'package:shoes_app/Models/Controller/UserController.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/helpers/network_manager.dart';
import 'package:shoes_app/utils/loaders/FullScreenLoader.dart';
import 'package:shoes_app/utils/loaders/Loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginformkey = GlobalKey<FormState>();
  final localstorage = GetStorage();
  final rememberme = false.obs;
  final hidepassword = false.obs;
  final usercontroller = UserController.instance;

  @override
  void onInit() {
    email.text = localstorage.read('RememberMe_Email') ?? '';
    password.text = localstorage.read('RememberMe_Password') ?? '';
    super.onInit();
  }

  Future<void> emailandPasswordSignIn() async {
    try {
      CFullScreenLoader.openLoadingDialog(
          'Logging you in...', CImages.dockeranimation);

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        CFullScreenLoader.stoploading();
        return;
      }

      if (!loginformkey.currentState!.validate()) {
        CFullScreenLoader.stoploading();
        return;
      }

      if (rememberme.value) {
        localstorage.write('RememberMe_Email', email.text.trim());
        localstorage.write('RememberMe_Password', password.text.trim());
      }

      await AuthenticationRepository.instance.signInWithEmailandPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      CFullScreenLoader.stoploading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      CFullScreenLoader.stoploading();
      CLoaders.errorSnackbar(title: 'Oh snap!', message: e.toString());
    }
  }

  Future<void> GoogleSignIn() async {
    try {
      CFullScreenLoader.openLoadingDialog(
          'Logging you in...', CImages.dockeranimation);

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        CFullScreenLoader.stoploading();
        return;
      }

      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();

      await usercontroller.saveUserRecordsfromGoogle(userCredential);

      CFullScreenLoader.stoploading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      CFullScreenLoader.stoploading();
      CLoaders.errorSnackbar(title: 'Oh snap!', message: e.toString());
    }
  }
}
