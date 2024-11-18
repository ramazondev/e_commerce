import 'dart:convert';

import 'package:e_commerce/constants/db_names.dart';
import 'package:e_commerce/features/auth/data/models/review_model.dart';
import 'package:e_commerce/features/auth/data/repository/api_repository.dart';

abstract class ReviewRepository {
  const ReviewRepository();
  Future<List<ReviewModel>> getReviews(String? id);
  Future<ReviewModel> getReview(int reviewId, String? id);
}

class ReviewRepositoryImpl extends ReviewRepository {
  final ApiService _service;
  const ReviewRepositoryImpl(this._service);

  @override
  Future<ReviewModel> getReview(int reviewId, String? id) async {
    await Future.delayed(const Duration(seconds: 2));
    final reviews = await getReviews(id);
    return reviews.firstWhere((element) => element.id == reviewId);
  }

  @override
  Future<List<ReviewModel>> getReviews(String? id) async {
    if(id == null) return [];
    final response = await _service.load(DBNames.reviews);
    final data = (jsonDecode(response) as Map).cast<String, Object?>();
    final reviews = (data[id] as List?)?.map((e) => ReviewModel.fromJson(e)).toList();
    return reviews ?? [];
  }

}
