import 'package:get/get.dart';
import 'package:shoes_app/Views/AddressPage/Address.dart';
import 'package:shoes_app/Views/Cart/Cart.dart';
import 'package:shoes_app/Views/Checkout/CheckOut.dart';
import 'package:shoes_app/Views/ForgetPassword/Screens/forgetPassword.dart';
import 'package:shoes_app/Views/Home/Screens/Home.dart';
import 'package:shoes_app/Views/Login/Screens/Login.dart';
import 'package:shoes_app/Views/OnBoarding/Screen/OnBoarding.dart';
import 'package:shoes_app/Views/Orders/Orders.dart';
import 'package:shoes_app/Views/ProductDetails/ProductDetails.dart';
import 'package:shoes_app/Views/Profile/Profile.dart';
import 'package:shoes_app/Views/Profile/widgets/UserProfile.dart';
import 'package:shoes_app/Views/Signup/Screens/Signup.dart';
import 'package:shoes_app/Views/Store/Store.dart';
import 'package:shoes_app/Views/VerifyEmail/Screens/VerifyEmail.dart';
import 'package:shoes_app/Views/WishList/WishList.dart';
import 'package:shoes_app/utils/shared/CRoutes.dart';

class CAppRoutes {
  static final pages = [
    GetPage(name: CRoutes.home, page: () => const HomeScreen()),
    GetPage(name: CRoutes.store, page: () => const StoreView()),
    GetPage(name: CRoutes.favourites, page: () => const WishListView()),
    GetPage(name: CRoutes.settings, page: () => const ProfileScreen()),
    //  GetPage(name: CRoutes.productReviews, page: () => const ProductDetails()),
    GetPage(name: CRoutes.order, page: () => const OrdersScreen()),
    GetPage(name: CRoutes.checkout, page: () => const CheckoutView()),
    GetPage(name: CRoutes.cart, page: () => const CartView()),
    GetPage(name: CRoutes.userProfile, page: () => const UserProfile()),
    GetPage(name: CRoutes.userAddress, page: () => const AddressView()),
    GetPage(name: CRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: CRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: CRoutes.signIn, page: () => const LoginScreen()),
    GetPage(
        name: CRoutes.forgetpassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: CRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
