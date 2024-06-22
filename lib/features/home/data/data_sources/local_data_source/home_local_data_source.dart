import 'package:slashapp/features/home/domain/entities/product_entity.dart';

abstract class HomeLocalDataSource {
  List<ProductEntity> fetchBestSellingProducts();
  List<ProductEntity> fetchNewArrivalProducts();
  List<ProductEntity> fetchRecommendedProducts();
}
