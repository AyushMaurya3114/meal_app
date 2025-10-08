import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/categories_grid_item.dart';

class Categories extends StatefulWidget {
  const Categories({super.key,required this.availableMeal});

  final List<Meal> availableMeal;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> with SingleTickerProviderStateMixin{

  late AnimationController _animationController; // late means will be initialize latter

  @override
  void initState() {
    super.initState();

    _animationController=AnimationController(   //explicit animation user define
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
      );
      _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    void _selectcategory(BuildContext context, Category category) {
      final filteredList = widget.availableMeal
          .where((meal) => meal.categories.contains(category.id))
          .toList();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => MealScreen(
                title: category.title,
                meals: filteredList,
              ))); // altertive   Navigator.push(context, route)
    }

    return AnimatedBuilder(
      animation: _animationController,       // we can add child paarammeter to for widget that is part of animated widget but not animated 
      child:  GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        // availableCategories.map((category)=> CategoriesGridItem(category: category)).toList()  alternative
        for (final category in availableCategories)
          CategoriesGridItem(
              category: category,
              onSelectCategory: () {
                _selectcategory(context, category);
              })
      ],
    ),
      builder: (context,child)=> SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut))
        ,child: child,)
      );
  }
}
