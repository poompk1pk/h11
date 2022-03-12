class FoodModel {

  final dynamic id;
  final dynamic name;
  final dynamic price;
  final dynamic image_url;

  FoodModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        price = json['price'],
        image_url = json['image'];
}