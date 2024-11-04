import 'package:dio/dio.dart';
import 'package:e_commerce/features/auth/data/repository/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../router/app_routes.dart';

class WAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      backgroundColor: Colors.transparent,
      elevation: 10,
      bottomOpacity: 1,
      surfaceTintColor: Colors.transparent,

      title: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: AppIcons.search.svg(height: 16, width: 16),
              ),
              hintText: 'Search Product',
              hintStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: AppColors.textGreen,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.textFiled, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          padding: const EdgeInsets.only(left: 0),
          splashColor: AppColors.transparent,
          highlightColor: AppColors.transparent,
          hoverColor: AppColors.transparent,
          icon: AppIcons.favorite.svg(width: 26, height: 26),
          onPressed: () {
          context.pushNamed(Routes.favorite);
          },
        ),
        IconButton(
          padding: const EdgeInsets.only(right: 16),
          splashColor: AppColors.transparent,
          highlightColor: AppColors.transparent,
          hoverColor: AppColors.transparent,
          icon: AppIcons.notification.svg(),
          onPressed: () async{
            print(await ApiRepository(dio: Dio()).loadProducts());
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

