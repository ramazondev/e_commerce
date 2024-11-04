import 'package:e_commerce/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../router/app_routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashColor: AppColors.transparent,
          highlightColor: AppColors.transparent,
          hoverColor: AppColors.transparent,
          icon: AppIcons.arrow.svg(width: 26, height: 26),
          onPressed: () {
            context.go(Routes.account);
          },
        ),
        backgroundColor: AppColors.transparent,
        title: const Text(
          "Profile",
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
            padding: const EdgeInsets.only(left: 16.0, top: 16),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.changeName);
                  },
                  child: const Row(
                    children: [
                      Image(
                        width: 60,
                        height: 60,
                        image: AssetImage(
                          AppImages.userOne,
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Maximus Gold",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text("@derlaxy",
                              style: TextStyle(
                                color: AppColors.textGreen,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                WCustomProfile(
                  widget: AppIcons.gender.svg(width: 12, height: 20),
                  info: 'Gender',
                  text: 'Male',
                  onTab: () {
                    context.pushNamed(Routes.gender);
                  },
                ),
                WCustomProfile(
                  widget: AppIcons.birthday.svg(width: 18, height: 18),
                  info: 'Birthday',
                  text: '12-12-2000',
                  onTab: () {
                    context.pushNamed(Routes.birthday);
                  },
                ),
                WCustomProfile(
                  widget: AppIcons.email.svg(width: 20, height: 15.5),
                  info: 'Email',
                  text: 'Derlaxy@yahoo.com',
                  onTab: () {
                    context.pushNamed(Routes.email);
                  },
                ),
                WCustomProfile(
                  widget: AppIcons.phone.svg(width: 18, height: 22),
                  info: 'Phone Number',
                  text: '(307) 555-0133',
                  onTab: () {
                    context.pushNamed(Routes.phoneNumber);
                  },
                ),
                WCustomProfile(
                  widget: AppIcons.iconPassword.svg(width: 20, height: 20),
                  info: 'Change Password',
                  text: '•••••••••••••••••',
                  onTab: () {
                    context.pushNamed(Routes.password);

                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WCustomProfile extends StatelessWidget {
  final Widget widget;
  final String info;
  final String text;
  final Function() onTab;

  const WCustomProfile({
    super.key,
    required this.info,
    required this.text,
    required this.onTab,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              widget,
              const SizedBox(width: 16),
              Text(
                info,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: AppColors.textGreen,
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                splashColor: AppColors.transparent,
                highlightColor: AppColors.transparent,
                hoverColor: AppColors.transparent,
                icon: AppIcons.arrowRight.svg(width: 26, height: 26),
                onPressed: onTab,
              )
            ],
          )
        ],
      ),
    );
  }
}
