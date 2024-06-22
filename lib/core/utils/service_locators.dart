import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:slashapp/core/utils/dio.dart';
import 'package:slashapp/features/home/data/data_sources/local_data_source/home_local_data_source_impl.dart';
import 'package:slashapp/features/home/domain/repos/home_repo_impl.dart';

import '../../features/home/data/data_sources/remote_data_source/home_remote_data_source_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(
    ApiService(),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
        homeLocalDataSource: HomeLocalDataSourceImpl(),
        homeRemoteDataSource:
            HomeRemoteDataSourceImpl(getIt.get<ApiService>())),
  );
}
