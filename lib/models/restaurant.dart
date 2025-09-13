class Restaurant {
  final String id;
  final String name;
  final String image;
  final double rating;
  final String deliveryTime; // e.g. "25-35 min"
  final String priceRange; // e.g. ""
  final List<String> categories;
  final List<Dish> menu;

  Restaurant({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.deliveryTime,
    required this.priceRange,
    required this.categories,
    required this.menu,
  });
}

class Dish {
  final String id;
  final String name;
  final String image;
  final double price;
  final String category;

  Dish({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.category,
  });
}
