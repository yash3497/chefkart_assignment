// ignore_for_file: prefer_const_constructors
import 'package:chefkart_task/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCalender extends StatelessWidget {
  const CustomCalender({super.key});

  @override
  Widget build(BuildContext context) {
    var todayDate = DateFormat('dd MMM yyyy').format(DateTime.now());
    var currentTime = DateFormat('hh:mm a').format(DateTime.now());
    var futureTime =
        DateFormat('hh:mm a').format(DateTime.now().add(Duration(hours: 2)));
    return Container(
      width: double.infinity,
      height: 105,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 42,
            color: CustomColor.blackText,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 21),
            child: Container(
              width: double.infinity,
              height: 63,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 4,
                      color: CustomColor.shadowColor),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/date.png",
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          todayDate,
                          style: TextStyle(
                            color: CustomColor.blackText,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 26,
                      width: 0.5,
                      color: CustomColor.greyColor,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/time.png",
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "$currentTime-$futureTime",
                          style: TextStyle(
                            color: CustomColor.blackText,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
