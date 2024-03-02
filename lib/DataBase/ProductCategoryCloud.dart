import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Models/Model/ProductCategoryModel.dart';
import 'package:shoes_app/utils/exceptions/firebase_exceptions.dart';
import 'package:shoes_app/utils/exceptions/format_exceptions.dart';
import 'package:shoes_app/utils/exceptions/platform_exceptions.dart';
import 'package:shoes_app/utils/loaders/Loaders.dart';

class ProductCategoryCloud extends GetxController {
  static ProductCategoryCloud get instance => Get.find();

  final db = FirebaseFirestore.instance;

  Future<void> uploadDummyData(
      List<ProductCategoryModel> productcategories) async {
    try {
      for (var productcategory in productcategories) {
        await db
            .collection('ProductCategory')
            .doc()
            .set(productcategory.toJson());
      }

      CLoaders.successSnackbar(title: 'Data Uploaded');
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
