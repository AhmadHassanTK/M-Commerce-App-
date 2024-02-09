import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Models/UserModel.dart';
import 'package:shoes_app/utils/exceptions/firebase_exceptions.dart';
import 'package:shoes_app/utils/exceptions/format_exceptions.dart';
import 'package:shoes_app/utils/exceptions/platform_exceptions.dart';

class UserRepositery extends GetxController {
  static UserRepositery get instance => Get.find();

  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> saveUserRecords(UserModel user) async {
    try {
      await db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw CFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CFormatException();
    } on PlatformException catch (e) {
      throw CPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
}
