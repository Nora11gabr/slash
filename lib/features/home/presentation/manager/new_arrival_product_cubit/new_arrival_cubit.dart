import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:slashapp/features/home/domain/entities/product_entity.dart';
import 'package:slashapp/features/home/domain/use_cases/fetch_best_selling_use_case.dart';
import 'package:slashapp/features/home/domain/use_cases/fetch_new_arrival_use_case.dart';

part 'new_arrival_state.dart';

class NewArrivalCubit extends Cubit<NewArrivalState> {
  NewArrivalCubit(this.fetchNewArrivalUseCase) : super(NewArrivalInitial());
  final FetchNewArrivalUseCase fetchNewArrivalUseCase;
  Future<void> FetchNewArrivalProduct() async {
    emit(NewArrivalLoading());
    var result = await fetchNewArrivalUseCase.call();
    result.fold(
      (Failure) {
        emit(NewArrivalFailure(Failure.errMsg));
      },
      (products) => {
        emit(
          NewArrivalSuccess(products),
        )
      },
    );
  }
}
