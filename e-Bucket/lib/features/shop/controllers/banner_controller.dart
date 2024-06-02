import 'package:get/get.dart';
import 'package:t_store/data/repositories/banners/banners_repository.dart';
import 'package:t_store/features/shop/models/banner_model.dart';

import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController {
  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;

  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.getAllBanners();
      this.banners.assignAll(banners);
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh No!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
