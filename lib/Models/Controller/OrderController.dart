import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Backend/AuthenticationRepository.dart';
import 'package:shoes_app/DataBase/OrderCloud.dart';
import 'package:shoes_app/Models/Controller/AddressController.dart';
import 'package:shoes_app/Models/Controller/CartController.dart';
import 'package:shoes_app/Models/Model/OrderModel.dart';
import 'package:shoes_app/Views/Checkout/Controller/CheckoutController.dart';
import 'package:shoes_app/Views/NavigationMenu/Screens/NavigationMenu.dart';
import 'package:shoes_app/utils/constants/enums.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/loaders/FullScreenLoader.dart';
import 'package:shoes_app/utils/loaders/Loaders.dart';
import 'package:shoes_app/utils/shared/CSuccessScreen.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartC = CartController.instance;
  final addressC = AddressController.instance;
  final checkoutC = CheckOutController.instance;
  final orderdb = Get.put(OrderCloud());

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userorders = await orderdb.fetchUserOrder();
      return userorders;
    } catch (e) {
      CLoaders.warningSnackbar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  void processOrder(double totalAmount) async {
    try {
      CFullScreenLoader.openLoadingDialog(
          'Processing your order.', CImages.pensilanimation);

      final userid = AuthenticationRepository.instance.authuser!.uid;
      if (userid.isEmpty) return;

      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userid,
        items: cartC.cartItems.toList(),
        status: OrderStatus.pending,
        address: addressC.selectedAddress.value,
        paymentMethod: checkoutC.selectedPaymentMethod.value.name,
        totalAmount: totalAmount,
        orderdate: DateTime.now(),
        deliveryDate: DateTime.now(),
      );

      await orderdb.saveOrder(order, userid);

      cartC.clearCart();

      Get.off(
        () => SuccessScreen(
          image: CImages.ordercompletedanimation,
          subTitle: 'Your item will be shipped soon!',
          title: 'Payment Success!',
          onPressed: () => Get.offAll(() => const NavigationMenu()),
        ),
      );
    } catch (e) {
      CLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
