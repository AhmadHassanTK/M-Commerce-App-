import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoes_app/DataBase/UserCloud.dart';
import 'package:shoes_app/Views/Login/Screens/Login.dart';
import 'package:shoes_app/Views/NavigationMenu/Screens/NavigationMenu.dart';
import 'package:shoes_app/Views/OnBoarding/Screen/OnBoarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoes_app/Views/VerifyEmail/Screens/VerifyEmail.dart';
import 'package:shoes_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:shoes_app/utils/exceptions/firebase_exceptions.dart';
import 'package:shoes_app/utils/exceptions/format_exceptions.dart';
import 'package:shoes_app/utils/exceptions/platform_exceptions.dart';
import 'package:shoes_app/utils/local_storage/storage_utility.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final auth = FirebaseAuth.instance;

  User? get authuser => auth.currentUser;

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
        await CLocalStorage.init(auth.currentUser!.uid);
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

  Future<UserCredential> signInWithEmailandPassword(
      {required String email, required String password}) async {
    try {
      return await auth.signInWithEmailAndPassword(
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

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await account?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      return await auth.signInWithCredential(credential);
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

  Future<void> sendResetPasswordEmail({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
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

  Future<void> deleteaccount() async {
    try {
      await UserCloud.instance.deleteUserData(auth.currentUser!.uid);
      await auth.currentUser!.delete();
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

  Future<void> reAuthEmailandPassword(String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await auth.currentUser!.reauthenticateWithCredential(credential);
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
