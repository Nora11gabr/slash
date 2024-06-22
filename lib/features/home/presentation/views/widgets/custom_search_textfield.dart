import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slashapp/core/utils/colors.dart';
import 'package:slashapp/core/utils/custom_text_style.dart';

class CustomSearchTextfield extends StatelessWidget {
  const CustomSearchTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50.h,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  errorBorder: InputBorder.none,
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30.r,
                    color: AppColors.DarkGrey,
                  ),
                  fillColor: AppColors.LightGrey,
                  contentPadding: EdgeInsets.all(8),
                  hintStyle: CustomTextStyle.style14Urbanist400.copyWith(
                    color: AppColors.Grey,
                  ),
                  hintText: "Search here .."),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          padding: EdgeInsets.all(12.r),
          height: 50.h,
          width: 50.h,
          decoration: BoxDecoration(
              color: AppColors.LightGrey,
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          child: Icon(
            Icons.filter_list,
            color: AppColors.DarkGrey,
          ),
        )
      ],
    );
  }
}
