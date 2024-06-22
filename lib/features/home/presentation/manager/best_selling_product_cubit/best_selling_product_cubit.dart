import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:slashapp/features/home/domain/entities/product_entity.dart';
import 'package:slashapp/features/home/domain/use_cases/fetch_best_selling_use_case.dart';

part 'best_selling_product_state.dart';

class BestSellingProductCubit extends Cubit<BestSellingProductState> {
  BestSellingProductCubit(this.fetchBestSellingUseCase)
      : super(BestSellingProductInitial());
  final FetchBestSellingUseCase fetchBestSellingUseCase;
  Future<void> FetchBestSellingProduct() async {
    emit(BestSellingProductLoading());
    var result = await fetchBestSellingUseCase.call();
    result.fold(
      (Failure) {
        emit(BestSellingProductFailure(Failure.errMsg));
      },
      (products) => {
        emit(
          BestSellingProductSuccess(products),
        )
      },
    );
  }
}
