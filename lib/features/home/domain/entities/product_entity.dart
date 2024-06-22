import 'package:hive/hive.dart';
part 'product_entity.g.dart';

@HiveType(typeId: 0)
class ProductEntity {
  @HiveField(0)
  final String? productImg;
  @HiveField(1)
  final String? productName;
  @HiveField(2)
  num? productPrice;

  ProductEntity({this.productImg, this.productName, this.productPrice});
}
