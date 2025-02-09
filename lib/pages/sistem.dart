class SistemEvent {
  final String image;
  final String title;
  final String info;
  final String date;

  SistemEvent(
      {required this.image,
      required this.title,
      required this.info,
      required this.date});
}

class Signup {
  final String date;
  final String name;
  final String number;
  final String comment;

  Signup(
      {required this.date,
      required this.name,
      required this.number,
      required this.comment});
}

class CostaRestaurants {
  final String image;
  final String title;
  final String descriptionfull;
  final String time;
  final String description;
  final List<Food> menu;
  bool isfavorite = false;

  CostaRestaurants({
    required this.image,
    required this.title,
    required this.descriptionfull,
    required this.time,
    required this.description,
    required this.menu,
  });
}

class Food {
  final String image;
  final String title;
  final String price;
  final String description;
  final String kcal;

  Food({
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.kcal,
  });
}

class Sights {
  final String image;
  final String title;

  final String miniinfo;
  final String description;
  bool isfavorite = false;

  Sights({
    required this.image,
    required this.title,
    required this.miniinfo,
    required this.description,
  });
}
