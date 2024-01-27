import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final Rx<int> currentpageIndex = 0.obs;

  void updatepageindex(index) {
    currentpageIndex.value = index;
  }
}
