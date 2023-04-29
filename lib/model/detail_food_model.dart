class DetailFoodModel {
  final String name;
  final String timeToPrepare;
  final num id;
  final Map ingredients;

  DetailFoodModel({
    required this.name,
    required this.timeToPrepare,
    required this.id,
    required this.ingredients,
  });

  factory DetailFoodModel.fromJson(Map<String, dynamic> json) {
    return DetailFoodModel(
      name: json['name'],
      timeToPrepare: json['timeToPrepare'],
      id: json['id'],
      ingredients: json['ingredients'],
    );
  }
}

class NQModel {
  final String name;
  final String quantity;

  NQModel({
    required this.name,
    required this.quantity,
  });

  factory NQModel.fromJson(Map<String, dynamic> json) {
    return NQModel(
      name: json['name'],
      quantity: json['quantity'],
    );
  }
}
