import '../models/FeaturedProductResponse.dart';
import '../networking/ApiBaseHelper.dart';
import '../networking/Endpoints.dart';

class HomeRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<FeaturedProductResponse> fetchFeaturedProducts() async {
    final response = await _helper.get(Endpoints.featuredProduct);
    return FeaturedProductResponse.fromJson(response);
  }
}
