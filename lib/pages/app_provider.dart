import 'package:flutter/cupertino.dart';
import 'package:journey_to_costa/pages/grid_events_list.dart';
import 'package:journey_to_costa/pages/sistem.dart';

var directorypath = "";

class AppProvider extends ChangeNotifier {
  final List<Signup> _signup = [];
  final List<Sights> _sights = [
    Sights(
        title: "Casa Serinyana Estate",
        image: "images/alfa.png",
        miniinfo: "Casa Serinyana, commonly known as the Blue House",
        description:
            "Casa Serinyana, commonly known as the \"Blue House\" (Casa Blaua), is a striking example of Catalan modernism on the Costa Brava coast. It was designed by architect Salvador Sellés in the early 20th century for the Serinyana family, one of the wealthiest and most influential in the town. The house has three floors and an attic. \n\n"
            "A distinctive feature of Casa Serinyana is the connection between the main residential part of the house and a small warehouse located on the other side of the alley on the town's promenade. To unify the two structures, the architect devised an original solution: a terrace with a stunning view of the Cadaqués bay was built on the warehouse roof, from which steps lead to a bridge over the alley, providing access to a door leading to the second floor of the building."),
    Sights(
        title: "Can Mario Tower",
        image: "images/beta.png",
        miniinfo: "The Can Mario factory tower, a modernist landmark",
        description:
            "The Can Mario factory tower, the main ornament and symbol of Palafrugell, was built in 1904 according to the design of architect General Guitart i Lostaló, who did much to promote the modernist style on the Costa Brava (one of his significant works is the Casino La Constància in Sant Feliu de Guíxols). \n\n"
            "In 2000, the Can Mario tower was granted the status of a cultural heritage site of \"national interest.\" The tower is a metal structure on a stone base, which has a door leading to a staircase spiraling inside the iron framework. At the top of the tower are two cylindrical blocks with wrought iron railings: the lower one is a water tank, and the upper one is a viewing platform. The tower is topped with a conical tip featuring a weather vane and the emblem of the old factory. Torre Can Mario is undoubtedly one of the finest examples of industrial modernism."),
    Sights(
        title: "The Modernist cemetery",
        image: "images/ceta.png",
        miniinfo: "Modernist Cemetery in Lloret de Mar",
        description:
            "The Modernist Cemetery in Lloret de Mar showcases the influence of Catalan modernism even in places of rest. During the late 19th and early 20th centuries, wealthy emigrants returning from Latin America commissioned elaborate mausoleums and monuments from renowned architects and sculptors. \n\n"
            "Now a tourist attraction, the cemetery contains informational plaques detailing the history, inspiration, and techniques used in its artistic structures, making it an open-air museum of modernist architecture."),
    Sights(
        title: "Balneari Vichy Catalan Hotel",
        image: "images/deta.png",
        miniinfo: "Vichy Catalán Spa and Mineral Water",
        description:
            "The beneficial properties of the water from the spring on Puig de les Ànimes hill in Caldes de Malavella were known even to the ancient Romans. \n\n"
            "In 1881, Dr. Modest Furest i Roca, a proponent of hydrotherapy, purchased the land where the spring was located and began to commercialize the water. The Balneari Vichy Catalán spa opened in 1898, featuring a stunning modernist design by architect Gaietà Buïgas i Monravà. Today, the spa and its surrounding park remain a symbol of Catalonia's thermal water heritage."),
    Sights(
        title: "Casa Bonaventura Caner Battaler",
        image: "images/eta.png",
        miniinfo: "Casa Bonaventura Caner Battaler",
        description:
            "Casa Bonaventura Caner Battaler is a hidden gem nestled in the picturesque region of Costa Brava, Spain. This historic house, dating back to the 19th century, is a testament to the region's rich architectural heritage. \n\n"
            "The building showcases a blend of traditional Catalan design with modernist influences, making it a unique attraction for visitors interested in history and architecture. Originally built by Bonaventura Caner Battaler, a prominent figure in the local community, the house reflects the lifestyle and aesthetics of a bygone era. \n\n"
            "Visitors can explore its beautifully preserved interiors, featuring intricate woodwork, original furnishings, and stunning tile work. The surrounding gardens provide a serene escape, with lush greenery and vibrant flowers enhancing the charm of this historic site. Casa Bonaventura Caner Battaler is not just a house; it’s a journey through time, inviting guests to immerse themselves in the history and beauty of Costa Brava."),
  ];

  final List<Food> _food = [
    Food(
      image: 'images/11.png',
      title:
          'Meatballs in a creamy mustard sauce with Idaho potatoes and green beans',
      price: '\$12.99',
      description: 'Meatballs in a creamy mustard sauce...',
      kcal: '237 kcal, 204g',
    ),
    Food(
      image: 'images/12.png',
      title: 'Semolina cake with cherry jam',
      price: '\$6.50',
      description: 'Semolina cake with cherry jam...',
      kcal: '320 kcal, 180g',
    ),
    Food(
      image: 'images/13.png',
      title: 'Cheese pancakes with strawberry jam',
      price: '\$7.80',
      description: 'Cheese pancakes with strawberry jam...',
      kcal: '295 kcal, 150g', ////
    ),
    Food(
      image: 'images/14.png',
      title: 'Beef in creamy sauce with buckwheat',
      price: '\$14.20',
      description: 'Beef in creamy sauce with buckwheat...',
      kcal: '450 kcal, 250g',
    ),
    Food(
      image: 'images/15.png',
      title: 'Pea cream soup with croutons',
      price: '\$5.30',
      description: 'Pea cream soup with croutons...',
      kcal: '180 kcal, 200g',
    ),
    Food(
      image: 'images/16.png',
      title: 'Chopped beef in creamy sauce with spinach and spaghetti',
      price: '\$13.50',
      description: 'Chopped beef in creamy sauce with spinach...',
      kcal: '550 kcal, 300g', ////////
    ),
    Food(
      image: 'images/17.png',
      title: 'Chicken meatballs with pasta',
      price: '\$11.00',
      description: 'Chicken meatballs with pasta...',
      kcal: '400 kcal, 250g',
    ),
    Food(
      image: 'images/18.png',
      title: 'Pilaf with chicken',
      price: '\$9.99',
      description: 'Pilaf with chicken...',
      kcal: '350 kcal, 220g',
    ),
    Food(
      image: 'images/19.png',
      title: 'Chicken in curry sauce with mashed potatoes',
      price: '\$12.50',
      description: 'Chicken in curry sauce with mashed potatoes...',
      kcal: '490 kcal, 280g', /////
    ),
    Food(
      image: 'images/20.png',
      title: 'Rice porridge with lingonberries',
      price: '\$4.75',
      description: 'Rice porridge with lingonberries...',
      kcal: '180 kcal, 150g',
    ),
    Food(
      image: 'images/21.png',
      title: 'Meatballs in Italian sauce with buckwheat',
      price: '\$13.00',
      description: 'Meatballs in Italian sauce with buckwheat...',
      kcal: '420 kcal, 240g',
    ),
    Food(
      image: 'images/22.png',
      title: 'Grilled Salmon with Lemon Garlic Sauce',
      price: '\$16.50',
      description: 'Grilled Salmon with lemon garlic sauce...',
      kcal: '480 kcal, 300g',

      ///
    )
  ];
  final List<CostaRestaurants> _costarestaurants = [
    CostaRestaurants(
        image: "images/first.png",
        title: "El Motel (Empordà Hotel restaurant)",
        descriptionfull:
            "El Motel, nestled in the Empordà Hotel in Costa Brava, offers a delightful culinary journey. Savor exquisite Mediterranean dishes crafted with fresh local ingredients, all in a charming and inviting atmosphere. Perfect for food lovers seeking a unique dining experience.",
        time: "08:00 AM - 11:00 AM",
        description: "El Motel, nestled in the Empordà ... ",
        foodList: [
          Food(
            image: 'images/11.png',
            title:
                'Meatballs in a creamy mustard sauce with Idaho potatoes and green beans',
            price: '\$12.99',
            description: 'Meatballs in a creamy mustard sauce...',
            kcal: '237 kcal, 204g',
          ),
          Food(
            image: 'images/12.png',
            title: 'Semolina cake with cherry jam',
            price: '\$6.50',
            description: 'Semolina cake with cherry jam...',
            kcal: '320 kcal, 180g',
          ),
          Food(
            image: 'images/13.png',
            title: 'Cheese pancakes with strawberry jam',
            price: '\$7.80',
            description: 'Cheese pancakes with strawberry jam...',
            kcal: '295 kcal, 150g',
          ),
        ]),
    CostaRestaurants(
        image: "images/second.png",
        title: "Sa Punta Hotel and Restaurant",
        descriptionfull:
            "Sa Punta Hotel and Restaurant in Costa Brava offers a delightful culinary experience with breathtaking sea views. Enjoy exquisite Mediterranean dishes crafted from fresh, local ingredients in a serene and elegant setting.",
        time: "10:00 AM - 07:00 AM",
        description: "Sa Punta Hotel and Restaurant in Costa Brava",
        foodList: [
          Food(
            image: 'images/14.png',
            title: 'Beef in creamy sauce with buckwheat',
            price: '\$14.20',
            description: 'Beef in creamy sauce with buckwheat...',
            kcal: '450 kcal, 250g',
          ),
          Food(
            image: 'images/15.png',
            title: 'Pea cream soup with croutons',
            price: '\$5.30',
            description: 'Pea cream soup with croutons...',
            kcal: '180 kcal, 200g',
          ),
          Food(
            image: 'images/16.png',
            title: 'Chopped beef in creamy sauce with spinach and spaghetti',
            price: '\$13.50',
            description: 'Chopped beef in creamy sauce with spinach...',
            kcal: '550 kcal, 300g', ////
          ),
        ]),
    CostaRestaurants(
        image: "images/Third.png",
        title: "Compartir Restaurant",
        descriptionfull:
            "Compartir Restaurant in Costa Brava offers a delightful culinary experience with its innovative Mediterranean dishes. Enjoy a cozy atmosphere and share plates designed to bring people together, all while savoring the stunning coastal views.",
        time: "09:00 AM - 08:00 PM",
        description: "Compartir Restaurant in Costa Brava offers",
        foodList: [
          Food(
            image: 'images/17.png',
            title: 'Chicken meatballs with pasta',
            price: '\$11.00',
            description: 'Chicken meatballs with pasta...',
            kcal: '400 kcal, 250g',
          ),
          Food(
            image: 'images/18.png',
            title: 'Pilaf with chicken',
            price: '\$9.99',
            description: 'Pilaf with chicken...',
            kcal: '350 kcal, 220g',
          ),
          Food(
            image: 'images/19.png',
            title: 'Chicken in curry sauce with mashed potatoes',
            price: '\$12.50',
            description: 'Chicken in curry sauce with mashed potatoes...',
            kcal: '490 kcal, 280g', /////
          ),
        ]),
    CostaRestaurants(
        image: "images/Fourth.png",
        title: "Els Brancs Restaurant",
        descriptionfull:
            "Els Brancs Restaurant in Costa Brava offers a delightful culinary experience with breathtaking sea views. Enjoy exquisite dishes crafted with local ingredients, perfect for a romantic dinner or a special celebration.",
        time: "11:00 AM - 04:00 PM",
        description: "Els Brancs Restaurant in Costa Brava offers ...",
        foodList: [
          Food(
            image: 'images/20.png',
            title: 'Rice porridge with lingonberries',
            price: '\$4.75',
            description: 'Rice porridge with lingonberries...',
            kcal: '180 kcal, 150g',
          ),
          Food(
            image: 'images/21.png',
            title: 'Meatballs in Italian sauce with buckwheat',
            price: '\$13.00',
            description: 'Meatballs in Italian sauce with buckwheat...',
            kcal: '420 kcal, 240g',
          ),
          Food(
            image: 'images/22.png',
            title: 'Grilled Salmon with Lemon Garlic Sauce',
            price: '\$16.50',
            description: 'Grilled Salmon with lemon garlic sauce...',
            kcal: '480 kcal, 300g',

            ///
          )
        ]),
  ];

  List<Food> get food => _food;
  List<CostaRestaurants> get costarestaurants => _costarestaurants;
  final List<GridEventsList> _eventsList = [
    GridEventsList(
      image: "images/1.png",
      title: "Palafrugell City Day ",
      info: "Palafrugell City Day, also known as ...",
      date: "01/01/25",
      time: "12:00 - 06:00",
      description:
          "Palafrugell City Day, also known as Saint Margaret's Day, is a vibrant celebration in the picturesque town of Palafrugell, Costa Brava, Spain. This annual event showcases local traditions with parades, live performances, and cultural exhibits. The day features markets, guided tours, and a grand fireworks finale. A must-attend event for those who appreciate history, music, and local cuisine.",
    ),
    GridEventsList(
      image: "images/2.png",
      title: "Menú de la Gamba",
      info: "Menú de la Gamba de Palamós ...",
      date: "05/02/25",
      time: "15:00 - 23:00",
      description:
          "Menú de la Gamba de Palamós is a culinary event celebrating the famous Palamós prawns. Visitors can enjoy gourmet prawn dishes prepared by top chefs, attend live cooking demonstrations, and participate in wine tastings. The festival atmosphere is enhanced by live music and a variety of food stalls offering both traditional and innovative seafood creations.",
    ),
    GridEventsList(
      image: "images/4.png",
      title: "Rice planting in Palse ",
      info: "Traditional Rice Planting Festival ...",
      date: "10/03/25",
      time: "18:00 - 22:00",
      description:
          "The Traditional Rice Planting Festival in Pals is a unique experience where visitors can witness the age-old practice of hand-planting rice. Veteran farmers demonstrate traditional techniques, and attendees enjoy a farmer’s breakfast. The festival offers hands-on activities for children, historical insights, and a chance to connect with Pals’ agricultural heritage.",
    ),
    GridEventsList(
      image: "images/5.png",
      title: "Winter Carnaval ",
      info: "Winter Carnival – A week of ...",
      date: "20/04/25",
      time: "10:00 - 17:00",
      description:
          "The Winter Carnival (Carnestoltes) is a vibrant week-long celebration in Catalonia. Featuring parades, costume balls, banquets, and community-organized events, this festival marks the joyful days before Lent. Each town in Costa Brava adds its own unique traditions, making it a lively and colorful experience for locals and visitors alike.",
    ),
    GridEventsList(
      image: "images/6.png",
      title: "Pessebre Vivent",
      info: "The Living Nativity – A ...",
      date: "15/05/25",
      time: "08:00 - 14:00",
      description:
          "The Living Nativity (Pessebre Vivent) is a theatrical re-enactment of Christ’s birth, held in Catalonia’s medieval towns. The most famous is in Castell d'Aro, where hundreds of locals participate in this tradition. Visitors can explore a Christmas village, enjoy biblical scenes, and experience a festive market, all in an immersive holiday atmosphere.",
    ),
  ];
  List<Sights> get sights => _sights;

  List<Signup> get signup => _signup;
  List<GridEventsList> get eventsList => _eventsList;
  final Set<String> _selectedEvents = {}; // Stores selected event image paths

  bool isEventImageSelected(String imagePath) {
    return _selectedEvents.contains(imagePath);
  }

  void toggleEventImageSelection(String imagePath) {
    if (_selectedEvents.contains(imagePath)) {
      _selectedEvents.remove(imagePath);
    } else {
      _selectedEvents.add(imagePath);
    }
    notifyListeners(); // Notify widgets to update state
  }

  void addSignup(Signup signup) {
    _signup.add(signup);
    notifyListeners();
  }

  void addEvent(GridEventsList event) {
    _eventsList.add(event);
    notifyListeners();
  }

  void signUpToEvent(GridEventsList event) {
    event.issaved = true;
    notifyListeners();
  }
}
