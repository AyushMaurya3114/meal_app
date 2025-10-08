import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/meals_provider.dart';

enum Filter {
  gluteenfree,
  lactosfree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter,bool>>{
  FiltersNotifier() : super({
    Filter.gluteenfree: false,
    Filter.lactosfree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  });

  void setFilter(Filter filter, bool isActive){
    state={
      ...state,
      filter: isActive
    };
  }

  void setFilters(Map<Filter,bool> choosenFilter){
    state=choosenFilter;
  }
}

final filterProvider= StateNotifierProvider<FiltersNotifier,Map<Filter,bool>>
((ref){
  return FiltersNotifier();
});

final filterMealsProvider=Provider((ref){
  final meals=ref.watch(mealsProvider);
  final activeFilters=ref.watch(filterProvider);
  return meals.where((meal) {
      if (activeFilters[Filter.gluteenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactosfree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }
    ).toList();
});