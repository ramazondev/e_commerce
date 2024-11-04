import 'package:e_commerce/features/home/presentation/pages/widgets/w_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_icons.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: WAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: AppColors.textFiled,
            height: 2,
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                WWrap(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WWrap extends StatelessWidget {
  const WWrap({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> manItems = [
      {'icon': AppIcons.shirt, 'label': 'Man Shirt', 'route': '/manShirt'},
      {'icon': AppIcons.equipment, 'label': 'Man Work Equipment', 'route': '/equipment'},
      {'icon': AppIcons.manPants, 'label': 'Man Pants', 'route': '/manPants'},
      {'icon': AppIcons.manShoes, 'label': 'Man Shoes', 'route': '/manShoes'},
      {'icon': AppIcons.manTShirt, 'label': 'Man T-Shirt', 'route': '/manTShirt'},
      {'icon': AppIcons.manUnder, 'label': 'Man Underwear', 'route': '/manUnderwear'},
    ];

    final List<Map<String, String>> womanItems = [
      {'icon': AppIcons.dress, 'label': 'Dress', 'route': '/dress'},
      {'icon': AppIcons.womanBag, 'label': 'Woman Bag', 'route': '/womanBag'},
      {'icon': AppIcons.womanTShirt, 'label': 'Woman T-Shirt', 'route': '/womanTShirt'},
      {'icon': AppIcons.womanPants, 'label': 'Woman Pants', 'route': '/womanPants'},
      {'icon': AppIcons.womanShoes, 'label': 'High Heels', 'route': '/womanShoes'},
      {'icon': AppIcons.womenSkirt, 'label': 'Skirt', 'route': '/skirt'},
      {'icon': AppIcons.bikini, 'label': 'Bikini', 'route': '/bikini'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Man Fashion",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 21,
          children: manItems.map((item) {
            return GestureDetector(
              onTap: () {
                // context.push(item['route']!);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.textFiled, width: 2),
                      ),
                      child: Center(
                        child: item['icon']!.svg(height: 20, width: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 60,
                    height: 40,
                    child: Text(
                      item['label']!,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textGreen,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),

        const Text(
          "Woman Fashion",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),

        Wrap(
          spacing: 21,
          children: womanItems.map((item) {
            return GestureDetector(
              onTap: () {
                // context.push(item['route']!);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.textFiled, width: 2),
                      ),
                      child: Center(
                        child: item['icon']!.svg(height: 20, width: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 60,
                    height: 40,
                    child: Text(
                      item['label']!,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textGreen,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
