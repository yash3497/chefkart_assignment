class PopularDishesModel {
  final String image;
  final String name;
  final num id;

  PopularDishesModel(
      {required this.image, required this.name, required this.id});

  factory PopularDishesModel.fromJson(Map<String, dynamic> json) {
    return PopularDishesModel(
      image: json['image'],
      name: json['name'],
      id: json['id'],
    );
  }
}
