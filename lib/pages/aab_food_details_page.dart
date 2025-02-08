import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                  buildTextdetails(context, "Some Dishes"),
                  buildheight(context, 0.02),
                  buildScrollRight(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget buildScrollRight() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.restaurants.foodList.map((foodItem) {
          return Container(
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(foodItem.image),
                buildheight(context, 0.01),
                Text(
                  foodItem.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                buildheight(context, 0.01),
                Text(
                  foodItem.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                buildheight(context, 0.01),
                Text(
                  foodItem.price,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                buildheight(context, 0.01),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
