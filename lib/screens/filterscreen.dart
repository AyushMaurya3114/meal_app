import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filters_provider.dart';
class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});
//   @override
//   ConsumerState<FilterScreen> createState() {
//     return _FilterScreenState();
//   }
// }

// class _FilterScreenState extends ConsumerState<FilterScreen> {
//   var _gluteenFreeFilterTest = false;
//   var _lactosFreeFilterTest = false;
//   var _vegetarianFilterTest = false;
//   var _veganFilterTest = false;

//   @override
//   void initState() {
//     super.initState();
//     final activeFilter=ref.read(filterProvider);
//       _gluteenFreeFilterTest=activeFilter[Filter.gluteenfree]!;
//       _lactosFreeFilterTest=activeFilter[Filter.lactosfree]!;
//       _veganFilterTest=activeFilter[Filter.vegan]!;
//       _vegetarianFilterTest=activeFilter[Filter.vegetarian]!;
//   }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters= ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filter"),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier){
      //   Navigator.of(context).pop();
      //   if(identifier=='meals'){
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
      //       return const TabsScreen();
      //     }));
      //   }
      // },),
      // body: PopScope(
      //   canPop: false,
      //   onPopInvokedWithResult: (bool didPop, dynamic result) {
      //     if (didPop) return;
      //     ref.read(filterProvider.notifier).setFilters({
      //       Filter.gluteenfree: _gluteenFreeFilterTest,
      //       Filter.lactosfree: _lactosFreeFilterTest,
      //       Filter.vegetarian: _vegetarianFilterTest,
      //       Filter.vegan: _veganFilterTest,
      //     });
      //     Navigator.of(context).pop();
      //   },
      //   child: 


      body: Column(
          children: [
            SwitchListTile(
              value: activeFilters[Filter.gluteenfree]!,
              onChanged: (isChecked) {
                ref.read(filterProvider.notifier).setFilter(Filter.gluteenfree, isChecked);
                },
              title: Text(
                "Gluten-free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: const Text("only include gluteen free meals"),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),

            SwitchListTile(
              value: activeFilters[Filter.lactosfree]!,
              onChanged: (isChecked) {
                ref.read(filterProvider.notifier).setFilter(Filter.lactosfree, isChecked);
                },
              title: Text(
                "Lactos-free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: const Text("only include lactos free meals"),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            
            SwitchListTile(
              value: activeFilters[Filter.vegetarian]!,
              onChanged: (isChecked) {
                ref.read(filterProvider.notifier).setFilter(Filter.vegetarian, isChecked);
                },
              title: Text(
                "Vegetarian",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: const Text("only include Vegetarian meals"),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),

            SwitchListTile(
              value: activeFilters[Filter.vegan]!,
              onChanged: (isChecked) {
                ref.read(filterProvider.notifier).setFilter(Filter.vegan, isChecked);
                },
              title: Text(
                "Vegan",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: const Text("only include Veganmeals"),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            )
          ],
        ),
      );
  }
}
