import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../bloc/review_bloc/review_bloc.dart';

class ReviewProductArgs {
  final String reviewId;

  const ReviewProductArgs(this.reviewId);
}

class ReviewProduct extends StatelessWidget {
  const ReviewProduct({super.key});

  List<Widget> _buildRatingStars(int rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      if (i <= rating) {
        stars.add(AppIcons.starYel.svg(width: 16, height: 16));
      } else {
        stars.add(AppIcons.starGr.svg(width: 16, height: 16));
      }
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Review',
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
            context.pop();
          },
        ),
      ),
      body: Column(
        children: [
          const Divider(
            color: AppColors.textFiled,
            height: 2,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
              child: BlocBuilder<ReviewBloc, ReviewState>(
                builder: (context, state) {
                  if (state.status.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state.reviews.isEmpty) {
                    return const Center(child: Text("No reviews"));
                  }
                  return ListView.builder(
                    itemCount: state.reviews.length,
                    itemBuilder: (context, index) {
                      final review = state.reviews[index];
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.textFiled),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(review.avatar),
                                  radius: 24,
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      review.fulName,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: _buildRatingStars(review.rating),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              review.description,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              review.dateTime,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
