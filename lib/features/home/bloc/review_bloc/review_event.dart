part of 'review_bloc.dart';
sealed class ReviewEvent extends Equatable {
  const ReviewEvent();

  @override
  List<Object?> get props => [];
}

class GetReviewEvent extends ReviewEvent {
  final String? reviewId;
  final int? id;

  const GetReviewEvent({required this.id, required this.reviewId});

  @override
  List<Object?> get props => [id, reviewId];
}

class GetReviewsEvent extends ReviewEvent {
  final String? reviewsId;

  const GetReviewsEvent({required this.reviewsId});

  @override
  List<Object?> get props => [reviewsId];
}
