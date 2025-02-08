import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_costa/pages/basement.dart';
import 'package:journey_to_costa/pages/basements_text.dart';
import 'package:journey_to_costa/pages/sistem.dart';

class AaRateSuccesfulPage extends StatefulWidget {
  final Food food;

  const AaRateSuccesfulPage({super.key, required this.food});
  @override
  State<AaRateSuccesfulPage> createState() => _AaRateSuccesfulPageState();
}

class _AaRateSuccesfulPageState extends State<AaRateSuccesfulPage> {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildTextForFinish(context, "You successfully rated \n this dish"),
            buildheight(context, 0.02),
            Padding(
              padding: const EdgeInsets.only(left: 70.0, right: 70),
              child:
                  buildTextUNderFInish(context, "Manager will call you soon"),
            ),
            buildheight(context, 0.02),
            buildContainerRate(
              context,
              widget.food,
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
                child: buildSaveButton(context, "Close")),
          ],
        ),
      )),
    );
  }
}
