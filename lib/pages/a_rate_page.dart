import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_costa/pages/aa_rate_succesful_page.dart';
import 'package:journey_to_costa/pages/basement.dart';
import 'package:journey_to_costa/pages/basements_text.dart';
import 'package:journey_to_costa/pages/sistem.dart';

class ARatePage extends StatefulWidget {
  final Food food;

  const ARatePage({
    super.key,
    required this.food,
  });

  @override
  State<ARatePage> createState() => _ARatePageState();
}

class _ARatePageState extends State<ARatePage> {
  int selectedStars = 0;
  final TextEditingController _comment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        centerTitle: false,
        title: buildTextForAppbar(context, "Rate the dish"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildheight(context, 0.02),
            buildContainerRate(
              context,
              widget.food,
            ),
            buildheight(context, 0.02),
            buildTextdetails(context, "Comment"),
            buildheight(context, 0.02),
            buildInputBig(context, "Comment", Colors.black,
                const Color(0xffF6F6F6), Color(0xff999999),
                controller: _comment),
            buildheight(context, 0.02),
            buildTextdetails(context, "Grade"),
            buildheight(context, 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedStars = index + 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Icon(
                      Icons.star,
                      size: 50,
                      color: index < selectedStars
                          ? const Color(0xffDCA23D)
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => AaRateSuccesfulPage(
                          food: widget.food,
                        ),
                      ));
                },
                child: buildSaveButton(context, "Save"))
          ],
        ),
      )),
    );
  }
}
