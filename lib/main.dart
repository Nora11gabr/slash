import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:slashapp/core/utils/constants.dart';
import 'package:slashapp/core/utils/service_locators.dart';
import 'package:slashapp/features/home/domain/entities/product_entity.dart';
import 'package:slashapp/features/home/presentation/views/home_view.dart';

void main() async {
  setup();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductEntityAdapter());
  await Hive.openBox<ProductEntity>(KBestSellingBox);
  await Hive.openBox<ProductEntity>(KNewArrivalBox);
  await Hive.openBox<ProductEntity>(KRecommendedBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        home: HomeView(),
        debugShowCheckedModeBanner: false,
      ),
      designSize: const Size(360, 690),
    );
  }
}
