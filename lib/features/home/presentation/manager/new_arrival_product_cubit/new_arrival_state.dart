part of 'new_arrival_cubit.dart';

@immutable
sealed class NewArrivalState {}

final class NewArrivalInitial extends NewArrivalState {}

final class NewArrivalSuccess extends NewArrivalState {
  final List<ProductEntity> products;

  NewArrivalSuccess(this.products);
}

final class NewArrivalFailure extends NewArrivalState {
  final String errMsg;

  NewArrivalFailure(this.errMsg);
}

final class NewArrivalLoading extends NewArrivalState {}
