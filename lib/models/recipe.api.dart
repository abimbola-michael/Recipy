import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipy/models/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipes() async {
    // var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
    //     {"limit": "18", "start": "0", "tag": "list.recipe.popular"});
    List<Recipe> recipes = [];
    final uri =
        Uri.parse('https://yummly2.p.rapidapi.com/feeds/list?start=0&limit=18');
    final response = await http.get(
      uri,
      headers: {
        'X-RapidAPI-Key': 'ddd5e8a399mshe43fb9e23b2e887p1f95aejsn2d5531f5c59a',
        'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
      },
    );
    if (response.statusCode != 200) {
      return [];
    }
    Map resultMap = jsonDecode(response.body);
    for (var feed in resultMap['feed']) {
      recipes.add(Recipe.fromJson(feed['content']['details']));
    }
    return recipes;
  }
}
