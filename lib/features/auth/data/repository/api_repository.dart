import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_commerce/features/auth/data/repository/face_repository.dart';
import 'package:flutter/services.dart';

import '../models/product_model.dart';

class ApiRepository implements FaceRepository {
  final Dio dio;

  const ApiRepository({
    required this.dio,
  });


  Future<List<ProductModel>> loadProducts() async {
    final String response = await rootBundle.loadString('assets/db/products_db.json');

    final List<dynamic> data = jsonDecode(response);

    return data.map((json) => ProductModel.fromJson(json)).toList();
  }
}
