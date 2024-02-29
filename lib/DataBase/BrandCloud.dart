import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Backend/FirebaseStorageServices.dart';
import 'package:shoes_app/Models/Model/BrandModel.dart';
import 'package:shoes_app/Models/Model/ProductModel.dart';
import 'package:shoes_app/utils/exceptions/firebase_exceptions.dart';
import 'package:shoes_app/utils/exceptions/format_exceptions.dart';
import 'package:shoes_app/utils/exceptions/platform_exceptions.dart';
import 'package:shoes_app/utils/loaders/Loaders.dart';

class BrandCloud extends GetxController {
  static BrandCloud get instance => Get.find();
  final db = FirebaseFirestore.instance;

  Future<void> uploadDummyData(List<BrandModel> brands) async {
    try {
      final storage = Get.put(FirebaseStorageServices());

      for (var brand in brands) {
        final file = await storage.getImageDataFromAssets(brand.image);

        final url = await storage.uploadImageData('Brands', file, brand.image);

        brand.image = url;

        await db.collection('Brands').doc(brand.id).set(brand.toJson());
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

  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await db.collection('Brands').get();
      final result =
          snapshot.docs.map((brand) => BrandModel.fromSnapshot(brand)).toList();

      return result;
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

  Future<List<ProductModel>> getProductsForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final snapshot = limit == -1
          ? await db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .get()
          : await db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit)
              .get();

      final result = snapshot.docs
          .map((product) => ProductModel.fromSnapshot(product))
          .toList();

      return result;
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
