import 'package:e_commerce/data/repositories/banners/banner_repository.dart';
import 'package:e_commerce/dummy_data.dart';
import 'package:e_commerce/features/shop/models/banner_model.dart';
import 'package:e_commerce/utils/constants/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  final _bannerRepository = Get.put(BannerRepository());

  @override
  void onInit(){
    fetchBanners();
    super.onInit();
  }

  final bool localData = true;

  // Update Page Navigational Dots
  void updatePageIndicator(index){
    carouselCurrentIndex.value = index;
  }

  // Fetch Banners
  // Load category data
  Future<void> fetchBanners() async{

        // Fetch Local data or From Firebase
    if (localData) {
        // Show loader while loading categories
        isLoading.value = true;
        banners.addAll(DummyData.banners);
        await Future.delayed(const Duration(seconds: 2));
        isLoading.value = false;
    }else{
      try {
        // Show loader while loading categories
        isLoading.value = true;

        // Fetch banners
        final banners = await _bannerRepository.getAllBanners();
        this.banners.assignAll(banners);

      } catch (e) {
        Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }
}