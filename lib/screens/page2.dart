import 'package:chefkart_task/api/api_calling.dart';
import 'package:chefkart_task/model/detail_food_model.dart';
import 'package:chefkart_task/utils/colors.dart';
import 'package:chefkart_task/widgets/ingrediants_widget.dart';
import 'package:chefkart_task/widgets/top_widget.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  final num id;
  final String description;
  final num rating;
  const Page2(
      {super.key,
      required this.id,
      required this.description,
      required this.rating});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  DetailFoodModel model = DetailFoodModel(
    name: 'Testing',
    timeToPrepare: '1',
    id: 0,
    ingredients: {},
  );
  List<NQModel> vegetables = [];
  List<NQModel> spices = [];
  List<String> appliances = [];

  _fetchData() async {
    Map data = await ApiCalling.page2Api(widget.id.toString());
    setState(() {
      model = DetailFoodModel.fromJson(data as Map<String, dynamic>);
      vegetables = model.ingredients['vegetables']
          .map<NQModel>((e) => NQModel.fromJson(e))
          .toList();
      spices = model.ingredients['spices']
          .map<NQModel>((e) => NQModel.fromJson(e))
          .toList();
      appliances = model.ingredients['appliances']
          .map<String>((e) => e['name'] as String)
          .toList();
      ;
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
      body: Stack(
        children: [
          Positioned(
            right: -20,
            top: 45,
            child: Container(
              width: 192,
              height: 192,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColor.lightorangeColor,
              ),
            ),
          ),
          Column(
            children: [
              TopWidget(
                model: model,
                description: widget.description,
                rating: widget.rating,
              ),
              Divider(
                height: 3,
                color: Colors.grey,
              ),
              IngredientsWidget(
                vegetables: vegetables,
                spices: spices,
                appliances: appliances,
              ),
            ],
          ),
          Positioned(
            right: -45,
            top: 135,
            child: Image.asset(
              "assets/icons/vegetables.png",
              width: 180,
              height: 150,
            ),
          ),
          Positioned(
            right: -80,
            top: 120,
            child: Image.asset(
              "assets/icons/spices.png",
              width: 180,
              height: 150,
            ),
          ),
        ],
      ),
    ));
  }
}
