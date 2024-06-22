import 'package:hive/hive.dart';
import 'package:slashapp/core/utils/constants.dart';
import 'package:slashapp/core/utils/dio.dart';
import 'package:slashapp/features/home/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:slashapp/features/home/data/models/product_model.dart';
import 'package:slashapp/features/home/domain/entities/product_entity.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<ProductEntity>> fetchBestSellingProducts() async {
    var data = await apiService.get();
    List<ProductEntity> products = [];
    for (var item in data["bestSelling"]) {
      products.add(ProductModel.fromJson(item));
    }
    var box = Hive.box(KBestSellingBox);
    box.add(products);
    return products;
  }

  @override
  Future<List<ProductEntity>> fetchNewArrivalProducts() async {
    var data = await apiService.get();
    List<ProductEntity> products = [];
    for (var item in data["newArrival"]) {
      products.add(ProductModel.fromJson(item));
    }
    var box = Hive.box(KNewArrivalBox);
    box.add(products);
    return products;
  }

  @override
  Future<List<ProductEntity>> fetchRecommendedProducts() async {
    var data = await apiService.get();
    List<ProductEntity> products = [];
    for (var item in data["recommendedForYou"]) {
      products.add(ProductModel.fromJson(item));
    }
    var box = Hive.box(KRecommendedBox);
    box.add(products);
    return products;
  }
}
