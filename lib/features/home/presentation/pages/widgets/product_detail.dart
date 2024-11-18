
import 'package:e_commerce/core/extension/string_extantion.dart';
import 'package:e_commerce/features/home/bloc/review_bloc/review_bloc.dart';
import 'package:e_commerce/features/home/presentation/pages/widgets/review_product.dart';
import 'package:e_commerce/features/widgets/custom_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../router/app_routes.dart';
import '../../../bloc/product_bloc/product_bloc.dart';
import 'image_slide.dart';
class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  List<Widget> _buildRatingStars(int rating) {
    return List.generate(
      5,
          (index) => index < rating
          ? AppIcons.starYel.svg(width: 16, height: 16)
          : AppIcons.starGr.svg(width: 16, height: 16),
    );
  }

  int _selectedSizeIndex = -1;
  int _selectedColorIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if(state.product != null) {
          print("""
          --------------------------------------------------------------------------------------------------
          --------------------------------------------------------------------------------------------------
          --------------------------------------------------------------------------------------------------
          --------------------------------------------------------------------------------------------------
          --------------------------------------------------------------------------------------------------
          --------------------------------------------------------------------------------------------------
          --------------------------------------------------------------------------------------------------
          --------------------------------------------------------------------------------------------------
          
          """);
          context.read<ReviewBloc>().add(GetReviewEvent(reviewId: state.product?.reviewId, id: state.product?.id));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              state.product?.name ?? '',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            elevation: 0,
            backgroundColor: AppColors.transparent,
            leading: IconButton(
              icon: AppIcons.arrow.svg(),
              onPressed: () => context.go(Routes.home),
            ),
            actions: [
              IconButton(
                icon: AppIcons.search.svg(),
                onPressed: () {},
              ),
              IconButton(
                icon: AppIcons.more.svg(),
                onPressed: () {},
              ),
            ],
          ),
          body: state.status.isLoading
              ? const Center(child: CircularProgressIndicator())
              : state.status.isError
              ? const Center(child: Text('Xatolik mavjud'))
              : state.product == null
              ? const Center(child: Text('Mahsulot mavjud emas'))
              : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageSlider(
                    isNetwork: true,
                    images: state.product!.images,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.product!.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(children: _buildRatingStars(state.product!.rating)),
                  const SizedBox(height: 16),
                  Text(
                    "\$${state.product!.price}",
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Select Size',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.product!.sizes.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => setState(() {
                            _selectedSizeIndex = index;
                          }),
                          child: Container(
                            width: 48,
                            height: 48,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _selectedSizeIndex == index
                                    ? AppColors.primary
                                    : AppColors.textFiled,
                                width: 2,
                              ),
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${state.product!.sizes[index]}',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Select Color',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.product!.colors.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => setState(() {
                            _selectedColorIndex = index;
                          }),
                          child: Container(
                            width: 48,
                            height: 48,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: state.product!.colors[index].toColor(),
                              border: Border.all(
                                color: _selectedColorIndex == index
                                    ? AppColors.primary
                                    : AppColors.textFiled,
                                width: 2,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Specification',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.product!.description,
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Review Product",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CustomRichText(
                        onTab: () {
                          if (state.product?.reviewId != null) {
                            context.pushNamed(
                              Routes.review,
                              extra: ReviewProductArgs(state.product!.reviewId!),
                            );
                          }
                        },
                        text: 'See More',
                      ),
                    ],
                  ),
                  BlocBuilder<ReviewBloc, ReviewState>(
                    builder: (context, reviewState) {
                      print(reviewState.review.fulName);
                      print(  "${state.status} --------------------NImadir ---------------------------------------------------");
                      if (reviewState.status.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (reviewState.review.id == 0) {
                        return const Center(child: Text("No reviews"));
                      }
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.textFiled),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(reviewState.review.avatar),
                                  radius: 24,
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      reviewState.review.fulName,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: _buildRatingStars(reviewState.review.rating),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              reviewState.review.description,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              reviewState.review.dateTime,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                // context.goNamed(Routes.);
              },
              child: const Text(
                "Add To Cart",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
