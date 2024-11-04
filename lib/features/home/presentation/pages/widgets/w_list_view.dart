import 'package:flutter/material.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_icons.dart';

class WListView extends StatelessWidget {
  const WListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {'icon': AppIcons.shirt, 'label': 'Man Shirt', 'route': '/manShirt'},
      {'icon': AppIcons.dress, 'label': 'Dress', 'route': '/dress'},
      {'icon': AppIcons.equipment, 'label': 'Man Work Equipment', 'route': '/equipment'},
      {'icon': AppIcons.womanBag, 'label': 'Woman Bag', 'route': '/womanBag'},
      {'icon': AppIcons.manPants, 'label': 'Man Pants', 'route': '/manPants'},
      {'icon': AppIcons.manShoes, 'label': 'Man Shoes', 'route': '/manShoes'},
      {'icon': AppIcons.manTShirt, 'label': 'Man T-Shirt', 'route': '/manTShirt'},
      {'icon': AppIcons.manUnder, 'label': 'Man Underwear', 'route': '/manUnderwear'},
      {'icon': AppIcons.womanTShirt, 'label': 'Woman T-Shirt', 'route': '/womanTShirt'},
      {'icon': AppIcons.womanPants, 'label': 'Woman Pants', 'route': '/womanPants'},
      {'icon': AppIcons.womanShoes, 'label': 'High Heels', 'route': '/womanShoes'},
      {'icon': AppIcons.womenSkirt, 'label': 'Skirt', 'route': '/skirt'},
      {'icon': AppIcons.bikini, 'label': 'Bikini', 'route': '/bikini'},
    ];

    return SizedBox(
      height: 130,
      child: ListView.builder(
        // padding: EdgeInsets.all(0),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              // context.push(item['route']!);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.textFiled, width: 2),
                      ),
                      child: Center(child: item['icon']!.svg(height: 20, width: 20)),
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
            ),
          );
        },
      ),
    );
  }
}

