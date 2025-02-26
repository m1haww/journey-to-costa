import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_costa/pages/aab_food_details_page.dart';
import 'package:journey_to_costa/pages/add_events_page.dart';
import 'package:journey_to_costa/pages/app_provider.dart';
import 'package:journey_to_costa/pages/basement.dart';
import 'package:journey_to_costa/pages/basements_text.dart';
import 'package:journey_to_costa/pages/sistem.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AaFoodPage extends StatefulWidget {
  const AaFoodPage({super.key});

  @override
  _AaFoodPageState createState() => _AaFoodPageState();
}

class _AaFoodPageState extends State<AaFoodPage> {
  bool isAllSelected = true;

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
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ToggleSwitch(
                minWidth: 170.0,
                cornerRadius: 12.0,
                activeBgColors: const [
                  [Color(0xff999999)],
                  [Color(0xff999999)]
                ],
                inactiveBgColor: const Color(0xffECECEC),
                initialLabelIndex: isAllSelected ? 0 : 1,
                totalSwitches: 2,
                labels: const ['All', 'Favourites'],
                radiusStyle: true,
                onToggle: (index) {
                  setState(() {
                    isAllSelected = index == 0;
                  });
                },
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: isAllSelected
                  ? _buildEventGrid(provider.costarestaurants)
                  : _buildEventGrid(provider.costarestaurants
                      .where((item) => item.isfavorite)
                      .toList()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleSwitch(bool isSelected, ValueChanged<int> onToggle) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        onToggle(isSelected ? 1 : 0);
      },
      child: Container(
        width: 90,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green[800] : Colors.red[800],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'True',
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'False',
                  style: TextStyle(
                    color: isSelected ? Colors.grey : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventGrid(List<CostaRestaurants> costarestaurants) {
    if (costarestaurants.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.favorite_border,
              size: 80,
              color: Color(0xffDCA23D),
            ),
            buildheight(context, 0.01),
            const Text(
              "You didn't appreciate anything",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontFamily: "Sf"),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
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
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: _buildEventCard(good),
          ),
        );
      },
    );
  }

  Widget _buildEventCard(CostaRestaurants event) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: SizedBox(
                height: 175,
                child: Stack(
                  children: [
                    Image.asset(
                      event.image,
                      width: double.infinity,
                      height: 175,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox(
                          height: 175,
                          child: Center(
                            child: Icon(Icons.image_not_supported,
                                size: 50, color: Colors.grey),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Consumer<AppProvider>(
                        builder: (context, provider, child) {
                          bool isSelected = event.isfavorite;

                          return GestureDetector(
                            onTap: () {
                              provider.togleFavoriteRestaurant(event);
                            },
                            child: Image.asset(
                              "images/vitea.png",
                              color: isSelected
                                  ? Colors.orange
                                  : null, // Apply color only when selected
                              colorBlendMode: isSelected
                                  ? BlendMode.srcIn
                                  : null, // Keeps transparency
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: height * 0.04,
                        width: width * 0.34,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Image(
                                image: AssetImage("images/cronometru.png"),
                              ),
                              buildwidth(context, 0.01),
                              Text(
                                event.time,
                                style: const TextStyle(
                                  fontFamily: "Sf",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9,
                                  color: Color(0xff303030),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: const TextStyle(
                      fontFamily: "Sf",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.black),
                ),
                const SizedBox(height: 8),
                Text(
                  event.descriptionfull,
                  style: TextStyle(
                      fontFamily: "Sf",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.7)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
