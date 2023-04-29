import 'package:chefkart_task/model/detail_food_model.dart';
import 'package:chefkart_task/utils/colors.dart';
import 'package:flutter/material.dart';

class IngredientsWidget extends StatelessWidget {
  final List<NQModel> vegetables;
  final List<NQModel> spices;
  final List<String> appliances;
  const IngredientsWidget(
      {super.key,
      required this.vegetables,
      required this.spices,
      required this.appliances});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 23),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ingredients",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              "For 2 People",
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.bold,
                color: CustomColor.textgreyColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              height: 3,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  "Vegetables (${vegetables.length})",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: ListView.separated(
                itemCount: vegetables.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return NQWidget(
                    vegetables: vegetables,
                    index: index,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 8,
                  );
                },
              ),
            ),
            // const SizedBox(
            //   height: 24,
            // ),
            Row(
              children: [
                Text(
                  "Spices (${spices.length})",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: ListView.separated(
                itemCount: spices.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return NQWidget(
                    vegetables: spices,
                    index: index,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 8,
                  );
                },
              ),
            ),
            // const SizedBox(
            //   height: 24,
            // ),
            const Text(
              "Appliances",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 95,
              child: ListView.separated(
                itemCount: appliances.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return AppliancesCard(
                    appliances: appliances,
                    index: index,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 21,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppliancesCard extends StatelessWidget {
  const AppliancesCard({
    super.key,
    required this.appliances,
    required this.index,
  });

  final List<String> appliances;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: CustomColor.cardColor,
      ),
      child: Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/fridge.png",
              width: 30,
              height: 55,
            ),
            Text(
              appliances[index],
              style: const TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.normal,
                color: CustomColor.blackText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NQWidget extends StatelessWidget {
  const NQWidget({
    super.key,
    required this.vegetables,
    required this.index,
  });

  final List<NQModel> vegetables;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(vegetables[index].name,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.normal,
              color: CustomColor.blackText,
            )),
        Text(vegetables[index].quantity,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.normal,
              color: CustomColor.blackText,
            )),
      ],
    );
  }
}
