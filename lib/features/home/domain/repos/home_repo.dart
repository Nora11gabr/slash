import 'package:dartz/dartz.dart';
import 'package:slashapp/core/errors/failures.dart';
import 'package:slashapp/features/home/domain/entities/product_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductEntity>>> fetchBestSellingProducts();
  Future<Either<Failure, List<ProductEntity>>> fetchNewArrivalProducts();
  Future<Either<Failure, List<ProductEntity>>> fetchRecommendedProducts();
}
