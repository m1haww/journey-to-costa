import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_costa/pages/app_provider.dart';
import 'package:journey_to_costa/pages/basement.dart';
import 'package:journey_to_costa/pages/basements_text.dart';
import 'package:journey_to_costa/pages/first_detail_page.dart';
import 'package:journey_to_costa/pages/grid_events_list.dart';
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
          // Toggle Buttons
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildToggleButton("Active", isActiveSelected, () {
                  setState(() {
                    isActiveSelected = true;
                  });
                }),
                _buildToggleButton("Archived", !isActiveSelected, () {
                  setState(() {
                    isActiveSelected = false;
                  });
                }),
              ],
            ),
          ),

          // Content Area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: isActiveSelected
                  ? _buildEventGrid(
                      provider.eventsList.where((e) => e.issaved).toList())
                  : _buildAddedEvents(),
            ),
          ),
        ],
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

  Widget _buildAddedEvents() {
    if (addedEvents.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("images/anyy.png"),
            ),
            buildheight(context, 0.02),
            const Align(
              alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.center,
                'There aren’t any events you add yet,\n you can do it now',
                style: TextStyle(
                  fontFamily: "Sf",
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return _buildEventGrid(addedEvents);
    }
  }

  Widget _buildEventGrid(List<GridEventsList> eventsList) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 50,
        childAspectRatio: 1.6,
      ),
      itemCount: eventsList.length,
      itemBuilder: (context, index) {
        final event = eventsList[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => FirstDetailPage(event: event)));
          },
          child: _buildEventCard(event),
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
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              event.image,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    event.info,
                    style: const TextStyle(
                        fontFamily: "Sf",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.black),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
}
