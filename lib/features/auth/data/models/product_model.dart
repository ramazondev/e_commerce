
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
  final String? reviewId;

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
    this.reviewId,
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
      reviewId: json['review_id'] as String?,
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
        '}';
  }
}

void main(){
  final json = {
    "id": 1,
    "images": [
      "https://image.goat.com/750/attachments/product_template_pictures/images/003/175/597/original/905221_001.png.png",
      "https://static.cdek.shopping/images/shopping/48fbb7ea20d844b08f1b2bc88c31f4fb.jpg",
      "https://i.pinimg.com/originals/31/1d/86/311d86a72a138cb064309df49207fcee.png"
    ],
    "name": "FS - Nike Air Max 270 React",
    "rating": 5,
    "currency": "USD",
    "price": "299.43",
    "colors": [
      "#FF0000",
      "#0000FF",
      "#008000",
      "#FFFF00",
      "#000000",
      "#FFFFFF",
      "#FFA500",
      "#800080",
      "#FFC0CB",
      "#A52A2A",
      "#808080"
    ],
    "isLike": true,
    "sizes": [
      6,
      6.5,
      7,
      7.5,
      8.0,
      8.5,
      9.0
    ],
    "description": "High-quality running shoes",
    "specification": {
      "Material": "Synthetic",
      "Weight": "250g",
      "Brand": "Nike"
    },
  };


}
