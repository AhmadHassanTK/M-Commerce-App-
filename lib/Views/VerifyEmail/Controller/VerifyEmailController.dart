import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Backend/AuthenticationRepository.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/text_strings.dart';
import 'package:shoes_app/utils/loaders/Loaders.dart';
import 'package:shoes_app/utils/shared/CSuccessScreen.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerforAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerfication();
      CLoaders.successSnackbar(
        title: 'Email Sent',
        message: 'Please Check your inbox and verify your email',
      );
    } catch (e) {
      CLoaders.errorSnackbar(title: 'Oh snap!', message: e.toString());
    }
  }

  setTimerforAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser!.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccessScreen(
              image: CImages.successRegister,
              subTitle: CTexts.changeYourPasswordSubTitle,
              title: CTexts.yourAccountCreatedTitle,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ),
          );
        }
      },
    );
  }

  checkEmailVerificationStatue() {
    final currentuser = FirebaseAuth.instance.currentUser;
    if (currentuser != null && currentuser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: CImages.successRegister,
          subTitle: CTexts.changeYourPasswordSubTitle,
          title: CTexts.yourAccountCreatedTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
