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

// // Lista de preparate
// final List<Food> _food = [
//   Food(
//     image: 'images/11.png',
//     title:
//         'Meatballs in a creamy mustard sauce with Idaho potatoes and green beans',
//     price: '\$12.99',
//     description: 'Meatballs in a creamy mustard sauce...',
//     kcal: '237 kcal, 204g',
//   ),
//   Food(
//     image: 'images/12.png',
//     title: 'Semolina cake with cherry jam',
//     price: '\$6.50',
//     description: 'Semolina cake with cherry jam...',
//     kcal: '320 kcal, 180g',
//   ),
//   Food(
//     image: 'images/13.png',
//     title: 'Cheese pancakes with strawberry jam',
//     price: '\$7.80',
//     description: 'Cheese pancakes with strawberry jam...',
//     kcal: '295 kcal, 150g',
//   ),
//   Food(
//     image: 'images/14.png',
//     title: 'Beef in creamy sauce with buckwheat',
//     price: '\$14.20',
//     description: 'Beef in creamy sauce with buckwheat...',
//     kcal: '450 kcal, 250g',
//   ),
//   Food(
//     image: 'images/15.png',
//     title: 'Pea cream soup with croutons',
//     price: '\$5.30',
//     description: 'Pea cream soup with croutons...',
//     kcal: '180 kcal, 200g',
//   ),
//   Food(
//     image: 'images/16.png',
//     title: 'Chopped beef in creamy sauce with spinach and spaghetti',
//     price: '\$13.50',
//     description: 'Chopped beef in creamy sauce with spinach...',
//     kcal: '550 kcal, 300g',
//   ),
//   Food(
//     image: 'images/17.png',
//     title: 'Chicken meatballs with pasta',
//     price: '\$11.00',
//     description: 'Chicken meatballs with pasta...',
//     kcal: '400 kcal, 250g',
//   ),
//   Food(
//     image: 'images/18.png',
//     title: 'Pilaf with chicken',
//     price: '\$9.99',
//     description: 'Pilaf with chicken...',
//     kcal: '350 kcal, 220g',
//   ),
//   Food(
//     image: 'images/19.png',
//     title: 'Chicken in curry sauce with mashed potatoes',
//     price: '\$12.50',
//     description: 'Chicken in curry sauce with mashed potatoes...',
//     kcal: '490 kcal, 280g',
//   ),
//   Food(
//     image: 'images/20.png',
//     title: 'Rice porridge with lingonberries',
//     price: '\$4.75',
//     description: 'Rice porridge with lingonberries...',
//     kcal: '180 kcal, 150g',
//   ),
//   Food(
//     image: 'images/21.png',
//     title: 'Meatballs in Italian sauce with buckwheat',
//     price: '\$13.00',
//     description: 'Meatballs in Italian sauce with buckwheat...',
//     kcal: '420 kcal, 240g',
//   ),
//   Food(
//     image: 'images/22.png',
//     title: 'Grilled Salmon with Lemon Garlic Sauce',
//     price: '\$16.50',
//     description: 'Grilled Salmon with lemon garlic sauce...',
//     kcal: '480 kcal, 300g',
//   ),
// ];

// // Lista de restaurante cu preparatele lor
// final List<CostaRestaurants> _costarestaurants = [
//   CostaRestaurants(
//     image: "images/first.png",
//     title: "El Motel (Empordà Hotel restaurant)",
//     descriptionfull:
//         "El Motel, nestled in the Empordà Hotel in Costa Brava, offers a delightful culinary journey...",
//     time: "08:00 - 11:00",
//     description: "El Motel, nestled in the Empordà",
//   ),
//   CostaRestaurants(
//     image: "images/second.png",
//     title: "Sa Punta Hotel and Restaurant",
//     descriptionfull:
//         "Sa Punta Hotel and Restaurant in Costa Brava offers a delightful culinary experience...",
//     time: "10:00 - 07:00",
//     description: "Sa Punta Hotel and Restaurant in Costa Brava",
//   ),
//   CostaRestaurants(
//     image: "images/Third.png",
//     title: "Compartir Restaurant",
//     descriptionfull:
//         "Compartir Restaurant in Costa Brava offers a delightful culinary experience...",
//     time: "09:00 - 08:00",
//     description: "Compartir Restaurant in Costa Brava offers",
//   ),
//   CostaRestaurants(
//     image: "images/Fourth.png",
//     title: "Els Brancs Restaurant",
//     descriptionfull:
//         "Els Brancs Restaurant in Costa Brava offers a delightful culinary experience...",
//     time: "11:00 - 04:00",
//     description: "Els Brancs Restaurant in Costa Brava offers",
//   ),
// ];

class Sights {
  final String image;
  final String title;

  final String miniinfo;
  final String description;

  Sights({
    required this.image,
    required this.title,
    required this.miniinfo,
    required this.description,
  });
}
