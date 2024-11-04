import 'package:e_commerce/core/theme/app_color.dart';
import 'package:e_commerce/core/theme/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/main_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(
                  color: AppColors.textFiled,
                  height: 2,
                  thickness: 2,
                ),
                const SizedBox(height: 10),
                Theme(
                  data: Theme.of(context).copyWith(
                    splashColor: AppColors.transparent,
                    highlightColor: AppColors.transparent,
                    hoverColor: AppColors.transparent,
                  ),
                  child: BottomNavigationBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    currentIndex: navigationShell.currentIndex,
                    onTap: (index) {
                      navigationShell.goBranch(
                        index,
                        initialLocation: index == navigationShell.currentIndex,
                      );
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: AppIcons.home.svg(),
                        activeIcon: AppIcons.home.svg(color: AppColors.primary),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: AppIcons.explore.svg(color: AppColors.textGreen),
                        activeIcon: AppIcons.explore.svg(color: AppColors.primary),
                        label: 'Explore',
                      ),
                      BottomNavigationBarItem(
                        icon: AppIcons.cart.svg(),
                        activeIcon: AppIcons.cart.svg(color: AppColors.primary),
                        label: 'Cart',
                      ),
                      BottomNavigationBarItem(
                        icon: AppIcons.offer.svg(),
                        activeIcon: AppIcons.offer.svg(color: AppColors.primary),
                        label: 'Offer',
                      ),
                      BottomNavigationBarItem(
                        icon: AppIcons.account.svg(),
                        activeIcon: AppIcons.account.svg(color: AppColors.primary),
                        label: 'Account',
                      ),
                    ],
                    selectedItemColor: AppColors.primary,
                    selectedLabelStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 13),
                    unselectedItemColor: AppColors.textGreen,
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 13,
                    ),
                    type: BottomNavigationBarType.fixed,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
