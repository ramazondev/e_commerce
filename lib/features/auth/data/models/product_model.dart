import 'package:e_commerce/features/auth/data/models/review_model.dart';

class ProductModel {
  final int id;
  final List<String> images;
  final String name;
  final int rating;
  final String currency;
  final String price;
  final List<String> colors;
  final bool isLike;
  final List<num> sizes;
  final String description;
  final Map<String, Object?> specification;
  final List<ReviewModel> reviewModel;

  const ProductModel({
    this.id = 0,
    this.images = const [],
    this.name = '',
    this.rating = 1,
    this.currency = '',
    this.price = '',
    this.colors = const [],
    this.isLike = false,
    this.sizes = const [],
    this.description = '',
    this.specification = const {},
    this.reviewModel = const [],
  });

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'images': images,
      'name': name,
      'rating': rating,
      'currency': currency,
      'price': price,
      'colors': colors,
      'isLike': isLike,
      'sizes': sizes,
      'description': description,
      'specification': specification,
      'reviewModel': reviewModel,
    };
  }

  factory ProductModel.fromJson(Map<String, Object?> json) {
    return ProductModel(
      id: json['id'] as int? ?? 0,
      images: json['images']is List ? List.from(json['images'] as List)  : const  [],
      name: json['name'] as String? ?? '',
      rating: json['rating'] as int? ?? 0,
      currency: json['currency'] as String? ?? '',
      price: json['price'] as String? ?? '',
      colors: json['colors']is List ? List.from(json['colors'] as List)  :const  [],
      isLike: json['isLike'] as bool? ?? false,
      sizes: json['sizes']is List ? List.from(json['sizes'] as List)  :const  [],
      description: json['description'] as String? ?? '',
      specification: json['specification'] is Map ?  Map.from(json['specification'] as Map) : const {},
      reviewModel: (json['reviewModel'] as List).map((e) => ReviewModel.fromJson(e)).toList(),
    );
  }

  @override
  String toString() {
    return 'ProductModel{ '
        'id: $id, '
        'images: $images, '
        'name: $name, '
        'rating: $rating, '
        'currency: $currency, '
        'price: $price, '
        'colors: $colors, '
        'isLike: $isLike, '
        'sizes: $sizes, '
        'description: $description, '
        'specification: $specification, '
        'reviewModel: $reviewModel,'
        '}';
  }
}

void main(){
  final json = {
    "id": 1,
    "images": [
      "https://example.com/image1.jpg",
      "https://example.com/image2.jpg"
    ],
    "name": "FS - Nike Air Max 270 React",
    "rating": 5,
    "currency": "USD",
    "price": "299.43",
    "colors": ["Red", "Blue", "Green"],
    "isLike": true,
    "sizes": [6,6.5,7,7.5, 8.0,8.5, 9.0],
    "description": "High-quality running shoes",
    "specification": {
      "Material": "Synthetic",
      "Weight": "250g",
      "Brand": "Nike"
    },
    "reviewModel": [
      {
        "id": 1,
        "avatar": "https://example.com/avatar1.jpg",
        "fulName": "John Doe",
        "description": "Excellent product!",
        "rating": 5,
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
        "dateTime": "2023-10-05T09:22:00"
      }
    ]
  };
  print(ProductModel.fromJson(json));


}
