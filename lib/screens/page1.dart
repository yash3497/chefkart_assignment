// ignore_for_file: prefer_const_constructors
import 'package:chefkart_task/api/api_calling.dart';
import 'package:chefkart_task/model/popular_dishes_model.dart';
import 'package:chefkart_task/model/recommended_dishes_model.dart';
import 'package:chefkart_task/utils/colors.dart';
import 'package:chefkart_task/widgets/app_bar.dart';
import 'package:chefkart_task/widgets/calender_widget.dart';
import 'package:chefkart_task/widgets/custom_tab.dart';
import 'package:chefkart_task/widgets/popular_dishes.dart';
import 'package:chefkart_task/widgets/recommender_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_floating_widget.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<PopularDishesModel> popularDishes = [];
  List<RecommendedDishesModel> recommendedDishes = [];

  _fetchData() async {
    Map data = await ApiCalling.page1Api();
    setState(() {
      popularDishes = data['popularDishes']
          .map<PopularDishesModel>((e) => PopularDishesModel.fromJson(e))
          .toList();
      recommendedDishes = data['dishes']
          .map<RecommendedDishesModel>(
              (e) => RecommendedDishesModel.fromJson(e))
          .toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const CustomFloatingWidget(),
        body: Column(
          children: [
            CustomAppBar(),
            CustomCalender(),
            CustomTab(),
            PopularDishes(
              popularDishes: popularDishes,
            ),
            Divider(
              height: 3,
              color: Colors.grey,
            ),
            RecommendedWidegt(
              dishes: recommendedDishes,
            ),
          ],
        ),
      ),
    );
  }
}
