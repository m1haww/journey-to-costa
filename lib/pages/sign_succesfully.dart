import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:journey_to_costa/pages/app_provider.dart';
import 'package:journey_to_costa/pages/basement.dart';
import 'package:journey_to_costa/pages/basements_text.dart';
import 'package:journey_to_costa/pages/grid_events_list.dart';
import 'package:provider/provider.dart';

class SignSuccesfully extends StatefulWidget {
  final DateTime selectedDate;
  final GridEventsList event;

  const SignSuccesfully(
      {super.key, required this.selectedDate, required this.event});
  @override
  State<SignSuccesfully> createState() => _SignSuccesfullyState();
}

class _SignSuccesfullyState extends State<SignSuccesfully> {
  @override
  Widget build(BuildContext context) {
    DateTime? selectedDate;

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildheight(context, 0.02),
            Center(
                child: buildTextForFinish(
                    context, "You successfully \n signed up")),
            buildheight(context, 0.02),
            Center(
                child: buildTextUNderFInish(
                    context, "Manager will call you soon")),
            buildheight(context, 0.02),
            Container(
              padding: const EdgeInsets.all(12),
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Heading",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text("Description", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            buildheight(context, 0.02),
            Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade300,
              ),
              child: Text(
                DateFormat('dd/MM/yyyy').format(widget.selectedDate),
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            buildheight(context, 0.02),
            const Center(child: Image(image: AssetImage("images/Vector.png"))),
            const Spacer(),
            GestureDetector(
                onTap: () {
                  final provider =
                      Provider.of<AppProvider>(context, listen: false);
                  final foundEvent =
                      provider.eventsList.firstWhere((e) => e == widget.event);
                  provider.signUpToEvent(foundEvent);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: buildSaveButton(context, "Close")),
          ],
        ),
      )),
    );
  }
}
