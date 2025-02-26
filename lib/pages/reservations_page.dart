import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_costa/pages/app_provider.dart';
import 'package:journey_to_costa/pages/basement.dart';
import 'package:journey_to_costa/pages/basements_text.dart';
import 'package:journey_to_costa/pages/first_detail_page.dart';
import 'package:journey_to_costa/pages/grid_events_list.dart';
import 'package:journey_to_costa/pages/reservation_details_page.dart';
import 'package:provider/provider.dart';

class ReservationsPage extends StatefulWidget {
  const ReservationsPage({super.key});

  @override
  State<ReservationsPage> createState() => _ReservationsPageState();
}

class _ReservationsPageState extends State<ReservationsPage> {
  List<GridEventsList> addedEvents = [];

  bool isActiveSelected = true;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: buildTextForAppbar(context, "Your reservations"),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Content Area (without toggle switch)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildEventGrid(
                  provider.eventsList.where((e) => e.issaved).toList()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventGrid(List<GridEventsList> eventsList) {
    if (eventsList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.event,
              size: 80,
              color: Color(0xffDCA23D),
            ),
            buildheight(context, 0.01),
            const Text(
              "You didn't sign up for anything",
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
      itemCount: eventsList.length,
      itemBuilder: (context, index) {
        final event = eventsList[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => ReservationDetailsPage(event: event),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: _buildEventCard(event),
          ),
        );
      },
    );
  }

  Widget _buildEventCard(GridEventsList event) {
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
          Stack(children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                event.image,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: GestureDetector(
                onTap: () {
                  _showActionSheet(context, event);
                },
                child: Image.asset(
                  "images/dots.png",
                ),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
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
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        event.description,
                        style: TextStyle(
                          fontFamily: "Sf",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.4),
                        ),
                        maxLines: 1, // Limits text to 2 lines
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      event.date,
                      style: TextStyle(
                          fontFamily: "Sf",
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: Colors.black.withOpacity(0.4)),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      event.time,
                      style: TextStyle(
                          fontFamily: "Sf",
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: Colors.black.withOpacity(0.4)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showActionSheet(BuildContext context, GridEventsList addedEvents) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: const Text(
                        "Delete the reservation?",
                        style: TextStyle(
                            fontFamily: "Sf",
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      content: const Text(
                        "Are you sure that you want to delete the reservation?",
                        style: TextStyle(
                            fontFamily: "Sf",
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () async {
                            final provider = Provider.of<AppProvider>(context,
                                listen: false);

                            await Future.delayed(
                                const Duration(milliseconds: 300));

                            setState(() {
                              provider.deleteEvent(addedEvents);
                            });

                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Delete",
                            style: TextStyle(
                                fontFamily: "Sf",
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffFF0E0A)),
                          ),
                          isDestructiveAction: true,
                        ),
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                                fontFamily: "Sf",
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffDCA23D)),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              isDestructiveAction: true,
              child: const Text(
                "Delete",
                style: TextStyle(
                    fontFamily: "Sf",
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFF0E0A)),
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                    fontFamily: "Sf",
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffDCA23D)),
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Close",
              style: TextStyle(
                  fontFamily: "Sf",
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffDCA23D)),
            ),
          ),
        );
      },
    );
  }
}
