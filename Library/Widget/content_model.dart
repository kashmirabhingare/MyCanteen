
class UnboardingContent{
  String image;
  String title;
  String description;
  UnboardingContent({required this.description,required this.image,required this.title});
}

List<UnboardingContent> contents=[
  UnboardingContent(
      description: 'Pick your food from our Menu\n        More than 40 items!! ',
      image: "images/onboard_screen1.png",
      title: 'Select from our\n     Best Menu'),
  UnboardingContent(description: "  You can Pay using \n    Canteen Wallet! ",
      image: "images/onboard_screen2.jpg",title: "Easy and Effortless \n        Payment"),
  UnboardingContent(description: "Place order and get your food \n     ready to go or Have-In ",
      image: "images/onboard_screen3.jpg",title: "Quick and Easy Ordering"),

];
