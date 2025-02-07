import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_costa/pages/aab_food_details_page.dart';
import 'package:journey_to_costa/pages/add_events_page.dart';
import 'package:journey_to_costa/pages/app_provider.dart';
import 'package:journey_to_costa/pages/basement.dart';
import 'package:journey_to_costa/pages/basements_text.dart';
import 'package:journey_to_costa/pages/sistem.dart';
import 'package:provider/provider.dart';

class AaFoodPage extends StatefulWidget {
  const AaFoodPage({super.key});

  @override
  _AaFoodPageState createState() => _AaFoodPageState();
}

class _AaFoodPageState extends State<AaFoodPage> {
  bool isGeneralSelected = true;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: buildTextForAppbar(context, "Costa restaurants"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Toggle Buttons
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildToggleButton("All", isGeneralSelected, () {
                  setState(() {
                    isGeneralSelected = true;
                  });
                }),
                _buildToggleButton("Favourites", !isGeneralSelected, () {
                  setState(() {
                    isGeneralSelected = false;
                  });
                }),
              ],
            ),
          ),

          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: isGeneralSelected
                    ? _buildEventGrid(provider.costarestaurants)
                    : null),
          ),
        ],
      ),
      floatingActionButton: isGeneralSelected
          ? null
          : Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const AddEventsPage()));
                    },
                    child: buildContainer(context)),
              ),
            ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected, VoidCallback onTap) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * 0.06,
        width: width * 0.45,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff999999) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xff999999)),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 13),
          ),
        ),
      ),
    );
  }

  Widget _buildEventGrid(List<CostaRestaurants> costarestaurants) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, // Display in grid format
        mainAxisSpacing: 50,
        childAspectRatio: 1.1,
      ),
      itemCount: costarestaurants.length,
      itemBuilder: (context, index) {
        final good = costarestaurants[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => AabFoodDetailsPage(restaurants: good)),
            );
          },
          child: _buildEventCard(good),
        );
      },
    );
  }

  Widget _buildEventCard(CostaRestaurants event) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Stack(children: [
              Image.asset(
                event.image,
                width: double.infinity,
                height: 175,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    height: 150,
                    child: Center(
                        child: Icon(Icons.image_not_supported,
                            size: 50, color: Colors.grey)),
                  );
                },
              ),
              Positioned(
                bottom: 1,
                right: 15,
                child: Row(
                  children: [
                    Image(image: AssetImage("images/cronometru.png")),
                    buildwidth(context, 0.01),
                    Text(
                      event.time,
                      style: TextStyle(
                          fontFamily: "Sf",
                          fontWeight: FontWeight.w400,
                          fontSize: 9,
                          color: Color(0xff303030)),
                    ),
                  ],
                ),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Restaurant Title
                Text(
                  event.title,
                  style: const TextStyle(
                      fontFamily: "Sf",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.black),
                ),
                const SizedBox(height: 8),
                // Short Description
                Text(
                  event.description,
                  style: TextStyle(
                      fontFamily: "Sf",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.7)),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                // Restaurant Operating Hours
                // Text(
                //   event.time,
                //   style: TextStyle(
                //       fontFamily: "Sf",
                //       fontWeight: FontWeight.w400,
                //       fontSize: 12,
                //       color: Colors.black.withOpacity(0.5)),
                // ),
                const SizedBox(height: 10),
                // Menu Items (first three dishes)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
