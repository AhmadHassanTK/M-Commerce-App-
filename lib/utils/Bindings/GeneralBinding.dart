import 'package:get/get.dart';
import 'package:shoes_app/DataBase/UserCloud.dart';
import 'package:shoes_app/Models/Controller/UserController.dart';
import 'package:shoes_app/Views/ForgetPassword/controller/ForgetPasswordController.dart';
import 'package:shoes_app/Views/Login/Controller/LoginController.dart';
import 'package:shoes_app/Views/Signup/Controller/SignUpController.dart';
import 'package:shoes_app/utils/helpers/network_manager.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserCloud());
    Get.put(NetworkManager());
    Get.put(SignUpController());
    Get.put(UserController());
    Get.put(LoginController());
    Get.put(ForgetPasswordController());
  }
}
