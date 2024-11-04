import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/theme/app_color.dart';
import '../../../../../../core/theme/app_icons.dart';
import '../../../../../../router/app_routes.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  String? selectedGender;
  bool isDropdownVisible = false;

  void toggleDropdown() {
    setState(() {
      isDropdownVisible = !isDropdownVisible;
    });
  }

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
            context.go(Routes.profile);
          },
        ),
        backgroundColor: AppColors.transparent,
        title: const Text(
          "Gender",
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
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Choose Gender",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: toggleDropdown,
                      child: AppIcons.arrowBottom.svg(),
                    ),
                    hintText: selectedGender ?? 'Select Gender',
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: AppColors.textGreen,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.textFiled, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.primary, width: 2),
                    ),
                  ),
                ),
                if (isDropdownVisible)
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.textFiled, width: 2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownMenuItem(
                          value: 'Male',
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGender = 'Male';
                                isDropdownVisible = false;
                              });
                            },
                            child: const Text('Male', style: TextStyle(fontFamily: 'Poppins', color: AppColors.textGreen, fontSize: 12)),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Female',
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGender = 'Female';
                                isDropdownVisible = false;
                              });
                            },
                            child: const Text('Female', style: TextStyle(fontFamily: 'Poppins', color: AppColors.textGreen, fontSize: 12)),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Other',
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGender = 'Other';
                                isDropdownVisible = false;
                              });
                            },
                            child: const Text('Other', style: TextStyle(fontFamily: 'Poppins', color: AppColors.textGreen, fontSize: 12)),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {
            context.go(Routes.profile);
          },
          child: const Text(
            "Naxt",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
