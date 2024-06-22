part of 'recommended_product_cubit.dart';

@immutable
sealed class RecommendedProductState {}

final class RecommendedProductInitial extends RecommendedProductState {}

final class RecommendedProductSuccess extends RecommendedProductState {
  final List<ProductEntity> products;

  RecommendedProductSuccess(this.products);
}

final class RecommendedProductFailure extends RecommendedProductState {
  final String errMsg;

  RecommendedProductFailure(this.errMsg);
}

final class RecommendedProductLoading extends RecommendedProductState {}
