class Recipe {
  final String name;
  final double rating;
  final String cookTime;
  final String thumbnailUrl;
  const Recipe({
    required this.name,
    required this.rating,
    required this.cookTime,
    required this.thumbnailUrl,
  });

  static Recipe fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'] ?? "",
      rating: json['rating'] ?? 0,
      cookTime: json['totalTime'] ?? "",
      thumbnailUrl: json['images']?[0]?['hostedLargeUrl'] ?? "",
    );
    // return Recipe(
    //   name: json['name'],
    //   rating: json['rating'],
    //   cookTime: json['cookTime'],
    //   thumbnailUrl: json['thumbnailUrl'],
    // );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'rating': rating,
      'cookTime': cookTime,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  static Recipe fromDomain(Recipe domain) {
    return Recipe(
      name: domain.name,
      rating: domain.rating,
      cookTime: domain.cookTime,
      thumbnailUrl: domain.thumbnailUrl,
    );
  }

  Recipe toDomain() {
    return Recipe(
      name: this.name,
      rating: this.rating,
      cookTime: this.cookTime,
      thumbnailUrl: this.thumbnailUrl,
    );
  }
}
