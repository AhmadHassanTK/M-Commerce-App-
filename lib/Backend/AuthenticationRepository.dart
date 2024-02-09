import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoes_app/Views/Login/Screens/Login.dart';
import 'package:shoes_app/Views/NavigationMenu/Screens/NavigationMenu.dart';
import 'package:shoes_app/Views/OnBoarding/Screen/OnBoarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoes_app/Views/VerifyEmail/Screens/VerifyEmail.dart';
import 'package:shoes_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:shoes_app/utils/exceptions/firebase_exceptions.dart';
import 'package:shoes_app/utils/exceptions/format_exceptions.dart';
import 'package:shoes_app/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    if (auth.currentUser != null) {
      if (auth.currentUser!.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: auth.currentUser!.email));
      }
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.to(() => const OnBoardingScreen());
    }
  }

  Future<UserCredential> signupWithEmailandPassword(
      {required String email, required String password}) async {
    try {
      return await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw CFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CFormatException();
    } on PlatformException catch (e) {
      throw CPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<void> sendEmailVerfication() async {
    try {
      await auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw CFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CFormatException();
    } on PlatformException catch (e) {
      throw CPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw CFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CFormatException();
    } on PlatformException catch (e) {
      throw CPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
}
