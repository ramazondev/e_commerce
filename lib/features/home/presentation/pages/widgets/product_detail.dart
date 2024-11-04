import 'package:e_commerce/core/theme/app_images.dart';
import 'package:e_commerce/features/home/presentation/pages/widgets/image_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../router/app_routes.dart';

class ProductDetail extends StatelessWidget {
  final String name;

  const ProductDetail({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("{name}",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            )),
        elevation: 0,
        backgroundColor: AppColors.transparent,
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 16),
            splashColor: AppColors.transparent,
            highlightColor: AppColors.transparent,
            hoverColor: AppColors.transparent,
            icon: AppIcons.search.svg(),
            onPressed: () {
              // context.go(Routes.home);
            },
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 16),
            splashColor: AppColors.transparent,
            highlightColor: AppColors.transparent,
            hoverColor: AppColors.transparent,
            icon: AppIcons.more.svg(),
            onPressed: () {
              // context.go(Routes.home);
            },
          ),
        ],
        leading: IconButton(
          padding: const EdgeInsets.only(right: 16),
          splashColor: AppColors.transparent,
          highlightColor: AppColors.transparent,
          hoverColor: AppColors.transparent,
          icon: AppIcons.arrow.svg(),
          onPressed: () {
            context.go(Routes.home);
          },
        ),
      ),
      body: const Column(
        children: [
          ImageSlider(
            images: [
              AppImages.imageFon1,
              AppImages.imageFon2,
              AppImages.imageFon3,
              AppImages.imageFon1,
            ],
          ),
        ],
      ),
    );
  }
}
