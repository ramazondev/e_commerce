import 'package:e_commerce/features/auth/data/models/review_model.dart';
import 'package:e_commerce/features/auth/data/repository/review_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final ReviewRepository _repository;

  ReviewBloc(this._repository) : super(const ReviewState()) {

    on<ReviewEvent>((event, emit) => switch (event) {
      GetReviewEvent event => _onGetReview(event, emit),
      GetReviewsEvent event => _onGetReviews(event, emit),
    });
  }

  Future<void> _onGetReview(GetReviewEvent event, Emitter<ReviewState> emit) async {
    if (event.id == null) {
      emit(state.copyWith(status: Status.error));
      return;
    }
    emit(state.copyWith(status: Status.loading));

    try {
      final response = await _repository.getReview(event.id!, event.reviewId!);
      emit(state.copyWith(status: Status.success, review: response));
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }

  Future<void> _onGetReviews(GetReviewsEvent event, Emitter<ReviewState> emit) async {
    if (event.reviewsId == null) {
      emit(state.copyWith(status: Status.error));
      return;
    }
    emit(state.copyWith(status: Status.loading));

    try {
      final response = await _repository.getReviews(event.reviewsId!);
      emit(state.copyWith(status: Status.success, reviews: response));
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }
}
