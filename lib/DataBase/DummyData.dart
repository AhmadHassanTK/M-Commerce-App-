import 'package:shoes_app/Models/Model/BannerModel.dart';
import 'package:shoes_app/Models/Model/BrandModel.dart';
import 'package:shoes_app/Models/Model/CategoryModel.dart';
import 'package:shoes_app/Models/Model/ProductAtributeModel.dart';
import 'package:shoes_app/Models/Model/ProductModel.dart';
import 'package:shoes_app/Models/Model/ProductVariationModel.dart';
import 'package:shoes_app/utils/constants/enums.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/shared/CRoutes.dart';

class DummyData {
  static final List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      name: 'Sports',
      image: CImages.sportIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      name: 'Furniture',
      image: CImages.furnitureIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      name: 'Electronics',
      image: CImages.electronicsIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      name: 'Clothes',
      image: CImages.clothIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      name: 'Animals',
      image: CImages.animalIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      name: 'Shoes',
      image: CImages.shoeIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '7',
      name: 'Cosmetics',
      image: CImages.cosmeticsIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '14',
      name: 'Jewelwey',
      image: CImages.jeweleryIcon,
      isFeatured: true,
    ),

    //Subcategories

    CategoryModel(
      id: '8',
      name: 'Sport Shoes',
      image: CImages.sportIcon,
      isFeatured: false,
      parentId: '1',
    ),
    CategoryModel(
      id: '9',
      name: 'Track suits',
      image: CImages.sportIcon,
      isFeatured: false,
      parentId: '1',
    ),
    CategoryModel(
      id: '10',
      name: 'Sports Equipments',
      image: CImages.sportIcon,
      isFeatured: false,
      parentId: '1',
    ),

    //Furnitures

    CategoryModel(
      id: '11',
      name: 'Bedroom Furniture',
      image: CImages.furnitureIcon,
      isFeatured: false,
      parentId: '5',
    ),
    CategoryModel(
      id: '12',
      name: 'Kitchen Furniture',
      image: CImages.furnitureIcon,
      isFeatured: false,
      parentId: '5',
    ),
    CategoryModel(
      id: '13',
      name: 'Office Furniture',
      image: CImages.furnitureIcon,
      isFeatured: false,
      parentId: '5',
    ),

    // electronics
    CategoryModel(
      id: '14',
      name: 'Laptop',
      image: CImages.electronicsIcon,
      isFeatured: false,
      parentId: '2',
    ),
    CategoryModel(
      id: '15',
      name: 'Mobile',
      image: CImages.electronicsIcon,
      isFeatured: false,
      parentId: '2',
    ),

    //
    CategoryModel(
      id: '16',
      name: 'Shirts',
      image: CImages.electronicsIcon,
      isFeatured: false,
      parentId: '3',
    ),
  ];

  static final List<BannerModel> banners = [
    BannerModel(
      imageUrl: CImages.banner1,
      targetscreen: CRoutes.order,
      active: false,
      id: '1',
    ),
    BannerModel(
      imageUrl: CImages.banner2,
      targetscreen: CRoutes.cart,
      active: true,
      id: '2',
    ),
    BannerModel(
      imageUrl: CImages.banner3,
      targetscreen: CRoutes.favourites,
      active: true,
      id: '3',
    ),
    BannerModel(
      imageUrl: CImages.banner4,
      targetscreen: CRoutes.search,
      active: true,
      id: '4',
    ),
    BannerModel(
      imageUrl: CImages.banner5,
      targetscreen: CRoutes.settings,
      active: true,
      id: '5',
    ),
    BannerModel(
      imageUrl: CImages.banner6,
      targetscreen: CRoutes.userAddress,
      active: true,
      id: '6',
    ),
    BannerModel(
      imageUrl: CImages.banner8,
      targetscreen: CRoutes.checkout,
      active: false,
      id: '7',
    ),
  ];

  static final List<BrandModel> brands = [
    BrandModel(
      id: '1',
      name: 'Nike',
      image: CImages.nikeLogo,
      productsCount: 265,
      isfeatured: true,
    ),
    BrandModel(
      id: '2',
      name: 'Adidas',
      image: CImages.adidasLogo,
      productsCount: 95,
      isfeatured: true,
    ),
    BrandModel(
      id: '8',
      name: 'Kenwood',
      image: CImages.kenwoodLogo,
      productsCount: 36,
      isfeatured: false,
    ),
    BrandModel(
      id: '9',
      name: 'IKEA',
      image: CImages.ikeaLogo,
      productsCount: 36,
      isfeatured: false,
    ),
    BrandModel(
      id: '5',
      name: 'Apple',
      image: CImages.appleLogo,
      productsCount: 16,
      isfeatured: true,
    ),
    BrandModel(
      id: '10',
      name: 'Acer',
      image: CImages.acerlogo,
      productsCount: 36,
      isfeatured: false,
    ),
    BrandModel(
      id: '3',
      name: 'Jordan',
      image: CImages.jordanLogo,
      productsCount: 36,
      isfeatured: true,
    ),
    BrandModel(
      id: '4',
      name: 'Puma',
      image: CImages.pumaLogo,
      productsCount: 65,
      isfeatured: true,
    ),
    BrandModel(
      id: '6',
      name: 'ZARA',
      image: CImages.zaraLogo,
      productsCount: 36,
      isfeatured: true,
    ),
    BrandModel(
      id: '7',
      name: 'Samsung',
      image: CImages.electronicsIcon,
      productsCount: 36,
      isfeatured: false,
    ),
  ];

  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Green Nike sports shoe',
      description: 'Green Nike sports shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: CImages.productImage1,
      brand: BrandModel(
        id: '1',
        name: 'Nike',
        image: CImages.nikeLogo,
        productsCount: 265,
        isfeatured: true,
      ),
      images: [
        CImages.productImage1,
        CImages.productImage23,
        CImages.productImage21,
        CImages.productImage9
      ],
      saleprice: 30,
      sku: 'ABR4568',
      categoryid: '1',
      productAttributes: [
        ProductAtributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAtributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariation: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: CImages.productImage1,
          description:
              'This is a product description for Green Nike sports shoe.',
          attributesValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 132,
          image: CImages.productImage23,
          attributesValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 132,
          image: CImages.productImage23,
          attributesValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 222,
          price: 232,
          image: CImages.productImage1,
          attributesValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 334,
          image: CImages.productImage21,
          attributesValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 332,
          image: CImages.productImage21,
          attributesValues: {'Color': 'Red', 'Size': 'EU 32'},
        ),
      ],
      productType: ProductType.variable.toString(),
    ),
    ProductModel(
      id: '002',
      title: 'Leather brown Jacket',
      stock: 15,
      price: 38000,
      thumbnail: CImages.productImage64,
      isFeatured: false,
      description:
          'This is a product description for Leather brown Jacket. There are more things that can be added',
      brand: BrandModel(id: '6', name: 'ZARA', image: CImages.zaraLogo),
      images: [
        CImages.productImage64,
        CImages.productImage65,
        CImages.productImage66,
        CImages.productImage67
      ],
      saleprice: 30,
      sku: 'ABR4568',
      categoryid: '16',
      productAttributes: [
        ProductAtributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ProductAtributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: ProductType.single.toString(),
    ),
    ProductModel(
      id: '003',
      title: '4 Color collar t-shirt dry fit',
      stock: 15,
      price: 135,
      thumbnail: CImages.productImage68,
      isFeatured: false,
      description:
          'This is a product description for 4 Color collar t-shirt dry fit. There are more things that can be added',
      brand: BrandModel(id: '6', name: 'ZARA', image: CImages.zaraLogo),
      images: [
        CImages.productImage60,
        CImages.productImage61,
        CImages.productImage62,
        CImages.productImage63
      ],
      saleprice: 30,
      sku: 'ABR4568',
      categoryid: '16',
      productAttributes: [
        ProductAtributeModel(name: 'Size', values: [
          'EU 30',
          'EU 32',
          'EU 34',
        ]),
        ProductAtributeModel(
            name: 'Color', values: ['Green', 'Red', 'Blue', 'Yellow']),
      ],
      productVariation: [
        ProductVariationModel(
          id: '1',
          attributesValues: {'Color': 'Red', 'Size': 'EU 34'},
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: CImages.productImage60,
          description:
              'This is a product description for 4 Color collar t-shirt dry fit.',
        ),
        ProductVariationModel(
          id: '2',
          attributesValues: {'Color': 'Red', 'Size': 'EU 32'},
          stock: 15,
          price: 132,
          image: CImages.productImage60,
        ),
        ProductVariationModel(
          id: '3',
          attributesValues: {'Color': 'Yellow', 'Size': 'EU 34'},
          stock: 0,
          price: 243,
          image: CImages.productImage61,
        ),
        ProductVariationModel(
          id: '4',
          attributesValues: {'Color': 'Yellow', 'Size': 'EU 32'},
          stock: 222,
          price: 232,
          image: CImages.productImage61,
        ),
        ProductVariationModel(
          id: '5',
          attributesValues: {'Color': 'Green', 'Size': 'EU 34'},
          stock: 0,
          price: 334,
          image: CImages.productImage62,
        ),
        ProductVariationModel(
          id: '6',
          attributesValues: {'Color': 'Green', 'Size': 'EU 30'},
          stock: 11,
          price: 332,
          image: CImages.productImage60,
        ),
      ],
      productType: ProductType.variable.toString(),
    ),
    ProductModel(
      id: '004',
      title: 'Samsung Galaxy 59 (Pink, 64 GB) (4 GB RAM)',
      stock: 15,
      price: 750,
      isFeatured: true,
      thumbnail: CImages.productImage11,
      description:
          'Samsung Galaxy 59 (Pink, 64 GB) (4 GB RAM), Long Battery timing',
      brand: BrandModel(id: '7', name: 'Samsung', image: CImages.appleLogo),
      images: [
        CImages.productImage11,
        CImages.productImage12,
        CImages.productImage13,
        CImages.productImage14
      ],
      saleprice: 650,
      sku: 'ABR4568',
      categoryid: '2',
      productAttributes: [
        ProductAtributeModel(name: 'Size', values: ['EU 32', 'EU 34']),
        ProductAtributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: ProductType.single.toString(),
    ),
    ProductModel(
      id: '005',
      title: 'TOMI Dog food',
      stock: 15,
      price: 20,
      isFeatured: true,
      thumbnail: CImages.productImage18,
      description:
          'This is a product description for TOMI Dog food. There are more things that can be added',
      brand: BrandModel(id: '7', name: 'Tomi', image: CImages.appleLogo),
      images: [
        CImages.productImage11,
        CImages.productImage12,
        CImages.productImage13,
        CImages.productImage14
      ],
      saleprice: 10,
      sku: 'ABR4568',
      categoryid: '4',
      productAttributes: [
        ProductAtributeModel(name: 'Size', values: ['EU 32', 'EU 34']),
        ProductAtributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: ProductType.single.toString(),
    ),
    ProductModel(
      id: '006',
      title: 'Red Nike sports shoe',
      description: 'Green Nike sports shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: CImages.productImage1,
      brand: BrandModel(
        id: '1',
        name: 'Nike',
        image: CImages.nikeLogo,
        productsCount: 265,
        isfeatured: true,
      ),
      images: [
        CImages.productImage1,
        CImages.productImage23,
        CImages.productImage21,
        CImages.productImage9
      ],
      saleprice: 30,
      sku: 'ABR4568',
      categoryid: '1',
      productAttributes: [
        ProductAtributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAtributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariation: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: CImages.productImage1,
          description:
              'This is a product description for Green Nike sports shoe.',
          attributesValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 132,
          image: CImages.productImage23,
          attributesValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 132,
          image: CImages.productImage23,
          attributesValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 222,
          price: 232,
          image: CImages.productImage1,
          attributesValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 334,
          image: CImages.productImage21,
          attributesValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 332,
          image: CImages.productImage21,
          attributesValues: {'Color': 'Red', 'Size': 'EU 32'},
        ),
      ],
      productType: ProductType.variable.toString(),
    ),
  ];
}
