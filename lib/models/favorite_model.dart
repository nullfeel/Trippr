class Favorite {
  final String title;
  final String location;
  final int day;
  final String image;
  final int price;

  Favorite(
      {required this.title,
      required this.location,
      required this.day,
      required this.image,
      required this.price});
}

List<Favorite> favorite = [
  Favorite(
      title: "Eiffel Tower",
      location: "Paris",
      image: "img/paris.jpg",
      day: 5,
      price: 430),
  Favorite(
      title: "Baja Peninsula",
      location: "Mexico",
      image: "assets/img/images.jpeg",
      day: 7,
      price: 233),
  Favorite(
      title: "Sossusvlei",
      location: "Salt pan in Namibia",
      image: "assets/img/Sossusvlei.jpg",
      day: 9,
      price: 550),
  Favorite(
      title: "Cancún",
      location: "Mexico",
      image:
          "assets/img/22bab5ad4b9aa1027ad00a84ea7493d2c0c5e666d43d3b9413e332bdbd3f1780.jpg",
      day: 3,
      price: 546),
];
