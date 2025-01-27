class Category {
  final String name;
  final String image;

  Category({
    required this.name,
    required this.image,
  });
}

List<Category> categoryComponents = [
  Category(name: "Beach", image: "img/beach.png"),
  Category(name: "Boat", image: "img/boat.png"),
  Category(name: "Museum", image: "img/museum.png"),
  Category(name: "Lake", image: "img/lake.png"),
  Category(name: "Tricycle", image: "img/tricycle.png"),
];
