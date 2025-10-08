import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';

class CategoriesGridItem extends StatelessWidget{
  const CategoriesGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory
  });

  final Category category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: onSelectCategory,
      borderRadius: BorderRadius.circular(16),
      child: Container( 
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.55),
            category.color.withOpacity(0.9)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface, //onBackground depreciated
          ),
        ),
      ),
    );
  }
}