import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_fruit/data/fruit.dart';
import 'package:flutter_fruit/data/local_fruit.dart';

class AppState extends Model {
  List<Fruit> _fruits;
  AppState(): _fruits = LocalFruitProvider.fruits;

  List<Fruit> get allFruits => List<Fruit>.from(_fruits);

  Fruit getFruit(int id) => _fruits.singleWhere((v) => v.id == id);

  void setFavorite(int id, bool isFavorite) {
    Fruit f = getFruit(id);
    f.isFavorite = isFavorite;
    notifyListeners();
  }
}
