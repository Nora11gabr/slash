import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slashapp/core/utils/colors.dart';
import 'package:slashapp/core/utils/custom_text_style.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.img, required this.categoryName});
  final String img;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundColor: AppColors.PrimaryColor,
          child: Image.asset(
            img,
            width: 40.w,
            height: 40.h,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          categoryName,
          style: CustomTextStyle.style14Urbanist400,
        ),
      ],
    );
  }
}
