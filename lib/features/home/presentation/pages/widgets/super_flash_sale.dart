import 'package:e_commerce/core/theme/app_color.dart';
import 'package:e_commerce/core/theme/app_icons.dart';
import 'package:e_commerce/features/home/presentation/pages/widgets/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_images.dart';
import '../../../../../router/app_routes.dart';

class SuperFlashSale extends StatelessWidget {
  const SuperFlashSale({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Super Flash Sale',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          splashColor: AppColors.transparent,
          highlightColor: AppColors.transparent,
          hoverColor: AppColors.transparent,
          icon: AppIcons.arrow.svg(width: 26, height: 26),
          onPressed: () {
            context.pushNamed(Routes.home);
          },
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 16),
            splashColor: AppColors.transparent,
            highlightColor: AppColors.transparent,
            hoverColor: AppColors.transparent,
            icon: AppIcons.search.svg(),
            onPressed: () {},
          ),
        ],
      ),
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
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Hero(
                            tag: 'image',
                            child: Image.asset(
                              AppImages.imageFon1,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
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
                  const SizedBox(height: 8),
                  const CustomGridView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
