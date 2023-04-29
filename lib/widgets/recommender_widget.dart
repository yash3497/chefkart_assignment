import 'package:chefkart_task/utils/colors.dart';
import 'package:flutter/material.dart';

import '../model/recommended_dishes_model.dart';
import '../screens/page2.dart';

class RecommendedWidegt extends StatelessWidget {
  final List<RecommendedDishesModel> dishes;
  const RecommendedWidegt({super.key, required this.dishes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 19),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Text('Recommended',
                      style: TextStyle(
                        color: CustomColor.blackText,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                  ),
                ],
              ),
              Container(
                width: 56,
                height: 22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: CustomColor.blackText,
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 4,
                      color: CustomColor.shadowColor,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text('Menu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          ListView.separated(
            itemCount: dishes.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Page2(
                          id: dishes[index].id,
                          description: dishes[index].description,
                          rating: dishes[index].rating,
                        ),
                      ),
                    );
                  },
                  child: DishCard(model: dishes[index]));
            },
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  height: 0.5,
                  color: CustomColor.shadowColor,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DishCard extends StatelessWidget {
  final RecommendedDishesModel model;
  const DishCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CardDetails(model: model),
        CardImage(model: model),
      ],
    );
  }
}

class CardImage extends StatelessWidget {
  const CardImage({
    super.key,
    required this.model,
  });

  final RecommendedDishesModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 78,
        ),
        Container(
          width: 92,
          height: 68,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(model.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 17,
          child: Container(
            width: 58,
            height: 21,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Colors.white,
              border: Border.all(color: CustomColor.orangeColor, width: 0.5),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 4,
                  color: CustomColor.shadowColor,
                ),
              ],
            ),
            child: Stack(
              children: const [
                Positioned(
                  top: 1,
                  right: 1,
                  child: Icon(
                    Icons.add,
                    color: CustomColor.orangeColor,
                    size: 8,
                  ),
                ),
                Center(
                  child: Text("Add",
                      style: TextStyle(
                        color: CustomColor.orangeColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CardDetails extends StatelessWidget {
  const CardDetails({
    super.key,
    required this.model,
  });

  final RecommendedDishesModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(model.name,
                style: const TextStyle(
                  color: CustomColor.blackText,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(
              width: 6,
            ),
            Image.asset("assets/icons/veg.png"),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 22,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: CustomColor.greenColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(model.rating.toString(),
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
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          height: 17,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListView.separated(
                itemCount: model.equipments.length,
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        "assets/icons/refrigerator.png",
                        height: 12,
                        width: 12,
                      ),
                      Text(
                        model.equipments[index],
                        style: const TextStyle(
                          color: CustomColor.blackText,
                          fontSize: 4,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 8,
                  );
                },
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 17,
                width: 0.5,
                color: CustomColor.greyColor,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Ingredients",
                    style: TextStyle(
                      color: CustomColor.blackText,
                      fontSize: 6,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "View list >",
                    style: TextStyle(
                      color: CustomColor.orangeColor,
                      fontSize: 5,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 9,
        ),
        Text(
          model.description,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            color: CustomColor.lightblack,
            fontSize: 8,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
