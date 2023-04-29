import 'dart:ui';

import 'package:chefkart_task/model/detail_food_model.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class TopWidget extends StatelessWidget {
  final DetailFoodModel model;
  final String description;
  final num rating;
  const TopWidget(
      {super.key,
      required this.model,
      required this.description,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: CustomColor.greyColor,
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                model.name,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 8),
                child: Container(
                  width: 22,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: CustomColor.greenColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(rating.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 6,
                            fontWeight: FontWeight.w600,
                          )),
                      const Icon(
                        Icons.star,
                        size: 6,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          Row(
            children: [
              Image.asset(
                "assets/icons/clock.png",
                width: 14,
                height: 14,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                model.timeToPrepare,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
