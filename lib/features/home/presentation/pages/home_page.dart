import 'package:e_commerce/core/theme/app_images.dart';
import 'package:e_commerce/features/home/presentation/pages/widgets/custom_grid_view.dart';
import 'package:e_commerce/features/home/presentation/pages/widgets/image_slide.dart';
import 'package:e_commerce/features/home/presentation/pages/widgets/w_list_view.dart';
import 'package:e_commerce/features/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'widgets/w_app_bar.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../router/app_routes.dart';
import '../../../auth/data/repository/api_repository.dart';
import '../../../auth/data/repository/fake_repository.dart';
import '../../../widgets/custom_rich_text.dart';
import '../../bloc/product_bloc/product_bloc.dart';

class HomePage extends StatelessWidget {
  final FakeProductRepository apiRepository = const FakeProductRepoImpl(ApiService.instance);

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(const FakeProductRepoImpl(ApiService.instance))..add(const GetProductsEvent()),
      child: Scaffold(
        appBar: const WAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Divider(
                color: AppColors.textFiled,
                height: 2,
                thickness: 2,
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ImageSlider(
                      images: [
                        AppImages.imageFon1,
                        AppImages.imageFon2,
                        AppImages.imageFon3,
                        AppImages.imageFon2,
                        AppImages.imageFon1,
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Category",
                          style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700),
                        ),
                        CustomRichText(
                          onTab: () {},
                          text: 'More Category',
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const WListView(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Flash Sale",
                          style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700),
                        ),
                        CustomRichText(
                          onTab: () {
                            context.goNamed(Routes.flashSale);
                          },
                          text: 'See More',
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    BlocBuilder<ProductBloc, ProductState>(
                      builder: (context, state) {
                        if (state.status.isLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state.status.isError) {
                          return const Center(child: Text('Error loading products'));
                        } else if (state.products.isEmpty) {
                          return const Center(child: Text('No products available'));
                        }
                        return CustomListView(products: state.products);
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Mega Sale",
                          style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700),
                        ),
                        CustomRichText(
                          onTab: () {},
                          text: 'See More',
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    BlocBuilder<ProductBloc, ProductState>(
                      builder: (context, state) {
                        if (state.status.isLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state.status.isError) {
                          return const Center(child: Text('Error loading products'));
                        } else if (state.products.isEmpty) {
                          return const Center(child: Text('No products available'));
                        }
                        return CustomListView(products: state.products);
                      },
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 4,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              AppImages.imageFon1,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          const Positioned(
                            bottom: 76,
                            left: 24,
                            child: Text(
                              'Recommended\nProduct',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const Positioned(
                            bottom: 46,
                            left: 24,
                            child: Text(
                              'We recommend the best for you',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const CustomGridView(
                      product: [],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}