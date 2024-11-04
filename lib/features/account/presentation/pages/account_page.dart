import 'package:e_commerce/core/theme/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../router/app_routes.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: const Text(
          "Account",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          const Divider(
            color: AppColors.textFiled,
            height: 2,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    context.pushNamed(Routes.profile);
                  },
                  splashColor: AppColors.textFiled,
                  highlightColor: AppColors.textFiled,
                  hoverColor: AppColors.transparent,
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    color: AppColors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        AppIcons.iconProfile.svg(width: 20, height: 20),
                        const SizedBox(width: 16),
                        const Text(
                          "Profile",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.pushNamed(Routes.order);
                  },
                  splashColor: AppColors.textFiled,
                  highlightColor: AppColors.textFiled,
                  hoverColor: AppColors.transparent,
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    color: AppColors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        AppIcons.iconOrder.svg(width: 18, height: 18),
                        const SizedBox(width: 16),
                        const Text(
                          "Order",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  splashColor: AppColors.textFiled,
                  highlightColor: AppColors.textFiled,
                  hoverColor: AppColors.transparent,
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    color: AppColors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        AppIcons.iconAddress.svg(width: 15, height: 20),
                        const SizedBox(width: 16),
                        const Text(
                          "Address",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  splashColor: AppColors.textFiled,
                  highlightColor: AppColors.textFiled,
                  hoverColor: AppColors.transparent,
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    color: AppColors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        AppIcons.payment.svg(width: 20, height: 14),
                        const SizedBox(width: 16),
                        const Text(
                          "Payment",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
