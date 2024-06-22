import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/custom_text_style.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Slash.',
          style: CustomTextStyle.style20Urbanist700,
        ),
        SizedBox(
          width: 190,
          height: 50,
          child: ListTile(
            subtitle: Text(
              "Cairo",
              style: CustomTextStyle.style14Urbanist400
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            title: Text(
              "Nasr City",
              style: CustomTextStyle.style14Urbanist400,
            ),
            leading: Icon(
              Icons.location_on,
              color: AppColors.PrimaryColor,
            ),
            trailing: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: AppColors.PrimaryColor,
              size: 30,
            ),
          ),
        ),
        Icon(
          Icons.notifications_none_sharp,
          size: 35,
          color: AppColors.PrimaryColor,
        )
      ],
    );
  }
}
