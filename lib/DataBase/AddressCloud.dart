import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Backend/AuthenticationRepository.dart';
import 'package:shoes_app/Models/Model/AddressModel.dart';

class AddressCloud extends GetxController {
  static AddressCloud get instance => Get.find();

  final db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddresses() async {
    try {
      final userId = AuthenticationRepository.instance.authuser!.uid;
      if (userId.isEmpty) {
        throw 'Unable to find user information. Try again in few minutes.';
      }
      final snapshot = await db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .get();
      final result = snapshot.docs
          .map((address) => AddressModel.fromSnapshot(address))
          .toList();

      return result;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<void> updateSelectField(String addressId, bool selected) async {
    try {
      final userId = AuthenticationRepository.instance.authuser!.uid;
      await db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .doc(addressId)
          .update({'SelectedAddress': selected});
    } catch (e) {
      throw 'Unable to update your address selection, Please try again later.';
    }
  }

  Future<String> addAddress(AddressModel address) async {
    try {
      final userId = AuthenticationRepository.instance.authuser!.uid;
      final currentaddress = await db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .add(address.toJson());

      return currentaddress.id;
    } catch (e) {
      throw 'Something went wrong while saving Address Information, Please try again later.';
    }
  }
}
