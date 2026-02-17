import 'model.dart';

class Global {
  static List<Content> list = [];

  static List<Content> animals = [
    Content(image: "assets/animals/monkey.png", value: "Monkey"),
    Content(image: "assets/animals/cow.png", value: "Cow"),
    Content(image: "assets/animals/horse.png", value: "Horse"),
    Content(image: "assets/animals/elephatn.png", value: "Elephant"),
    Content(image: "assets/animals/panda.png", value: "Panda"),
  ];

  static List<Content> fruits = [
    Content(image: "assets/fruits/wotermelon.png", value: "Watermelon"),
    Content(image: "assets/fruits/greps.png", value: "Grapes"),
    Content(image: "assets/fruits/kiwi.png", value: "Kiwi"),
    Content(image: "assets/fruits/banana.png", value: "Banana"),
    Content(image: "assets/fruits/apple.png", value: "Apple"),
  ];
}
