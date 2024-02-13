import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/DataBase/UserCloud.dart';
import 'package:shoes_app/Models/Controller/UserController.dart';
import 'package:shoes_app/Views/NavigationMenu/Screens/NavigationMenu.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/helpers/network_manager.dart';
import 'package:shoes_app/utils/loaders/FullScreenLoader.dart';
import 'package:shoes_app/utils/loaders/Loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  GlobalKey<FormState> updatenamekey = GlobalKey<FormState>();
  GlobalKey<FormState> updateUsernamekey = GlobalKey<FormState>();
  final usercontroller = UserController.instance;
  final usercloud = UserCloud.instance;

  @override
  void onInit() {
    super.onInit();
    initializeNames();
  }

  Future<void> initializeNames() async {
    firstname.text = usercontroller.user.value.firstName;
    lastname.text = usercontroller.user.value.lastName;
    username.text = usercontroller.user.value.username;
  }

  Future<void> updateUserName() async {
    try {
      CFullScreenLoader.openLoadingDialog(
          'We are updating your information...', CImages.dockeranimation);

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        CFullScreenLoader.stoploading();
        return;
      }

      if (!updatenamekey.currentState!.validate()) {
        CFullScreenLoader.stoploading();
        return;
      }

      Map<String, dynamic> name = {
        'FirstName': firstname.text.trim(),
        'LastName': lastname.text.trim(),
      };

      await usercloud.updateSingleField(name);

      usercontroller.user.value.firstName = firstname.text.trim();
      usercontroller.user.value.lastName = lastname.text.trim();

      CFullScreenLoader.stoploading();

      CLoaders.successSnackbar(
        title: 'Congratulations',
        message: 'Your Name has been updated',
      );

      Get.off(() => const NavigationMenu());
    } catch (e) {
      CFullScreenLoader.stoploading();
      CLoaders.errorSnackbar(title: 'Oh snap!', message: e.toString());
    }
  }

  Future<void> updateUserusername() async {
    try {
      CFullScreenLoader.openLoadingDialog(
          'We are updating your information...', CImages.dockeranimation);

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        CFullScreenLoader.stoploading();
        return;
      }

      if (!updateUsernamekey.currentState!.validate()) {
        CFullScreenLoader.stoploading();
        return;
      }

      Map<String, dynamic> usernamee = {
        'Username': username.text.trim(),
      };

      await usercloud.updateSingleField(usernamee);

      usercontroller.user.value.username = username.text.trim();

      CFullScreenLoader.stoploading();

      CLoaders.successSnackbar(
        title: 'Congratulations',
        message: 'Your username has been updated',
      );

      Get.off(() => const NavigationMenu());
    } catch (e) {
      CFullScreenLoader.stoploading();
      CLoaders.errorSnackbar(title: 'Oh snap!', message: e.toString());
    }
  }
}
