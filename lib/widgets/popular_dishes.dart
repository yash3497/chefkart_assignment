import 'package:chefkart_task/model/popular_dishes_model.dart';
import 'package:chefkart_task/utils/colors.dart';
import 'package:flutter/material.dart';

class PopularDishes extends StatelessWidget {
  final List<PopularDishesModel> popularDishes;
  const PopularDishes({super.key, required this.popularDishes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 21),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Popular Dishes',
              style: TextStyle(
                color: CustomColor.blackText,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 63,
              child: ListView.separated(
                itemCount: popularDishes.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return StoryCard(
                    popularDishes: popularDishes,
                    index: index,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 8,
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

class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    required this.popularDishes,
    required this.index,
  });

  final List<PopularDishesModel> popularDishes;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      width: 63,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: index != 0 ? CustomColor.orangeColor : Colors.white)),
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 57,
              width: 57,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    popularDishes[index].image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              popularDishes[index].name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
