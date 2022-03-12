import 'package:h11/models/food.dart';

class StoreModel {
  List<FoodModel> foodList = [];


  loadJson(Map<String, dynamic> json) {
    Iterable list = json['data'];

    List<FoodModel> foods = list.map((i) =>
        FoodModel.fromJson(i)).toList();

    foodList.addAll(foods);
  }

}