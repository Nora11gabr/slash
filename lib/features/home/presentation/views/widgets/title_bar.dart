import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slashapp/core/utils/colors.dart';

import '../../../../../core/utils/custom_text_style.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: CustomTextStyle.style20Urbanist700,
        ),
        Row(
          children: [
            Text(
              'See all',
              style: CustomTextStyle.style14Urbanist400.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.PrimaryColor),
            ),
            SizedBox(
              width: 10.w,
            ),
            Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                  color: AppColors.LightGrey,
                  borderRadius: BorderRadius.all(Radius.circular(5.r))),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
