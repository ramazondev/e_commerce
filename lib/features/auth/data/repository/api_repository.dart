import 'dart:convert';

import 'package:e_commerce/constants/db_names.dart';
import 'package:e_commerce/features/auth/data/repository/fake_repository.dart';
import 'package:flutter/services.dart';

import '../models/product_model.dart';

class FakeProductRepoImpl implements FakeProductRepository {
  final ApiService _service;

  const FakeProductRepoImpl(this._service);

  @override
  Future<List<ProductModel>> getProducts() async {
    final String response = await _service.load(DBNames.products);

    final List<dynamic> data = jsonDecode(response);

    return data.map((json) => ProductModel.fromJson(json)).toList();
  }

  @override
  Future<ProductModel> getProduct({int? id}) async {
    final String response = await _service.load(DBNames.products);

    final data = (jsonDecode(response) as List).map((e) => ProductModel.fromJson((e as Map).cast())).toList();

    return data.firstWhere((element) => element.id == id);
  }

  // Future<List<ReviewModel>> reviewProducts() async {
  //   final String response = await rootBundle.loadString('assets/db/review_db.json');
  //
  //   final List<dynamic> data = jsonDecode(response);
  //
  //   return data.map((json) => ReviewModel.fromJson(json)).toList();
  // }
  //
  // Future<ReviewModel?> reviewProduct(String? id) async {
  //   if (id == null) return null;
  //   final String response = await rootBundle.loadString('assets/db/review_db.json');
  //   final data = (jsonDecode(response) as List).map((e) => ReviewModel.fromJson((e as Map).cast())).toList();
  //
  //   try {
  //     return data.firstWhere((e) => e.id == id);
  //   } catch (_) {
  //     return null;
  //   }
  // }

  @override
  Future<void> addFavourite({int? id}) {
    // TODO: implement addFavourite
    throw UnimplementedError();
  }

  @override
  Future<void> removeFavourite({int? id}) {
    // TODO: implement removeFavourite
    throw UnimplementedError();
  }
}

class ApiService {

  const ApiService._();
  static const instance = ApiService._();
  Future<String> load(String fileName) async {
    return await rootBundle.loadString('assets/db/$fileName.json');
  }
}

// class RealProductRepoImpl extends FakeProductRepository {
//   @override
//   Future<void> addFavourite({int? id}) {
//     // TODO: implement addFavourite
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<ProductModel> getProduct({int? id}) {
//     // TODO: implement getProduct
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<List<ProductModel>> getProducts() {
//     // TODO: implement getProducts
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<void> removeFavourite({int? id}) {
//     // TODO: implement removeFavourite
//     throw UnimplementedError();
//   }
//
// }
