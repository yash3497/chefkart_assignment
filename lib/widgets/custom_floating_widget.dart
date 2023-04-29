import 'package:chefkart_task/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomFloatingWidget extends StatelessWidget {
  const CustomFloatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width * .7,
        decoration: BoxDecoration(
          color: CustomColor.blackText,
          borderRadius: BorderRadius.circular(7),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 9,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Image.asset(
                "assets/icons/coffee.png",
                width: 16,
                height: 16,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("3 food items selected",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
