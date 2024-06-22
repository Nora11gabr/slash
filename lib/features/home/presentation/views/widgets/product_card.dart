import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slashapp/core/utils/colors.dart';
import 'package:slashapp/core/utils/custom_text_style.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key, required this.img, required this.title, required this.price});
  final String img;
  final String title;
  final num price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135.w,
      height: 180.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 135.w,
                height: 116.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      img ?? 'assets/images/Vector.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                ),
              ),
              Positioned(
                  top: 7.h,
                  right: 7.w,
                  child: CircleAvatar(
                    radius: 17.r,
                    child: Icon(
                      Icons.favorite_border,
                      color: AppColors.PrimaryColor,
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            title,
            style: CustomTextStyle.style14Urbanist400
                .copyWith(color: AppColors.PrimaryColor, fontSize: 16.sp),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$price",
                style: CustomTextStyle.style20Urbanist700
                    .copyWith(color: AppColors.PrimaryColor, fontSize: 16.sp),
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/Ellipse 111.png'),
                    radius: 15.r,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CircleAvatar(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    backgroundColor: AppColors.PrimaryColor,
                    radius: 15.r,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
