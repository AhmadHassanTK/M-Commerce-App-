class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariations;

  CartItemModel({
    required this.productId,
    required this.quantity,
    this.variationId = '',
    this.image,
    this.price = 0.0,
    this.title = '',
    this.brandName,
    this.selectedVariations,
  });

  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  Map<String, dynamic> toJson() {
    return {
      'ProductId': productId,
      'Quantity': quantity,
      'VariationId': variationId,
      'Image': image,
      'Price': price,
      'Title': title,
      'BrandName': brandName,
      'SelectedVariations': selectedVariations,
    };
  }

  CartItemModel.fromJson(Map<String, dynamic> json)
      : productId = json['ProductId'],
        quantity = json['Quantity'],
        variationId = json['VariationId'],
        image = json['Image'],
        price = json['Price'] as double,
        title = json['Title'],
        brandName = json['BrandName'],
        selectedVariations = json['SelectedVariations'] != null
            ? Map<String, String>.from(json['SelectedVariations'])
            : null;
}
