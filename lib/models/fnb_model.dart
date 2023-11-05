import 'dart:convert';

class FoodnDrinks {
  final String name;
  final String imagePath;
  final String price;
  final String id;

  FoodnDrinks({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.id,
  });

  factory FoodnDrinks.fromJson(Map<String, dynamic> json) {
    return FoodnDrinks(
      name: json["name"],
      imagePath: json["imagePath"],
      price: json["price"],
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "imagePath": imagePath,
        "price": price,
        "id": id,
      };
}

List<FoodnDrinks> foodnDrinksFromJson(String str) {
  final jsonData = json.decode(str);
  List<FoodnDrinks> foodnDrinksList = [];

  for (var item in jsonData) {
    foodnDrinksList.add(FoodnDrinks.fromJson(item));
  }

  return foodnDrinksList;
}

String foodnDrinksToJson(List<FoodnDrinks> data) {
  List<Map<String, dynamic>> jsonDataList =
      data.map((x) => x.toJson()).toList();
  return json.encode(jsonDataList);
}
