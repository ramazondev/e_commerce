import 'package:e_commerce/core/theme/app_color.dart';
import 'package:e_commerce/features/home/presentation/pages/widgets/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../router/app_routes.dart';

class CustomFavoritePage extends StatelessWidget {
  const CustomFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text(
            "Favorite Product",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            )
        ),
        elevation: 0,
        backgroundColor: AppColors.transparent,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              color: AppColors.textFiled,
              height: 2,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  CustomGridView(
                    icon: AppIcons.delete.svg(),
                    onTab: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
