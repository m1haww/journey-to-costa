import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_costa/pages/app_provider.dart';
import 'package:journey_to_costa/pages/basement.dart';
import 'package:journey_to_costa/pages/basements_text.dart';
import 'package:journey_to_costa/pages/sistem.dart';
import 'package:provider/provider.dart';

class AddEventsSucces extends StatefulWidget {
  const AddEventsSucces({super.key});

  @override
  State<AddEventsSucces> createState() => _AddEventsSuccesState();
}

class _AddEventsSuccesState extends State<AddEventsSucces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildheight(context, 0.04),
            Center(
                child: buildTextForFinish(
                    context, "Event is successfully \n added")),
            buildheight(context, 0.02),
            Center(
              child: buildTextUNderFInish(
                  context, "You can find it in the added events"),
            ),
            buildheight(context, 0.02),
            const Center(child: Image(image: AssetImage("images/Vector.png"))),
            buildheight(context, 0.04),
            const Spacer(),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: buildSaveButton(context, "Close"))
          ],
        ),
      )),
    );
  }
}
