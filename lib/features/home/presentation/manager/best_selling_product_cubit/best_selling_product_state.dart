part of 'best_selling_product_cubit.dart';

@immutable
sealed class BestSellingProductState {}

final class BestSellingProductInitial extends BestSellingProductState {}

final class BestSellingProductSuccess extends BestSellingProductState {
  final List<ProductEntity> products;

  BestSellingProductSuccess(this.products);
}

final class BestSellingProductFailure extends BestSellingProductState {
  final String errMsg;

  BestSellingProductFailure(this.errMsg);
}

final class BestSellingProductLoading extends BestSellingProductState {}
