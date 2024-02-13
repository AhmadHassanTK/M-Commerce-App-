import 'package:get/get.dart';
import 'package:shoes_app/DataBase/BannerCloud.dart';
import 'package:shoes_app/Models/Model/BannerModel.dart';
import 'package:shoes_app/utils/loaders/Loaders.dart';

class BannnerController extends GetxController {
  static BannnerController get instance => Get.find();

  final Rx<int> currentpageIndex = 0.obs;
  final isloading = false.obs;
  RxList<BannerModel> allBanners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatepageindex(index) {
    currentpageIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      isloading.value = true;
      final bannercloud = Get.put(BannerCloud());
      final banners = await bannercloud.fetchAllBanners();
      allBanners.assignAll(banners);
    } catch (e) {
      CLoaders.errorSnackbar(title: 'Oh snap!', message: e.toString());
    } finally {
      isloading.value = false;
    }
  }
}
