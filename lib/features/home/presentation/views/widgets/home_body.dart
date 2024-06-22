import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slashapp/features/home/presentation/manager/best_selling_product_cubit/best_selling_product_cubit.dart';
import 'package:slashapp/features/home/presentation/manager/new_arrival_product_cubit/new_arrival_cubit.dart';
import 'package:slashapp/features/home/presentation/manager/recommended_product_cubit/recommended_product_cubit.dart';
import 'package:slashapp/features/home/presentation/views/widgets/category_listview.dart';
import 'package:slashapp/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:slashapp/features/home/presentation/views/widgets/custom_search_textfield.dart';
import 'package:slashapp/features/home/presentation/views/widgets/page_view.dart';
import 'package:slashapp/features/home/presentation/views/widgets/title_bar.dart';
import 'package:slashapp/features/home/presentation/views/widgets/product_listview.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
        children: [
          SizedBox(height: 20.h),
          CustomAppbar(),
          SizedBox(height: 30.h),
          CustomSearchTextfield(),
          SizedBox(height: 40.h),
          PageViewWidget(),
          SizedBox(height: 40.h),
          TitleBar(title: 'Categories'),
          SizedBox(height: 20.h),
          CategoryListview(),
          SizedBox(height: 30.h),
          TitleBar(title: 'Best selling'),
          SizedBox(height: 20.h),
          BlocBuilder<BestSellingProductCubit, BestSellingProductState>(
            builder: (context, state) {
              if (state is BestSellingProductSuccess) {
                return ProductListview(
                  products: state.products,
                );
              } else if (state is BestSellingProductFailure) {
                return Text(state.errMsg);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          SizedBox(height: 40.h),
          TitleBar(title: "New Arrival"),
          SizedBox(height: 20.h),
          BlocBuilder<NewArrivalCubit, NewArrivalState>(
            builder: (context, state) {
              if (state is NewArrivalSuccess) {
                return ProductListview(
                  products: state.products,
                );
              } else if (state is NewArrivalFailure) {
                return Text(state.errMsg);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          SizedBox(height: 40.h),
          TitleBar(title: "Recommended for you"),
          SizedBox(height: 20.h),
          BlocBuilder<RecommendedProductCubit, RecommendedProductState>(
            builder: (context, state) {
              if (state is RecommendedProductSuccess) {
                return ProductListview(
                  products: state.products,
                );
              } else if (state is RecommendedProductFailure) {
                return Text(state.errMsg);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
