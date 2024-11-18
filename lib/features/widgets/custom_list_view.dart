import 'package:e_commerce/features/home/presentation/pages/widgets/review_product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_color.dart';
import '../../router/app_routes.dart';
import '../auth/data/models/product_model.dart';

class CustomListView extends StatelessWidget {
  final List<ProductModel> products;

  const CustomListView({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 245,
      child: ListView.builder(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                context.pushNamed(
                  Routes.detail,
                  extra: product.id,
                );
              },
              child: SizedBox(
                width: 140,
                height: 240,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 2, color: AppColors.textFiled),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 109,
                          height: 109,
                          child: Image.network(product.images[0]),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          product.name,
                          maxLines: 2,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "\$${(double.parse(product.price) * 1.2).toStringAsFixed(2)}",
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${(double.parse(product.price) * 1.2).toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: AppColors.textGreen,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Text(
                              "${product.rating}★",
                              style: const TextStyle(
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryRed,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
