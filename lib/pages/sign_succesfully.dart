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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildheight(context, 0.02),
            buildTextForFinish(context, "You successfully \n signed up"),
            buildheight(context, 0.02),
            buildTextUNderFInish(context, "Manager will call you soon"),
            buildheight(context, 0.02),
            Container(
              padding: const EdgeInsets.all(12),
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.event.title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Sf",
                        color: Colors.black),
                  ),
                  Text(
                    widget.event.description,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Sf",
                        color: Color(0xff999999)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
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
