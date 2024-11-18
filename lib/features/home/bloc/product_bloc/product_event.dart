part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class GetProductEvent extends ProductEvent {
  final int? id;

  const GetProductEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class GetProductsEvent extends ProductEvent {
  const GetProductsEvent();

  @override
  List<Object?> get props => [];
}
