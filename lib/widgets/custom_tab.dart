import 'package:chefkart_task/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTab extends StatefulWidget {
  const CustomTab({super.key});

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  var category = [
    'Indian',
    'Chinese',
    'Italian',
    'Mexican',
    'Japanese',
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 23),
      child: Container(
        height: 24,
        child: ListView.separated(
          itemCount: category.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                width: 76,
                height: 24,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: selectedIndex == index
                        ? CustomColor.lightorangeColor
                        : Colors.white,
                    border: Border.all(
                      color: selectedIndex == index
                          ? CustomColor.orangeColor
                          : CustomColor.lightgreyColor,
                    )),
                child: Center(
                  child: Text(
                    category[index],
                    style: TextStyle(
                      color: selectedIndex == index
                          ? CustomColor.orangeColor
                          : CustomColor.textgreyColor,
                      fontSize: 10,
                      fontWeight: selectedIndex == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 16,
            );
          },
        ),
      ),
    );
  }
}
