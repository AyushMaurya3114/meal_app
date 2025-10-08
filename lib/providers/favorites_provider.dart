import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';
// for static simple 'Provider' is fine but for dynamicaly changinfg data 'StateNotifierProvider' is used
// need calss for changing data
class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifier() : super([]);


// statenotifier doesnt allow to edit value we need to create new one always
  bool toggleMealFavouriteStatus(Meal meal){ 
    final mealIsFavorite = state.contains(meal);

    if(mealIsFavorite){
      state = state.where((m)=>m.id != meal.id).toList();
      return false;
    }else{
      state= [...state,meal];
      return true;
    }
  }
}

final favoriteMealProvider= StateNotifierProvider<FavoriteMealsNotifier,List<Meal>>((ref){
  return FavoriteMealsNotifier();
});
