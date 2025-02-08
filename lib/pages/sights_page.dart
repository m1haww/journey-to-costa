import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_costa/pages/app_provider.dart';
import 'package:journey_to_costa/pages/basement.dart';
import 'package:journey_to_costa/pages/basements_text.dart';
import 'package:journey_to_costa/pages/sights_details_page.dart';
import 'package:journey_to_costa/pages/sistem.dart';
import 'package:provider/provider.dart';

class SightsPage extends StatefulWidget {
  const SightsPage({
    super.key,
  });
  @override
  State<SightsPage> createState() => _SightsPageState();
}

class _SightsPageState extends State<SightsPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: buildTextForAppbar(context, "Brava sights"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: _buildEventGrid(provider.sights),
            ),
          ],
        ),
      )),
    );
  }

  Widget _buildEventGrid(List<Sights> sights) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, // Display in grid format
        mainAxisSpacing: 50,
        childAspectRatio: 1.5,
      ),
      itemCount: sights.length,
      itemBuilder: (context, index) {
        final sight = sights[index];
        return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => SightsDetailsPage(
                            sights: sight,
                          )));
            },
            child: _buildEventCard(sight));
      },
    );
  }

  Widget _buildEventCard(Sights sights) {
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
                sights.image,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Consumer<AppProvider>(
                builder: (context, provider, child) {
                  bool isSelected = sights.isfavorite;

                  return GestureDetector(
                    onTap: () {
                      provider.togleFavoritSight(sights);
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
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sights.title,
                  style: const TextStyle(
                    fontFamily: "Sf",
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                buildheight(context, 0.01),
                Text(
                  sights.description,
                  style: TextStyle(
                    fontFamily: "Sf",
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.4),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
