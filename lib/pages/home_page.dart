import 'package:flutter/material.dart';
import 'package:recipy/components/recipe_item.dart';
import 'package:recipy/models/recipe.api.dart';

import '../models/recipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipes = [];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    readRecipes();
  }

  void readRecipes() async {
    recipes = await RecipeApi.getRecipes();
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('Recipy'),
          ],
        ),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : recipes.isEmpty
              ? const Center(
                  child: Text("No Recipe"),
                )
              : ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = recipes[index];
                    return RecipeItem(recipe: recipe);
                  },
                ),
    );
  }
}
