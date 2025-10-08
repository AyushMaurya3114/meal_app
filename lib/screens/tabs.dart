import 'package:flutter/material.dart';
import 'package:meal_app/providers/filters_provider.dart';
// import 'package:meal_app/data/dummy_data.dart';  // since we have used riverpod data is getting from provider
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filterscreen.dart';
import 'package:meal_app/screens/meals.dart';
// import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meal_app/providers/meals_provider.dart';
import 'package:meal_app/providers/favorites_provider.dart';


const kInitialFilter = {
  Filter.gluteenfree: false ,
  Filter.lactosfree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  // final List<Meal> _favouriteMeal = [];  // we have used provider instead
  // Map<Filter, bool> selectedFilter = kInitialFilter;

  // void _toggleMealFavouriteStatus(Meal meal) {
  //   final isExisting = _favouriteMeal.contains(meal);
  //   if (isExisting) {
  //     setState(() {
  //       _favouriteMeal.remove(meal);
  //       _showInfoMessage("Meal is no longer a favourite");
  //     });
  //   } else {
  //     setState(() {
  //       _favouriteMeal.add(meal);
  //       _showInfoMessage("Marked as favourite");
  //     });
  //   }
  // }

  int _selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifiers) async {
    Navigator.of(context).pop();
    if (identifiers == 'filters') {
          await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
        builder: (ctx) => const FilterScreen(),
      ));
//       setState(() {               // we have addd provider
//   selectedFilter = result ?? kInitialFilter;
// });
      // print(selectedFilter);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final meals=ref.watch(mealsProvider); // set up listners to our provider (watch for listning)
    // final activeFilters= ref.watch(filterProvider);
    // final availableMeal = meals.where((meal) {
    //   if (activeFilters[Filter.gluteenfree]! && !meal.isGlutenFree) {
    //     return false;
    //   }
    //   if (activeFilters[Filter.lactosfree]! && !meal.isLactoseFree) {
    //     return false;
    //   }
    //   if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
    //     return false;
    //   }
    //   if (activeFilters[Filter.vegan]! && !meal.isVegan) {
    //     return false;
    //   }
    //   return true;
    // }
    // ).toList();

    final availableMeal=ref.watch(filterMealsProvider);

    Widget activePage = Categories(
      // onTogglefavourite: _toggleMealFavouriteStatus,
      availableMeal: availableMeal
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals= ref.watch(favoriteMealProvider);
      activePage = MealScreen(
        meals: favoriteMeals,
        title: null,
        // onTogglefavourite: _toggleMealFavouriteStatus,
      );
      activePageTitle = 'Your Favourites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourite')
        ],
      ),
    );
  }
}
