import 'package:e_commerce/features/auth/data/models/product_model.dart';
import 'package:e_commerce/features/auth/data/repository/fake_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FakeProductRepository _repository;

  ProductBloc(this._repository) : super(const ProductState()) {
    on<ProductEvent>((event, emit) => switch (event) {
          GetProductEvent event => _onGetProduct(event, emit),
          GetProductsEvent event => _onGetProducts(event, emit),
        });
  }

  Future<void> _onGetProduct(GetProductEvent event, Emitter<ProductState> emit) async {
    if (event.id == null) {
      emit(state.copyWith(
        status: Status.error,
      ));
      return;
    }
    emit(state.copyWith(status: Status.loading));
    await Future.delayed(const Duration(seconds: 2));
    final response = await _repository.getProduct(id: event.id);
    emit(state.copyWith(
      status: Status.success,
      product: () => response,
    ));
  }


  Future<void> _onGetProducts(GetProductsEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: Status.loading));
    await Future.delayed(const Duration(seconds: 2));
    final response = await _repository.getProducts();
    emit(state.copyWith(
      status: Status.success,
      products: response,
    ));
  }
}
