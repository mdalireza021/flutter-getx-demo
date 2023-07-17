import 'package:get/state_manager.dart';
import '../models/FeaturedProductResponse.dart';
import '../networking/ApiResponse.dart';
import '../repository/HomeRepository.dart';
import '../utils/Const.dart';

class HomeController extends GetxController {
  late HomeRepository _homeRepository;

   Rx<ApiResponse<FeaturedProductResponse>> featuredProductResponse = Rx<ApiResponse<FeaturedProductResponse>>(ApiResponse.loading(Const.COMMON_PLEASE_WAIT ));

  HomeController() {
    _homeRepository = HomeRepository();
    getFeaturedProducts();
  }

  getFeaturedProducts() async {
    featuredProductResponse.value = ApiResponse.loading(Const.COMMON_PLEASE_WAIT);

    try {
      var response = await _homeRepository.fetchFeaturedProducts();
      featuredProductResponse.value = ApiResponse.completed(response);
    } catch (e) {
      featuredProductResponse.value = ApiResponse.error(e.toString());
    }

    print(featuredProductResponse.value.data?.data?[0].name);
    print(featuredProductResponse.value.data?.data?[1].name);
    print(featuredProductResponse.value.data?.data?[2].name);
    print(featuredProductResponse.value.data?.data?[3].name);
  }
}
