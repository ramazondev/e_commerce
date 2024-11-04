import 'package:e_commerce/core/theme/app_icons.dart';
import 'package:e_commerce/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import '../../../../../core/theme/app_color.dart';

class CustomGridView extends StatelessWidget {
  final Widget? icon;
  final Function()? onTab;

  const CustomGridView({super.key, this.icon, this.onTab});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final images = [
      AppImages.imageShoes,
      AppImages.imagePause1,
      AppImages.imagePause2,
      AppImages.imageShoes2,
    ];
    final titles = [
      "FS - Nike Air Max 270 React...",
      "FS - Purse Bag Deluxe...",
      "FS - Stylish Handbag...",
      "FS - Running Shoes Limited...",
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return SizedBox(
          width: size.width*0.45,
          height: size.width*0.35,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 2, color: AppColors.textFiled),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      images[index],
                      width: double.infinity,
                      height: size.width * 0.25,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    titles[index],
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const SizedBox(height: 10),
                      for (int i = 0; i < 5; i++)
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: AppIcons.starYel.svg(
                            width: size.width*0.025,
                            height: size.width*0.025,
                            color: i < 4 ? null : AppColors.textGreen,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "\$299,43",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "\$534,33",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: AppColors.textGreen,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const Text(
                        "24% Off",
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryRed,
                        ),
                      ),
                      if (icon != null)
                        IconButton(
                          splashColor: AppColors.transparent,
                          highlightColor: AppColors.transparent,
                          hoverColor: AppColors.transparent,
                          icon: icon!,
                          onPressed: onTab,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
