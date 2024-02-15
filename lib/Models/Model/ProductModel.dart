import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoes_app/Models/Model/BrandModel.dart';
import 'package:shoes_app/Models/Model/ProductAtributeModel.dart';
import 'package:shoes_app/Models/Model/ProductVariationModel.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double saleprice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryid;
  List<String>? images;
  String productType;
  List<ProductAtributeModel>? productAttributes;
  List<ProductVariationModel>? productVariation;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.categoryid,
    this.date,
    this.description,
    this.isFeatured,
    this.images,
    this.saleprice = 0.0,
    this.productAttributes,
    this.productVariation,
  });

  static ProductModel empty() => ProductModel(
        id: '',
        title: '',
        stock: 0,
        price: 0.0,
        thumbnail: '',
        productType: '',
      );

  toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'SalePrice': saleprice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryid,
      'Brand': brand!.toJson(),
      'Description': description,
      'ProductType': productType,
      'ProductsAttributes': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      'ProductsVariations': productVariation != null
          ? productVariation!.map((e) => e.toJson()).toList()
          : [],
    };
  }

  ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : sku = snapshot.data()!['SKU'] ?? '',
        id = snapshot.id,
        title = snapshot.data()!['Title'] ?? '',
        stock = snapshot.data()!['Stock'] ?? 0,
        price = double.parse((snapshot.data()!['Price'] ?? 0.0).toString()),
        saleprice =
            double.parse((snapshot.data()!['SalePrice'] ?? 0.0).toString()),
        isFeatured = snapshot.data()!['IsFeatured'] ?? false,
        thumbnail = snapshot.data()!['Thumbnail'] ?? '',
        categoryid = snapshot.data()!['CategoryId'] ?? '',
        description = snapshot.data()!['Description'] ?? '',
        productType = snapshot.data()!['ProductType'] ?? '',
        images = snapshot.data()!['Images'] != null
            ? List<String>.from(snapshot.data()!['Images'])
            : [],
        productAttributes = snapshot.data()!['ProductsAttributes'] != null
            ? (snapshot.data()!['ProductsAttributes'] as List<dynamic>)
                .map((e) => ProductAtributeModel.fromJson(e))
                .toList()
            : [],
        productVariation = snapshot.data()!['ProductsVariations'] != null
            ? (snapshot.data()!['ProductsVariations'] as List<dynamic>)
                .map((e) => ProductVariationModel.fromJson(e))
                .toList()
            : [],
        brand = BrandModel.fromJson(snapshot.data()!['Brand']);

  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ProductModel(
      sku: data['SKU'] ?? '',
      id: snapshot.id,
      title: data['Title'] ?? '',
      stock: data['Stock'] ?? 0,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      saleprice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      isFeatured: data['IsFeatured'] ?? false,
      thumbnail: data['Thumbnail'] ?? '',
      categoryid: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductsAttributes'] as List<dynamic>)
          .map((e) => ProductAtributeModel.fromJson(e))
          .toList(),
      productVariation: (data['ProductsVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
      brand: BrandModel.fromJson(data['Brand'] ?? ''),
    );
  }
}
