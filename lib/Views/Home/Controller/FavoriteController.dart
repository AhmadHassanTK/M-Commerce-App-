import 'dart:convert';

import 'package:get/get.dart';
import 'package:shoes_app/DataBase/ProductsCloud.dart';
import 'package:shoes_app/Models/Model/ProductModel.dart';
import 'package:shoes_app/utils/loaders/Loaders.dart';
import 'package:shoes_app/utils/local_storage/storage_utility.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();

  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    initFavorites();
    super.onInit();
  }

  void initFavorites() {
    final json = CLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedfavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedfavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String productId) {
    return favorites[productId] ?? false;
  }

  void toogleFavoriteProduct(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();
      CLoaders.customToast(message: 'Product has been added to the Wishlist.');
    } else {
      CLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      CLoaders.customToast(
          message: 'Product has been removed to the Wishlist.');
    }
  }

  void saveFavoritesToStorage() {
    final encodedjson = json.encode(favorites);
    CLocalStorage.instance().saveData('favorites', encodedjson);
  }

  Future<List<ProductModel>> getFavoritedProducts() async {
    return await ProductsCloud.instance
        .getFavoritedProducts(favorites.keys.toList());
  }
}
