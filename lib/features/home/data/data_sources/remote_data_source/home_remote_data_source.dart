import '../../../domain/entities/product_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductEntity>> fetchBestSellingProducts();
  Future<List<ProductEntity>> fetchNewArrivalProducts();
  Future<List<ProductEntity>> fetchRecommendedProducts();
}
