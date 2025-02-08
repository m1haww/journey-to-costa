import 'package:flutter/material.dart';
import 'package:journey_to_costa/pages/app_provider.dart';
import 'package:journey_to_costa/pages/basement.dart';
import 'package:journey_to_costa/pages/basements_text.dart';
import 'package:journey_to_costa/pages/sistem.dart';
import 'package:provider/provider.dart';

class SightsDetailsPage extends StatefulWidget {
  final Sights sights;

  const SightsDetailsPage({super.key, required this.sights});
  @override
  State<SightsDetailsPage> createState() => _SightsDetailsPageState();
}

class _SightsDetailsPageState extends State<SightsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                      widget.sights.image,
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.sights.title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                            width: 10), // Adds space between text and image
                        Consumer<AppProvider>(
                          builder: (context, provider, child) {
                            bool isSelected = widget.sights.isfavorite;

                            return GestureDetector(
                              onTap: () {
                                provider.togleFavoritSight(widget.sights);
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
                    buildTextdetails(context, "Description"),
                    buildheight(context, 0.02),
                    Text(
                      widget.sights.description,
                      style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "Sf",
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    buildheight(context, 0.02),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
