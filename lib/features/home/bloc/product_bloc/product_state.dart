part of 'product_bloc.dart';


class ProductState extends Equatable {
  const ProductState({
    this.product,
    this.products = const [],
    this.status = Status.initial,
  });

  final ProductModel? product;
  final List<ProductModel> products;
  final Status status;

  ProductState copyWith({
    Status? status,
    ValueGetter<ProductModel?>? product,
    List<ProductModel>? products,
}) {
    return ProductState(
      status: status ?? this.status,
      product: product != null ? product() : this.product,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [
    product,
    status,
    products,
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
