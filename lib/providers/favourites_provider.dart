import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:meals_app/models/meal.dart';


class FavouritesMealsNotifier extends StateNotifier <List<Meal>> {
  FavouritesMealsNotifier() : super([]);

  bool  toggleMealFavoriteStatus(Meal meal) {
    final isExisting = state.contains(meal);
    if (isExisting) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouritesMealsProvider = StateNotifierProvider((ref){
  return FavouritesMealsNotifier();
});


