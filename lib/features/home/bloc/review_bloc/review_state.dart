part of 'review_bloc.dart';
class ReviewState extends Equatable {
  const ReviewState({
    this.review = const ReviewModel(),
    this.reviews = const [],
    this.status = Status.initial,
  });

  final ReviewModel review;
  final List<ReviewModel> reviews;
  final Status status;

  ReviewState copyWith({
    Status? status,
    ReviewModel? review,
    List<ReviewModel>? reviews,
  }) {
    return ReviewState(
      status: status ?? this.status,
      review: review ?? this.review,
      reviews: reviews ?? this.reviews,
    );
  }

  @override
  List<Object?> get props => [
    review,
    status,
    reviews,
  ];
}

enum Status {
  initial,
  loading,
  success,
  error;

  bool get isLoading => this == Status.loading;
  bool get isInitial => this == Status.initial;
  bool get isSuccess => this == Status.success;
  bool get isError => this == Status.error;
}
