import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_costa/pages/app_provider.dart';
import 'package:journey_to_costa/pages/basement.dart';
import 'package:journey_to_costa/pages/basements_text.dart';
import 'package:journey_to_costa/pages/grid_events_list.dart';
import 'package:journey_to_costa/pages/sign_up.dart';
import 'package:provider/provider.dart';

class ReservationDetailsPage extends StatefulWidget {
  final GridEventsList event;

  const ReservationDetailsPage({super.key, required this.event});

  @override
  State<ReservationDetailsPage> createState() => _ReservationDetailsPageState();
}

class _ReservationDetailsPageState extends State<ReservationDetailsPage> {
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
                        Text(
                          widget.event.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 3, // Limits text to 2 lines
                          // Adds "..." if text is too long
                        ),
                      ],
                    ),
                    buildheight(context, 0.02),
                    buildTextdetails(context, "Description"),
                    buildheight(context, 0.02),
                    Text(
                      widget.event.description,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Sf",
                        color: Colors.black,
                      ),
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
