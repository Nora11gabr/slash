import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:slashapp/features/home/domain/entities/product_entity.dart';
import 'package:slashapp/features/home/domain/use_cases/fetch_best_selling_use_case.dart';
import 'package:slashapp/features/home/domain/use_cases/fetch_recommended_product_use_case.dart';

part 'recommended_product_state.dart';

class RecommendedProductCubit extends Cubit<RecommendedProductState> {
  RecommendedProductCubit(this.fetchRecommendedProductUseCase)
      : super(RecommendedProductInitial());
  final FetchRecommendedProductUseCase fetchRecommendedProductUseCase;
  Future<void> FetchRecommendedProductProduct() async {
    emit(RecommendedProductLoading());
    var result = await fetchRecommendedProductUseCase.call();
    result.fold(
      (Failure) {
        emit(RecommendedProductFailure(Failure.errMsg));
      },
      (products) => {
        emit(
          RecommendedProductSuccess(products),
        )
      },
    );
  }
}
