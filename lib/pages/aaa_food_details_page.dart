import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_costa/pages/a_rate_page.dart';
import 'package:journey_to_costa/pages/aa_rate_succesful_page.dart';
import 'package:journey_to_costa/pages/basement.dart';
import 'package:journey_to_costa/pages/basements_text.dart';
import 'package:journey_to_costa/pages/sistem.dart';

class AaaFoodDetailsPage extends StatefulWidget {
  final int initialIndex;
  final List<Food> foodList;
  const AaaFoodDetailsPage(
      {super.key, required this.initialIndex, required this.foodList});
  @override
  State<AaaFoodDetailsPage> createState() => _AaaFoodDetailsPageState();
}

class _AaaFoodDetailsPageState extends State<AaaFoodDetailsPage> {
  late PageController _pageController;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: currentIndex);
  }

  void _onTapBottomDish(int index) {
    setState(() {
      currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.foodList.length,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            Food food = widget.foodList[index % widget.foodList.length];
            return SingleChildScrollView(
              child: Column(
                children: [
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
                          food.image,
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
                          child: Image.asset('images/back.png'),
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                food.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Sf",
                                  color: Colors.black,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            buildwidth(context, 0.01),
                            Text(
                              food.price,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Dm",
                                color: Color(0xff303030),
                              ),
                            ),
                          ],
                        ),
                        buildheight(context, 0.01),
                        Text(
                          food.kcal,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Dm",
                              color: Color(0xff80303030)), //50% opacity
                        ),
                        buildheight(context, 0.02),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => ARatePage(
                                      food: food,
                                    ),
                                  ));
                            },
                            child: buildSaveButton(context, "Rate")),
                        buildheight(context, 0.02),
                        buildTextdetails(context, "Other dishes"),
                        buildheight(context, 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Use Expanded or Flexible to prevent overflow
                            for (int i = 1; i <= 2; i++)
                              if (currentIndex + i < widget.foodList.length ||
                                  currentIndex + i - widget.foodList.length >=
                                      0)
                                Expanded(
                                  child: Container(
                                    width: width * 0.35,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
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
                                    child: GestureDetector(
                                      onTap: () => _onTapBottomDish(
                                          (currentIndex + i) %
                                              widget.foodList
                                                  .length), // Cycle through foods
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.vertical(
                                                    top: Radius.circular(20)),
                                            child: Image.asset(
                                              widget
                                                  .foodList[(currentIndex + i) %
                                                      widget.foodList.length]
                                                  .image,
                                              width: double.infinity,
                                              height: height *
                                                  0.2, // Match height of the image to the first container
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      widget
                                                          .foodList[
                                                              (currentIndex +
                                                                      i) %
                                                                  widget
                                                                      .foodList
                                                                      .length]
                                                          .price,
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily: "Dm",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                buildheight(context, 0.005),
                                                Text(
                                                  widget
                                                      .foodList[
                                                          (currentIndex + i) %
                                                              widget.foodList
                                                                  .length]
                                                      .title,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "Dm",
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                buildheight(context, 0.005),
                                                Text(
                                                  widget
                                                      .foodList[
                                                          (currentIndex + i) %
                                                              widget.foodList
                                                                  .length]
                                                      .kcal,
                                                  style: const TextStyle(
                                                    fontFamily: "Dm",
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    color: Color(
                                                        0x80303030), // 50% opacity
                                                  ),
                                                ),
                                                buildheight(context, 0.01),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                  builder: (context) =>
                                                      ARatePage(food: food),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              decoration: const BoxDecoration(
                                                color: Color(0xffF6F6F6),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12),
                                                ),
                                              ),
                                              child: const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                                  child: Text(
                                                    "Rate",
                                                    style: TextStyle(
                                                      fontFamily: "Sf",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xffDCA23D),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
