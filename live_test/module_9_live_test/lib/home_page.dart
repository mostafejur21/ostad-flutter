import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_9_live_test/recipes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipes = [];

  @override
  void initState() {
    super.initState();
    parseRecipes();
  }

  void parseRecipes() {
    const jsonData = '''
    {
      "recipes": [
        {
          "title": "Pasta Carbonara",
          "description": "Creamy pasta dish with bacon and cheese.",
          "ingredients": ["spaghetti", "bacon", "egg", "cheese"]
        },
        {
          "title": "Caprese Salad",
          "description": "Simple and refreshing salad with tomatoes, mozzarella, and basil.",
          "ingredients": ["tomatoes", "mozzarella", "basil"]
        },
        {
          "title": "Banana Smoothie",
          "description": "Healthy and creamy smoothie with bananas and milk.",
          "ingredients": ["bananas", "milk"]
        },
        {
          "title": "Chicken Stir-Fry",
          "description": "Quick and flavorful stir-fried chicken with vegetables.",
          "ingredients": ["chicken breast", "broccoli", "carrot", "soy sauce"]
        },
        {
          "title": "Grilled Salmon",
          "description": "Delicious grilled salmon with lemon and herbs.",
          "ingredients": ["salmon fillet", "lemon", "olive oil", "dill"]
        },
        {
          "title": "Vegetable Curry",
          "description": "Spicy and aromatic vegetable curry.",
          "ingredients": ["mixed vegetables", "coconut milk", "curry powder"]
        },
        {
          "title": "Berry Parfait",
          "description": "Layered dessert with fresh berries and yogurt.",
          "ingredients": ["berries", "yogurt", "granola"]
        }
      ]
    }
    ''';

    final jsonDataDecoded = jsonDecode(jsonData);
    final List<dynamic> recipeData = jsonDataDecoded['recipes'];

    setState(() {
      recipes = recipeData.map((data) => Recipe.fromJson(data)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe List'),
      ),
      body: ListView.separated(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            leading: const Icon(Icons.food_bank),
            title: Text(
              recipe.title,
              style: const TextStyle(fontSize: 18),
            ),
            subtitle: Text(recipe.description),
            onLongPress: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: Text(recipe.title),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Description: ${recipe.description}"),
                          const SizedBox(height: 10),
                          Text(
                              "Ingredients:  ${recipe.ingredients.join(', ')}"),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  });
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
