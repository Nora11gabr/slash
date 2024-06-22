import 'package:slashapp/features/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  int? id;
  String? name;
  double? price;
  String? image;

  ProductModel({this.id, this.name, this.price, this.image})
      : super(productImg: image, productName: name, productPrice: price);

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        price: (json['price'] as num?)?.toDouble(),
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'image': image,
      };
}
