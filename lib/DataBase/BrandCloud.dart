import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Backend/FirebaseStorageServices.dart';
import 'package:shoes_app/Models/Model/BrandModel.dart';
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

  Future<List<BrandModel>> getBrandForCategory(
      {required String categoryId}) async {
    try {
      QuerySnapshot brandcategoryquery = await db
          .collection('BrandCategory')
          .where('CategoryId', isEqualTo: categoryId)
          .get();

      List<String> brandIDs = brandcategoryquery.docs
          .map((brandcategory) => (brandcategory['brandId'] as String).trim())
          .toList();

      final brandsquery = await db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIDs)
          .get();

      print('brandsquery is ${brandsquery.docs}');

      List<BrandModel> brands =
          brandsquery.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      print('the brand length is ${brands.length}');

      print('the brand id is ${brands[0].id}');

      return brands;
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
