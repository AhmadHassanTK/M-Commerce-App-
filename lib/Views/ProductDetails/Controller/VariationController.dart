import 'package:get/get.dart';
import 'package:shoes_app/Models/Controller/CartController.dart';
import 'package:shoes_app/Models/Model/ProductModel.dart';
import 'package:shoes_app/Models/Model/ProductVariationModel.dart';
import 'package:shoes_app/Views/ProductDetails/Controller/ImageController.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  RxString variationstockstatue = ''.obs;
  Rx<ProductVariationModel> selectedVariationG =
      ProductVariationModel.empty().obs;
  RxMap selectedAttriutesM = {}.obs;

  void getProductVariationStockStatue() {
    variationstockstatue.value =
        selectedVariationG.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  void resetSelectedAttributes() {
    selectedAttriutesM.clear();
    variationstockstatue.value = '';
    selectedVariationG.value = ProductVariationModel.empty();
  }

  Set<String?> getAttributesAvailabilityInVariation(
    List<ProductVariationModel> variations,
    String attributeName,
  ) {
    final avaliableAttributes = variations
        .where(
          (variation) =>
              variation.attributesValues[attributeName] != null &&
              variation.attributesValues[attributeName]!.isNotEmpty &&
              variation.stock > 0,
        )
        .map((variation) => variation.attributesValues[attributeName])
        .toSet();
    return avaliableAttributes;
  }

  bool isAttributesAvailable(Map<String, dynamic> variationattributes,
      Map<String, dynamic> selectedattributes) {
    if (variationattributes.length != selectedattributes.length) return false;

    for (final key in variationattributes.keys) {
      if (variationattributes[key] != selectedattributes[key]) return false;
    }

    return true;
  }

  void onAttributeSelection(
    ProductModel product,
    attributeName,
    attributeValue,
  ) {
    final selectedAttributes = Map<String, dynamic>.from(selectedAttriutesM);
    selectedAttributes[attributeName] = attributeValue;
    selectedAttriutesM[attributeName] = attributeValue;

    final selectedvariation = product.productVariation!.firstWhere(
      (variation) => isAttributesAvailable(
        variation.attributesValues,
        selectedAttributes,
      ),
      orElse: () => ProductVariationModel.empty(),
    );

    if (selectedvariation.image.isNotEmpty) {
      ImageController.instance.selectedImage.value = selectedvariation.image;
    }

    if (selectedvariation.id.isNotEmpty) {
      final controller = CartController.instance;
      controller.productQuantityInCart.value = controller
          .getVariationQuantityInCart(product.id, selectedvariation.id);
    }
    selectedVariationG.value = selectedvariation;

    getProductVariationStockStatue();
  }

  String getVariationPrice() {
    return (selectedVariationG.value.salePrice > 0
            ? selectedVariationG.value.salePrice
            : selectedVariationG.value.price)
        .toString();
  }
}
