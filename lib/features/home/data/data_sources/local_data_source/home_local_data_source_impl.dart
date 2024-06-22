import 'package:hive/hive.dart';
import 'package:slashapp/core/utils/constants.dart';
import 'package:slashapp/features/home/data/data_sources/local_data_source/home_local_data_source.dart';
import 'package:slashapp/features/home/domain/entities/product_entity.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<ProductEntity> fetchBestSellingProducts() {
    var box = Hive.box<ProductEntity>(KBestSellingBox);
    return box.values.toList();
  }

  @override
  List<ProductEntity> fetchNewArrivalProducts() {
    var box = Hive.box<ProductEntity>(KNewArrivalBox);
    return box.values.toList();
  }

  @override
  List<ProductEntity> fetchRecommendedProducts() {
    var box = Hive.box<ProductEntity>(KRecommendedBox);
    return box.values.toList();
  }
}
