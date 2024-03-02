import 'package:get/get.dart';
import 'package:shoes_app/DataBase/CategoryCloud.dart';
import 'package:shoes_app/DataBase/ProductsCloud.dart';
import 'package:shoes_app/Models/Model/CategoryModel.dart';
import 'package:shoes_app/Models/Model/ProductModel.dart';
import 'package:shoes_app/utils/loaders/Loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isloading = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  final categorycloud = Get.put(CategoryCloud());
  final productcloud = ProductsCloud.instance;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isloading.value = true;

      final categories = await categorycloud.getAllCategories();

      allCategories.assignAll(categories);

      featuredCategories.assignAll(
        allCategories
            .where(
              (category) => category.isFeatured && category.parentId.isEmpty,
            )
            .take(8)
            .toList(),
      );
    } catch (e) {
      CLoaders.errorSnackbar(title: 'Oh snap!', message: e.toString());
    } finally {
      isloading.value = false;
    }
  }

  Future<List<ProductModel>> getCategoryProducts(String categoryId) async {
    try {
      final products =
          await productcloud.getProductsForCategory(categoryId: categoryId);
      return products;
    } catch (e) {
      CLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}
