// ignore_for_file: prefer_const_constructors

import 'package:chefkart_task/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: CustomColor.greyColor,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Select Dishes',
              style: TextStyle(
                  color: CustomColor.blackText,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
