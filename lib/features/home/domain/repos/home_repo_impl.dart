import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:slashapp/core/errors/failures.dart';
import 'package:slashapp/core/utils/dio.dart';
import 'package:slashapp/features/home/data/data_sources/local_data_source/home_local_data_source.dart';
import 'package:slashapp/features/home/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:slashapp/features/home/data/data_sources/remote_data_source/home_remote_data_source_impl.dart';
import 'package:slashapp/features/home/domain/entities/product_entity.dart';
import 'package:slashapp/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<ProductEntity>>>
      fetchBestSellingProducts() async {
    try {
      var cachedProducts = homeLocalDataSource.fetchBestSellingProducts();

      if (cachedProducts.isNotEmpty) {
        return right(cachedProducts);
      }
      var products = await homeRemoteDataSource.fetchBestSellingProducts();
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchNewArrivalProducts() async {
    try {
      var cachedProducts = homeLocalDataSource.fetchNewArrivalProducts();

      if (cachedProducts.isNotEmpty) {
        return right(cachedProducts);
      }
      var products = await homeRemoteDataSource.fetchNewArrivalProducts();
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>>
      fetchRecommendedProducts() async {
    try {
      var cachedProducts = homeLocalDataSource.fetchRecommendedProducts();

      if (cachedProducts.isNotEmpty) {
        return right(cachedProducts);
      }
      var products = await homeRemoteDataSource.fetchRecommendedProducts();
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
