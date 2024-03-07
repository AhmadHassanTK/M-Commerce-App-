import 'package:get/get.dart';
import 'package:shoes_app/Models/Model/CartItemModel.dart';
import 'package:shoes_app/Models/Model/ProductModel.dart';
import 'package:shoes_app/Views/ProductDetails/Controller/VariationController.dart';
import 'package:shoes_app/utils/constants/enums.dart';
import 'package:shoes_app/utils/loaders/Loaders.dart';
import 'package:shoes_app/utils/local_storage/storage_utility.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = Get.put(VariationController());

  CartController() {
    loadCartItems();
  }

  void addToCart(ProductModel product) {
    if (productQuantityInCart.value < 1) {
      CLoaders.customToast(message: 'Select Quantity');
      return;
    }

    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariationG.value.id.isEmpty) {
      CLoaders.customToast(message: 'Select Variation');
      return;
    }

    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariationG.value.stock < 1) {
        CLoaders.warningSnackbar(
            title: 'Oh Snap!', message: 'Select Variation is out of stock');
        return;
      }
    } else {
      CLoaders.warningSnackbar(
          title: 'Oh Snap!', message: 'Select Product  is out of stock');
      return;
    }

    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    CLoaders.customToast(message: 'Your Product has been added to the Cart.');
  }

  void addOneToCart(CartItemModel item) {
    final index = cartItems.indexWhere((cartitem) =>
        item.productId == cartitem.productId &&
        item.variationId == cartitem.variationId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    final index = cartItems.indexWhere((cartitem) =>
        item.productId == cartitem.productId &&
        item.variationId == cartitem.variationId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
    }

    updateCart();
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product?',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        CLoaders.customToast(
            message: 'Product removed successfully from the Cart.');
        Get.back();
      },
      onCancel: () => Get.back(),
    );
  }

  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString) {
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariationG.value;
    final isvariation = variation.id.isNotEmpty;

    final price = isvariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.saleprice > 0.0
            ? product.saleprice
            : product.price;

    return CartItemModel(
      productId: product.id,
      quantity: quantity,
      price: price,
      title: product.title,
      variationId: variation.id,
      image: isvariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariations: isvariation ? variation.attributesValues : null,
    );
  }

  updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  updateCartTotals() {
    double calculatedtotalprice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedtotalprice += (item.price) * item.quantity.roundToDouble();
      calculatedNoOfItems += item.quantity;
    }
    totalCartPrice.value = calculatedtotalprice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  saveCartItems() {
    final cartItemstoJson = cartItems.map((item) => item.toJson()).toList();
    CLocalStorage.instance().saveData('CartItems', cartItemstoJson);
  }

  void loadCartItems() {
    final cartItemsloaded =
        CLocalStorage.instance().readData<List<dynamic>>('CartItems');

    if (cartItemsloaded != null) {
      cartItems.assignAll(cartItemsloaded
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));

      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundedItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);

    return foundedItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundedItem = cartItems.firstWhere(
        (item) =>
            item.productId == productId && item.variationId == variationId,
        orElse: () => CartItemModel.empty());

    return foundedItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      final variationId = variationController.selectedVariationG.value.id;
      if (variationId.isNotEmpty) {
        productQuantityInCart.value =
            getVariationQuantityInCart(product.id, variationId);
      } else {
        productQuantityInCart.value = 0;
      }
    }
  }
}
