import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_costa/pages/a_rate_page.dart';
import 'package:journey_to_costa/pages/aaa_food_details_page.dart';
import 'package:journey_to_costa/pages/app_provider.dart';
import 'package:journey_to_costa/pages/basement.dart';
import 'package:journey_to_costa/pages/basements_text.dart';
import 'package:journey_to_costa/pages/sistem.dart';
import 'package:provider/provider.dart';

class AabFoodDetailsPage extends StatefulWidget {
  final CostaRestaurants restaurants;

  AabFoodDetailsPage({super.key, required this.restaurants});

  @override
  State<AabFoodDetailsPage> createState() => _AabFoodDetailsPageState();
}

class _AabFoodDetailsPageState extends State<AabFoodDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Display event image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Stack(children: [
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Image.asset(
                    widget.restaurants.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'images/back.png',
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 20),

            // Display event details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, // Ensures spacing
                    children: [
                      Expanded(
                        // Ensures the text wraps properly into two lines if needed
                        child: Text(
                          widget.restaurants.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2, // Limits text to 2 lines
                          overflow: TextOverflow
                              .ellipsis, // Adds "..." if text is too long
                        ),
                      ),
                      const SizedBox(
                          width: 10), // Adds space between text and image
                      Consumer<AppProvider>(
                        builder: (context, provider, child) {
                          bool isSelected = provider
                              .isEventImageSelected(widget.restaurants.image);

                          return GestureDetector(
                            onTap: () {
                              provider.toggleEventImageSelection(
                                  widget.restaurants.image);
                            },
                            child: Image.asset(
                              "images/vitea.png",
                              width: 30, // Adjust image width as needed
                              height: 30, // Adjust image height as needed
                              color: isSelected ? Colors.orange : null,
                              colorBlendMode:
                                  isSelected ? BlendMode.srcIn : null,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  buildheight(context, 0.02),
                  buildContainerWorkTime(context, widget.restaurants),
                  buildheight(context, 0.02),
                  buildTextdetails(context, "Description"),
                  buildheight(context, 0.02),
                  Text(
                    widget.restaurants.descriptionfull,
                    style: const TextStyle(
                        fontSize: 14,
                        fontFamily: "Sf",
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  buildheight(context, 0.02),
                  buildTextdetails(context, "Some dishes"),
                  buildheight(context, 0.02),
                  buildScrollRight(),
                  buildheight(context, 0.02),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget buildScrollRight() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.restaurants.menu.map((foodItem) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => AaaFoodDetailsPage(
                      foodList: widget.restaurants.menu,
                      initialIndex: widget.restaurants.menu
                          .indexOf(foodItem), // Pass the selected index
                    ),
                  ));
            },
            child: Container(
              width: width * 0.45,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.asset(
                      foodItem.image,
                      width: double.infinity,
                      height: height * 0.2,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Price with discount
                        Row(
                          children: [
                            Text(
                              foodItem.price,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Dm"),
                            ),
                          ],
                        ),
                        buildheight(context, 0.005),
                        // Title
                        Text(
                          foodItem.title,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Dm"),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        buildheight(context, 0.005),
                        // Description
                        Text(
                          foodItem.kcal,
                          style: const TextStyle(
                              fontFamily: "Dm",
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color:
                                  Color(0x80303030) // 50% opacity (80 in hex)

                              ),
                        ),
                        buildheight(context, 0.01),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      ARatePage(food: foodItem),
                                ));
                          },
                          child: Container(
                            color: Color(0xffF6F6F6),
                            child: const Center(
                              child: Text(
                                "Rate",
                                style: TextStyle(
                                  fontFamily: "Sf",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffDCA23D),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
