import 'package:get/get.dart';
import 'package:shoes_app/DataBase/ProductsCloud.dart';
import 'package:shoes_app/Models/Model/ProductModel.dart';
import 'package:shoes_app/utils/constants/enums.dart';
import 'package:shoes_app/utils/loaders/Loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  RxList<ProductModel> allProducts = <ProductModel>[].obs;
  final isloading = false.obs;
  final productcloud = Get.put(ProductsCloud());

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  fetchFeaturedProducts() async {
    try {
      isloading.value = true;

      final products = await productcloud.getFeaturedProducts();

      allProducts.assignAll(products);
    } catch (e) {
      CLoaders.errorSnackbar(
          title: 'Oh Snap in productController!', message: e.toString());
    } finally {
      isloading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      final products = await productcloud.getAllFeaturedProducts();

      return products;
    } catch (e) {
      CLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    if (product.productType == ProductType.single.toString()) {
      return (product.saleprice > 0 ? product.saleprice : product.price)
          .toString();
    } else {
      for (var variation in product.productVariation!) {
        double price =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        if (price < smallestPrice) {
          smallestPrice = price;
        }

        if (price > largestPrice) {
          largestPrice = price;
        }
      }

      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

  String? salePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String stockStatue(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
