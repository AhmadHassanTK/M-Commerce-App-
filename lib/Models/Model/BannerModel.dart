import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  final String targetscreen;
  final bool active;
  String id;

  BannerModel({
    required this.imageUrl,
    required this.targetscreen,
    required this.active,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'targetscreen': targetscreen,
      'active': active,
      'id': id,
    };
  }

  BannerModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : imageUrl = snapshot.data()!['imageUrl'] ?? '',
        targetscreen = snapshot.data()!['targetscreen'] ?? '',
        id = snapshot.id,
        active = snapshot.data()!['active'] ?? false;
}
