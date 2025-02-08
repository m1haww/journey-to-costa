import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_costa/pages/basement.dart';
import 'package:journey_to_costa/pages/basements_text.dart';

class AaRateSuccesfulPage extends StatefulWidget {
  const AaRateSuccesfulPage({super.key});

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
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centers vertically
        crossAxisAlignment: CrossAxisAlignment.center, // Centers horizontally
        children: [
          buildTextForFinish(context, "You successfully \n signed up"),
          buildheight(context, 0.02),
          buildTextUNderFInish(context, "Manager will call you soon"),
          buildheight(context, 0.02),
        ],
      )),
    );
  }
}
