import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slashapp/features/home/domain/entities/product_entity.dart';
import 'package:slashapp/features/home/presentation/views/widgets/product_card.dart';

class ProductListview extends StatelessWidget {
  const ProductListview({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView.separated(
        itemCount: products.length,
        separatorBuilder: (context, index) => SizedBox(
          width: 10.w,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCard(
            price: products[index].productPrice!,
            img: products[index].productImg!,
            title: products[index].productName!,
          );
        },
      ),
    );
  }
}
