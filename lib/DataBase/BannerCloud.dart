import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Backend/FirebaseStorageServices.dart';
import 'package:shoes_app/Models/Model/BannerModel.dart';
import 'package:shoes_app/utils/exceptions/firebase_exceptions.dart';
import 'package:shoes_app/utils/exceptions/format_exceptions.dart';
import 'package:shoes_app/utils/exceptions/platform_exceptions.dart';
import 'package:shoes_app/utils/loaders/Loaders.dart';

class BannerCloud extends GetxController {
  static BannerCloud get instance => Get.find();

  final db = FirebaseFirestore.instance;

  Future<List<BannerModel>> fetchAllBanners() async {
    try {
      final snapshot =
          await db.collection('Banners').where('active', isEqualTo: true).get();
      final list =
          snapshot.docs.map((e) => BannerModel.fromSnapshot(e)).toList();
      return list;
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

  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      final storage = Get.put(FirebaseStorageServices());

      for (var banner in banners) {
        final file = await storage.getImageDataFromAssets(banner.imageUrl);

        final url =
            await storage.uploadImageData('Banners', file, banner.imageUrl);

        banner.imageUrl = url;

        await db.collection('Banners').doc(banner.id).set(banner.toJson());
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
