import 'package:shoes_app/Models/Model/BannerModel.dart';
import 'package:shoes_app/Models/Model/CategoryModel.dart';
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
}
