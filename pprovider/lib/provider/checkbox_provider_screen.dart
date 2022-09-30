import 'package:flutter/material.dart';
import 'package:pprovider/models/drink.dart';
import 'package:pprovider/provider/drinks_provider.dart';
import 'package:pprovider/widgets/drinks_widget.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class CheckboxProviderScreen extends StatelessWidget {
  @override
  final List<Drink> drinks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cocktail Order"),
      ),
      body: Container(
        decoration: kMainBackgroundImage,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: kWhiteBackground,
              // TODO 7: Surround the Column with a Consumer widget
              // TODO 8: Implement the build function
              child: Consumer<DrinkProviders>(
                builder: (context, drinkProvi, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Drinks tonight",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    // TODO 9: Receive the drinks from the provider
                    ...drinkProvi.drinks
                        .map(
                          (drink) => DrinksWidget(
                            drink: drink,
                            onChanged: (bool? value) {
                              // TODO 11: call the selectDrink on the provider
                              drinkProvi.SelectDrink(drink, value ?? false);
                            },
                          ),
                        )
                        .toList(),
                    Text(
                      "The order is: ",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            // TODO 13.1: get the selectedDrinks from the provider
                            drinkProvi.SelectedDrinks[index].name,
                          ),
                        ),
                        // TODO 13.2: get the selectedDrinks from the provider
                        itemCount: drinkProvi.SelectedDrinks.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
