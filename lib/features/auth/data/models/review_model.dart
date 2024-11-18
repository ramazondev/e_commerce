class ReviewModel {
  final int id;
  final String avatar;
  final String fulName;
  final String description;
  final int rating;
  final List<String> images;
  final String dateTime;

  const ReviewModel({
    this.id = 0,
    this.avatar = '',
    this.fulName = '',
    this.description = '',
    this.rating = 0,
    this.images = const [],
    this.dateTime = '',
  });

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'avatar': avatar,
      'fulName': fulName,
      'description': description,
      'rating': rating,
      'images': images,
      'dateTime': dateTime,
    };
  }

  factory ReviewModel.fromJson(Map<String, Object?> json) {
    return ReviewModel(
      id: json['id'] as int? ?? 0,
      avatar: json['avatar'] as String? ?? '',
      fulName: json['fulName'] as String? ?? '',
      description: json['description'] as String? ?? '',
      rating: json['rating'] as int? ?? 0,
      images: json['images']is List ? List.from(json['images'] as List)  : [],
      dateTime: json['dateTime'] as String? ?? '',
    );
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ReviewModel && runtimeType == other.runtimeType && id == other.id && avatar == other.avatar && fulName == other.fulName && description == other.description && rating == other.rating && images == other.images && dateTime == other.dateTime;

  @override
  int get hashCode => id.hashCode ^ avatar.hashCode ^ fulName.hashCode ^ description.hashCode ^ rating.hashCode ^ images.hashCode ^ dateTime.hashCode;

  @override
  String toString() {
    return 'ReviewModel{id: $id, avatar: $avatar, fulName: $fulName, description: $description, rating: $rating, images: $images, dateTime: $dateTime}';
  }
}

void main(){
  final json = {
    "review_1": [
      {
        "id": 1,
        "avatar": "https://example.com/avatar1.jpg",
        "fulName": "John Doe",
        "description": "Excellent product!",
        "rating": 3,
        "images": [
          "https://example.com/review-image1.jpg",
          "https://example.com/review-image2.jpg"
        ],
        "dateTime": "2023-10-01T12:34:56"
      },
      {
        "id": 2,
        "avatar": "https://example.com/avatar2.jpg",
        "fulName": "Jane Smith",
        "description": "Good quality, but runs small.",
        "rating": 4,
        "images": [
          "https://example.com/review-image3.jpg"
        ],
        "dateTime": "2024-10-05 09:22:00"
      }
    ],
  };
  List<ReviewModel> reviews = (json['review_1'] as List).map((e) => ReviewModel.fromJson(e)).toList();

  print(reviews);
}
