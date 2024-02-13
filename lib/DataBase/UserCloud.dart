import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Backend/AuthenticationRepository.dart';
import 'package:shoes_app/Models/Model/UserModel.dart';
import 'package:shoes_app/utils/exceptions/firebase_exceptions.dart';
import 'package:shoes_app/utils/exceptions/format_exceptions.dart';
import 'package:shoes_app/utils/exceptions/platform_exceptions.dart';
import 'package:image_picker/image_picker.dart';

class UserCloud extends GetxController {
  static UserCloud get instance => Get.find();

  final FirebaseFirestore db = FirebaseFirestore.instance;
  final authRep = AuthenticationRepository.instance;

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

  Future<UserModel> fetchUserData() async {
    try {
      final doucumentSnapshot =
          await db.collection('Users').doc(authRep.authuser?.uid).get();

      if (doucumentSnapshot.exists) {
        return UserModel.fromSnapshot(doucumentSnapshot);
      } else {
        return UserModel.empty();
      }
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

  Future<void> updateUserData(UserModel updateduser) async {
    try {
      await db
          .collection('Users')
          .doc(updateduser.id)
          .update(updateduser.toJson());
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

  Future<void> updateSingleField(Map<String, dynamic> Json) async {
    try {
      await db.collection('Users').doc(authRep.authuser?.uid).update(Json);
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

  Future<void> deleteUserData(String userId) async {
    try {
      await db.collection('Users').doc(userId).delete();
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

  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
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
