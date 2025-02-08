import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_costa/pages/add_events_page.dart';
import 'package:journey_to_costa/pages/app_provider.dart';
import 'package:journey_to_costa/pages/basement.dart';
import 'package:journey_to_costa/pages/basements_text.dart';
import 'package:journey_to_costa/pages/first_detail_page.dart';
import 'package:journey_to_costa/pages/grid_events_list.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  bool isGeneralSelected = true;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: buildTextForAppbar(context, "Brava Events"),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Toggle Buttons
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ToggleSwitch(
              minWidth: 170.0,
              cornerRadius: 12.0,
              activeBgColors: const [
                [Color(0xff999999)],
                [Color(0xff999999)]
              ],
              inactiveBgColor: const Color(0xffECECEC),
              initialLabelIndex: isGeneralSelected ? 0 : 1,
              totalSwitches: 2,
              labels: const ['General', 'Added'],
              radiusStyle: true,
              onToggle: (index) {
                setState(() {
                  isGeneralSelected = index == 0;
                });
              },
            ),
          ),

          // Content Area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: isGeneralSelected
                  ? _buildEventGrid(provider.eventsList)
                  : _buildAddedEvents(),
            ),
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
                    onTap: () async {
                      await Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const AddEventsPage()));
                      setState(() {});
                    },
                    child: buildContainer(context)),
              ),
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

  Widget _buildAddedEvents() {
    final provider = Provider.of<AppProvider>(context, listen: false);
    if (provider.eventsList.where((e) => e.isown).toList().isEmpty) {
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
            ),
          ],
        ),
      );
    } else {
      return _buildEventGrid(
          provider.eventsList.where((e) => e.isown).toList());
    }
  }

  Widget _buildEventGrid(List<GridEventsList> eventsList) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          padding: const EdgeInsets.only(top: 10),
          itemCount: eventsList.length,
          itemBuilder: (context, index) {
            final event = eventsList[index];
            bool isSelected = event.isfavorite;

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => FirstDetailPage(event: event),
                  ),
                );
              },
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: _buildEventCard(event),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        provider.togleFavoritevent(event);
                      },
                      child: Image.asset(
                        "images/vitea.png",
                        color: isSelected ? Colors.orange : null,
                        colorBlendMode: isSelected ? BlendMode.srcIn : null,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
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
            child: event.isown && event.fileImage != null
                ? Image.file(
                    // Load from file if it's a user-created event
                    event.fileImage!,
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(
                        height: 150,
                        child: Center(
                            child: Icon(Icons.image_not_supported,
                                size: 50, color: Colors.grey)),
                      );
                    },
                  )
                : Stack(children: [
                    Image.asset(
                      // Load from assets otherwise
                      // images/inima.png
                      event.image,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox(
                          height: 150,
                          child: Center(
                              child: Icon(Icons.broken_image,
                                  size: 50, color: Colors.grey)),
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
                              provider.togleFavoritevent(event);
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
                  ]),
          ),
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
}
