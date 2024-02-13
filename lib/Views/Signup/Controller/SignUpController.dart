import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Backend/AuthenticationRepository.dart';
import 'package:shoes_app/DataBase/UserCloud.dart';
import 'package:shoes_app/Models/Model/UserModel.dart';
import 'package:shoes_app/Views/VerifyEmail/Screens/VerifyEmail.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/helpers/network_manager.dart';
import 'package:shoes_app/utils/loaders/FullScreenLoader.dart';
import 'package:shoes_app/utils/loaders/Loaders.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final phonenumber = TextEditingController();
  GlobalKey<FormState> signupformkey = GlobalKey<FormState>();
  final hidepassword = true.obs;
  final privacypolicy = false.obs;

  Future<void> signUp() async {
    try {
      CFullScreenLoader.openLoadingDialog(
        'We are processing your information',
        CImages.dockeranimation,
      );

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        return;
      }

      if (!signupformkey.currentState!.validate()) {
        return;
      }

      if (!privacypolicy.value) {
        CLoaders.warningSnackbar(
          title: 'Accept privacy Policy',
          message:
              'In order to create account, you must read and accept the Privacy Policy & Terms of Use',
        );
        return;
      }

      final userCredential =
          await AuthenticationRepository.instance.signupWithEmailandPassword(
        email: email.text,
        password: password.text,
      );

      final newUser = UserModel(
        id: userCredential.user!.uid,
        email: email.text.trim(),
        firstName: firstname.text.trim(),
        lastName: lastname.text.trim(),
        phoneNumber: phonenumber.text.trim(),
        username: username.text.trim(),
        profilePicture: '',
      );

      final userRepositery = Get.put(UserCloud());
      await userRepositery.saveUserRecords(newUser);

      CFullScreenLoader.stoploading();

      CLoaders.successSnackbar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify your email to continue',
      );

      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      CFullScreenLoader.stoploading();
      CLoaders.errorSnackbar(title: 'Oh snap!', message: e.toString());
    }
  }
}
