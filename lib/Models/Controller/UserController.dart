import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoes_app/Backend/AuthenticationRepository.dart';
import 'package:shoes_app/DataBase/UserCloud.dart';
import 'package:shoes_app/Models/Model/UserModel.dart';
import 'package:shoes_app/Views/Login/Screens/Login.dart';
import 'package:shoes_app/Views/REAuthLogin/ReAuthlogin.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/network_manager.dart';
import 'package:shoes_app/utils/loaders/FullScreenLoader.dart';
import 'package:shoes_app/utils/loaders/Loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final usercloud = UserCloud.instance;
  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  final reAuthemail = TextEditingController();
  final reAuthpassword = TextEditingController();
  final hidepassword = false.obs;
  final imageuploading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      profileLoading.value = true;

      final user = await usercloud.fetchUserData();

      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecordsfromGoogle(UserCredential? userCredential) async {
    try {
      await fetchUserData();
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final userparts = UserModel.nameParts(
            userCredential.user?.displayName ?? '',
          );
          final username = UserModel.generateUsername(
            userCredential.user?.displayName ?? '',
          );

          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: userparts[0],
            lastName:
                userparts.length > 1 ? userparts.sublist(1).join(' ') : ' ',
            username: username,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          await usercloud.saveUserRecords(user);
        }
      }
    } catch (e) {
      CLoaders.warningSnackbar(
        title: 'Data not saved',
        message:
            'Something went wrong while saving your information, You can re-save your information in your profile',
      );
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(CSizes.md),
      title: 'Delete Account',
      middleText:
          'Are your sure you want to delete your account permanently? This action is not reversible and all your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: CSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

  void deleteUserAccount() async {
    try {
      CFullScreenLoader.openLoadingDialog(
        'Processing',
        CImages.dockeranimation,
      );

      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authuser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteaccount();
          CFullScreenLoader.stoploading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          CFullScreenLoader.stoploading();
          Get.to(() => const ReAuthLoginScreen());
        }
      }
    } catch (e) {
      CFullScreenLoader.stoploading();

      CLoaders.warningSnackbar(
        title: 'Oh snap!',
        message: e.toString(),
      );
    }
  }

  Future<void> reAuthEmailandPassword() async {
    try {
      CFullScreenLoader.openLoadingDialog(
          'Processing...', CImages.dockeranimation);

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        CFullScreenLoader.stoploading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        CFullScreenLoader.stoploading();
        return;
      }

      CFullScreenLoader.stoploading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      CFullScreenLoader.stoploading();
      CLoaders.errorSnackbar(title: 'Oh snap!', message: e.toString());
    }
  }

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );

      if (image != null) {
        imageuploading.value = true;
        final imageurl =
            await usercloud.uploadImage('Users/Images/Profile/', image);

        Map<String, dynamic> json = {'ProfilePicture': imageurl};
        await usercloud.updateSingleField(json);

        user.value.profilePicture = imageurl;

        CLoaders.successSnackbar(
          title: 'Congratulations!',
          message: 'Your profile Image has been updated',
        );
      }
    } catch (e) {
      CLoaders.errorSnackbar(
        title: 'Oh snap!',
        message: 'Something went wrong $e',
      );
    } finally {
      imageuploading.value = false;
    }
  }
}
