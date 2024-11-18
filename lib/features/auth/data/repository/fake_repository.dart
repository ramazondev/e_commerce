import 'package:e_commerce/features/auth/data/models/product_model.dart';

abstract class FakeProductRepository {
  const FakeProductRepository();

  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProduct({int? id});
  Future<void> addFavourite({int? id});
  Future<void> removeFavourite({int? id});

}
