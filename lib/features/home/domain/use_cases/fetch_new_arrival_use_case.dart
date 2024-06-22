import 'package:dartz/dartz.dart';
import 'package:slashapp/core/errors/failures.dart';
import 'package:slashapp/core/use_cases/use_case.dart';
import 'package:slashapp/features/home/domain/entities/product_entity.dart';
import 'package:slashapp/features/home/domain/repos/home_repo.dart';

class FetchNewArrivalUseCase extends UseCase<List<ProductEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchNewArrivalUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<ProductEntity>>> call([NoParam? param]) async {
    return await homeRepo.fetchNewArrivalProducts();
  }
}
