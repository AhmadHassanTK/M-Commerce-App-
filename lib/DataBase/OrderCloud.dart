import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Backend/AuthenticationRepository.dart';
import 'package:shoes_app/Models/Model/OrderModel.dart';

class OrderCloud extends GetxController {
  static OrderCloud get instance => Get.find();

  final db = FirebaseFirestore.instance;

  Future<List<OrderModel>> fetchUserOrder() async {
    try {
      final userid = AuthenticationRepository.instance.authuser!.uid;
      if (userid.isEmpty) {
        throw 'unable to find user information. Try again in few minutes.';
      }

      final result =
          await db.collection('Users').doc(userid).collection('Orders').get();

      print(result.docs);
      print(result.docs.map((e) => OrderModel.fromSnapshot(e)).toList());
      return result.docs.map((e) => OrderModel.fromSnapshot(e)).toList();
    } catch (e) {
      throw 'Something went wrong while fetching order information. Try again later';
    }
  }

  Future<void> saveOrder(OrderModel order, String userid) async {
    try {
      await db
          .collection('Users')
          .doc(userid)
          .collection('Orders')
          .add(order.toJson());
    } catch (e) {
      throw 'Something went wrong while saving your order information. Try again later';
    }
  }
}
