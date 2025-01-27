class IntroModel {
  final String title;
  final String subTitle;
  final String description;
  final String imageUrl;

  IntroModel({
    required this.title,
    required this.subTitle,
    required this.description,
    required this.imageUrl,
  });
}

List<IntroModel> introComponents = [
  IntroModel(
      title: "Welcome to TRIPPR\nYour Travel Companion!",
      subTitle: "",
      description:
          "Experience a new way to plan, explore, and enjoy the world! With Trippr, your travels will be easier, organized, and more fun.",
      imageUrl: "assets/img/1.jpg"),
  IntroModel(
      title: "TRIPPR – Explore the World\nMade Easier Than Ever!",
      subTitle: "",
      description:
          "Are you ready for an unforgettable journey? Trippr is here to be your all-in-one travel solution.",
      imageUrl: "assets/img/2.jpg"),
  IntroModel(
      title: "Your Adventure Begins Here\nWelcome to Trippr!",
      subTitle: "",
      description:
          "Plan your dream trip in just a few simple steps. Trippr is here to help you find the best places, create an efficient plan, and enjoy limitless experiences at every destination.",
      imageUrl: "assets/img/3.jpg"),
];
