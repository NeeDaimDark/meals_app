import 'package:flutter/material.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({
    super.key,

  });



  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  var _glutenFreeFilterSet= false;
  var _lactoseFreeFilterSet= false;
  var _vegatarianFilterSet= false;
  var _veganFilterSet= false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeFilterSet = activeFilters[Filter.glutenFree] ?? false;
    _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree] ?? false;
    _vegatarianFilterSet = activeFilters[Filter.vegetarian] ?? false;
    _veganFilterSet = activeFilters[Filter.vegan] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*drawer: MainDrawer(
        onSelectScreen:  (identifier){
          Navigator.of(context).pop();
          if (identifier == 'meals'){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder : (ctx) => const TabScreen(),
            ),
          );
          }
        },
        ),
*/
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) return;
          ref.read(filtersProvider.notifier).resetFilters({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegatarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
        child: Column(
          children:  [
            SwitchListTile(
                value: _glutenFreeFilterSet,
                onChanged: (isChecked){
                  setState(() {
                    _glutenFreeFilterSet = isChecked;
                  });
                },
                title: Text(
                  'Gluten-free',
                   style : Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                subtitle: Text(
                  'Only include gluten-free meals.',
                   style : Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding:  const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style : Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include lactose-free meals.',
                style : Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding:  const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegatarianFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _vegatarianFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style : Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include vegetarian meals.',
                style : Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding:  const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style : Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include vegan meals.',
                style : Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding:  const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
