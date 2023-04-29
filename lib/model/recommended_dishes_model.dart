class RecommendedDishesModel {
  final String name;
  final String image;
  final String description;
  final num rating;
  final num id;
  final List equipments;

  RecommendedDishesModel(
      {required this.name,
      required this.image,
      required this.description,
      required this.rating,
      required this.id,
      required this.equipments});

  factory RecommendedDishesModel.fromJson(Map<String, dynamic> json) {
    return RecommendedDishesModel(
        name: json['name'],
        image: json['image'],
        description: json['description'],
        rating: json['rating'],
        id: json['id'],
        equipments: json['equipments']);
  }
}
