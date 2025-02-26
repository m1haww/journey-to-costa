import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_costa/pages/app_provider.dart';
import 'package:journey_to_costa/pages/basement.dart';
import 'package:journey_to_costa/pages/basements_text.dart';
import 'package:journey_to_costa/pages/grid_events_list.dart';
import 'package:journey_to_costa/pages/sign_up.dart';
import 'package:provider/provider.dart';

class FirstDetailPage extends StatefulWidget {
  final GridEventsList event;

  const FirstDetailPage({super.key, required this.event});

  @override
  State<FirstDetailPage> createState() => _FirstDetailPageState();
}

class _FirstDetailPageState extends State<FirstDetailPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

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
                      widget.event.image,
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
                            widget.event.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 3, // Limits text to 2 lines
                            // Adds "..." if text is too long
                          ),
                        ),
                        const SizedBox(
                            width: 10), // Adds space between text and image
                        Consumer<AppProvider>(
                          builder: (context, provider, child) {
                            bool isSelected = widget.event.isfavorite;

                            return GestureDetector(
                              onTap: () {
                                provider.togleFavoritevent(widget.event);
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
                    buildTextdetails(context, "Description"),
                    buildheight(context, 0.02),
                    Text(
                      widget.event.description,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Sf",
                        color: Colors.black,
                      ),
                    ),
                    buildheight(context, 0.02),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => SignUp(
                              event: widget.event,
                            ),
                          ),
                        );
                      },
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: buildSaveButton(context, "Sign up"),
                      ),
                    ),
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
