import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Backend/FirebaseStorageServices.dart';
import 'package:shoes_app/Models/Model/ProductModel.dart';
import 'package:shoes_app/utils/constants/enums.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/exceptions/firebase_exceptions.dart';
import 'package:shoes_app/utils/exceptions/format_exceptions.dart';
import 'package:shoes_app/utils/exceptions/platform_exceptions.dart';
import 'package:shoes_app/utils/loaders/FullScreenLoader.dart';
import 'package:shoes_app/utils/loaders/Loaders.dart';

class ProductsCloud extends GetxController {
  static ProductsCloud get instance => Get.find();

  final db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final documents = await db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();

      return documents.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw CFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CFormatException();
    } on PlatformException catch (e) {
      throw CPlatformException(e.code).message;
    } catch (e) {
      print(e.toString());
      throw 'Something went wrong, Please try again';
    }
  }

  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      CFullScreenLoader.openLoadingDialog(
          'uploading the products', CImages.dockeranimation);
      final storage = Get.put(FirebaseStorageServices());

      for (var product in products) {
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        product.thumbnail = url;

        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesurl = [];
          for (var image in product.images!) {
            final assetImage = await storage.getImageDataFromAssets(image);

            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            imagesurl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesurl);
        }

        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariation!) {
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);

            variation.image = url;
          }
        }

        await db.collection('Products').doc(product.id).set(product.toJson());
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
    } finally {
      CFullScreenLoader.stoploading();
    }
  }
}
