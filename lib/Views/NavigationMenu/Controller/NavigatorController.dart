import 'package:get/get.dart';
import 'package:shoes_app/Views/Home/Screens/Home.dart';
import 'package:shoes_app/Views/Profile/Profile.dart';
import 'package:shoes_app/Views/Store/Store.dart';
import 'package:shoes_app/Views/WishList/WishList.dart';

class NavigatorController extends GetxController {
  final Rx<int> selectedindex = 0.obs;

  final pages = [
    const HomeScreen(),
    const StoreView(),
    const WishListView(),
    const ProfileScreen()
  ];
}
