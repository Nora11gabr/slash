import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slashapp/core/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({super.key});

  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  final PageController pageController = PageController(viewportFraction: 1.0);
  final List<String> pages = [
    "assets/images/Hot Deal 1.png",
    "assets/images/Hot Deal 1.png",
  ];
  int currentPage = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (Timer t) {
      if (currentPage < pages.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150.h,
          child: PageView.builder(
            controller: pageController,
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(8),
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(pages[index]),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 16.h),
        Center(
          child: SmoothPageIndicator(
            controller: pageController,
            count: pages.length,
            effect: const WormEffect(
              activeDotColor: Color(0xff292929),
              dotColor: Colors.grey,
              dotHeight: 5,
              dotWidth: 16,
              type: WormType.thinUnderground,
            ),
          ),
        ),
      ],
    );
  }
}
