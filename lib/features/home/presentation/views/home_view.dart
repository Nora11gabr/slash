import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slashapp/core/utils/dio.dart';
import 'package:slashapp/core/utils/service_locators.dart';
import 'package:slashapp/features/home/data/data_sources/local_data_source/home_local_data_source.dart';
import 'package:slashapp/features/home/data/data_sources/local_data_source/home_local_data_source_impl.dart';
import 'package:slashapp/features/home/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:slashapp/features/home/data/data_sources/remote_data_source/home_remote_data_source_impl.dart';
import 'package:slashapp/features/home/domain/repos/home_repo_impl.dart';
import 'package:slashapp/features/home/domain/use_cases/fetch_best_selling_use_case.dart';
import 'package:slashapp/features/home/domain/use_cases/fetch_new_arrival_use_case.dart';
import 'package:slashapp/features/home/domain/use_cases/fetch_recommended_product_use_case.dart';
import 'package:slashapp/features/home/presentation/manager/best_selling_product_cubit/best_selling_product_cubit.dart';
import 'package:slashapp/features/home/presentation/manager/new_arrival_product_cubit/new_arrival_cubit.dart';
import 'package:slashapp/features/home/presentation/manager/recommended_product_cubit/recommended_product_cubit.dart';
import 'package:slashapp/features/home/presentation/views/widgets/category_listview.dart';
import 'package:slashapp/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:slashapp/features/home/presentation/views/widgets/custom_search_textfield.dart';
import 'package:slashapp/features/home/presentation/views/widgets/home_body.dart';
import 'package:slashapp/features/home/presentation/views/widgets/page_view.dart';
import 'package:slashapp/features/home/presentation/views/widgets/title_bar.dart';
import 'package:slashapp/features/home/presentation/views/widgets/product_listview.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => BestSellingProductCubit(
                  FetchBestSellingUseCase(getIt.get<HomeRepoImpl>()),
                )..fetchBestSellingUseCase()),
        BlocProvider(
            create: (context) => RecommendedProductCubit(
                  FetchRecommendedProductUseCase(getIt.get<HomeRepoImpl>()),
                )..fetchRecommendedProductUseCase()),
        BlocProvider(
            create: (context) => NewArrivalCubit(
                  FetchNewArrivalUseCase(getIt.get<HomeRepoImpl>()),
                )..FetchNewArrivalProduct()),
      ],
      child: Scaffold(body: HomeBody()),
    );
  }
}
