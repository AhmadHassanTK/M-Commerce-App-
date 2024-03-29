import 'package:get/get.dart';
import 'package:shoes_app/DataBase/BrandCloud.dart';
import 'package:shoes_app/DataBase/ProductsCloud.dart';
import 'package:shoes_app/Models/Model/BrandModel.dart';
import 'package:shoes_app/Models/Model/ProductModel.dart';
import 'package:shoes_app/utils/loaders/Loaders.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isloading = false.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandcloud = Get.put(BrandCloud());
  final productcloud = ProductsCloud.instance;

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  Future<void> getFeaturedBrands() async {
    try {
      isloading.value = true;
      final brands = await brandcloud.getAllBrands();

      allBrands.assignAll(brands);

      featuredBrands.assignAll(
          brands.where((brand) => brand.isfeatured ?? false).take(4));
    } catch (e) {
      CLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isloading.value = false;
    }
  }

  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      final brands =
          await brandcloud.getBrandForCategory(categoryId: categoryId);
      return brands;
    } catch (e) {
      CLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getBrandProducts(String brandId) async {
    try {
      final products = await productcloud.getProductsForBrand(brandId: brandId);
      return products;
    } catch (e) {
      CLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}
