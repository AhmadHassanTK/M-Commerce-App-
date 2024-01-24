import 'package:get/get.dart';
import 'package:shoes_app/Views/Home/Screens/Home.dart';

class NavigatorController extends GetxController {
  final Rx<int> selectedindex = 0.obs;

  final pages = [const HomeScreen()];
}
