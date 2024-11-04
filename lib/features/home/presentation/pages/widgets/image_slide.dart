import 'package:flutter/material.dart';

import '../../../../../core/theme/app_color.dart';

class ImageSlider extends StatefulWidget {
  final List<String> images;

  const ImageSlider({super.key, required this.images});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
              currentImageIndex = index;

              });
            },
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Hero(
                tag: 'image',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    widget.images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.images.length,
                (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentImageIndex == index
                    ? AppColors.primary
                    : AppColors.textFiled,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
