import 'package:get/get.dart';
import 'package:shoes_app/Views/Signup/Controller/SignUpController.dart';
import 'package:shoes_app/utils/helpers/network_manager.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(SignUpController());
  }
}
