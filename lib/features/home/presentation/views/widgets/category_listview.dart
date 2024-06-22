import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slashapp/features/home/presentation/views/widgets/category_item.dart';

class CategoryListview extends StatelessWidget {
  CategoryListview({super.key});
  List<String> categoryImg = [
    'assets/images/Vector.png',
    'assets/images/Glasses.png',
    'assets/images/Dice.png',
    'assets/images/Book Blank.png',
    'assets/images/Vector.png'
  ];
  List<String> categoryName = [
    'Fashion',
    'Accessories',
    'Games',
    'Books',
    'Fashion',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => CategoryItem(
                img: categoryImg[index],
                categoryName: categoryName[index],
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: 10.w,
              ),
          itemCount: categoryImg.length),
    );
  }
}
