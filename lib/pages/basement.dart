import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:journey_to_costa/pages/sistem.dart';

Widget buildContainerPlus(
    BuildContext context, String text, Color colortext, Color colorbackground) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Container(
    width: width * 0.4,
    height: 0.03,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: colorbackground,
    ),
    child: Text(
      text,
      style: TextStyle(
          fontFamily: "Sf",
          color: colortext,
          fontWeight: FontWeight.w700,
          fontSize: 16),
    ),
  );
}

Widget buildInput(
    BuildContext context, String text, Color colortext, Color colorbackground,
    {required TextEditingController controller}) {
  final width = MediaQuery.of(context).size.width;

  return Container(
    width: width * 0.9, // Set width to 90% of the screen
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: colorbackground,
      border: Border.all(
        color: const Color(0xffDCA23D),
        width: 1,
      ),
    ),
    child: TextField(
      controller: controller,

      keyboardType: TextInputType.multiline, // Enables multi-line input
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          fontFamily: "Sf",
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: colortext,
        ),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 12), // Proper padding
        border: InputBorder.none, // Removes default underline
      ),
      style: TextStyle(
        fontFamily: "Sf",
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: colortext,
      ),
    ),
  );
}

Widget buildInputBig(
    BuildContext context, String text, Color colortext, Color colorbackground,
    {required TextEditingController controller}) {
  final width = MediaQuery.of(context).size.width;

  return Container(
    width: width * 0.9, // Set width to 90% of the screen
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: colorbackground,
      border: Border.all(
        color: const Color(0xffDCA23D), // Border color
        width: 1,
      ),
    ),
    child: TextField(
      controller: controller,
      minLines: 3, // Minimum of 3 lines
      maxLines: null, // Allows unlimited lines
      keyboardType: TextInputType.multiline, // Enables multi-line input
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          fontFamily: "Sf",
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: colortext,
        ),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 12), // Proper padding
        border: InputBorder.none, // Removes default underline
      ),
      style: TextStyle(
        fontFamily: "Sf",
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: colortext,
      ),
    ),
  );
}

Widget buildContainer(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Container(
    width: width * 0.45,
    height: height * 0.045,
    decoration: BoxDecoration(
        color: const Color(0xffECECEC),
        borderRadius: BorderRadius.circular(20)),
    child: const Center(
      child: Text(
        "Add an event",
        style: TextStyle(
            fontFamily: "Sf",
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color(0xffDCA23D)),
      ),
    ),
  );
}

Widget buildheight(BuildContext context, double percentage) {
  final height = MediaQuery.of(context).size.height;
  return SizedBox(height: height * percentage);
}

Widget buildwidth(BuildContext context, double percentage) {
  final width = MediaQuery.of(context).size.width;
  return SizedBox(width: width * percentage);
}

Widget buildContainerDate(
    BuildContext context, DateTime? selectedDate, Function() onTap) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  return GestureDetector(
    onTap: onTap, // Call the date picker function when tapped
    child: Container(
      width: width * 0.35,
      height: height * 0.06,
      decoration: BoxDecoration(
        color: const Color(0xffECECEC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              const Image(image: AssetImage("images/V.png")),
              buildwidth(context, 0.02),
              Text(
                selectedDate != null
                    ? DateFormat('dd/MM/yyyy')
                        .format(selectedDate) // Show selected date
                    : "Choose date",
                style: const TextStyle(
                  fontFamily: "Sf",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget buildCoverImage(BuildContext context, File? selectedImage,
    Uint8List? imageData, VoidCallback onTap) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width * 0.3,
      height: height * 0.23,
      decoration: BoxDecoration(
        color: const Color(0xffECECEC),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xffDCA23D),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: selectedImage == null && imageData == null
            ? Center(
                child: Image.asset("images/plus.png", fit: BoxFit.cover),
              )
            : (selectedImage != null
                ? Image.file(selectedImage, fit: BoxFit.cover)
                : Image.memory(imageData!, fit: BoxFit.cover)),
      ),
    ),
  );
}

Widget buildSaveButton(BuildContext context, String text) {
  final width = MediaQuery.of(context).size.width;

  return Container(
    width: width,
    padding: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: const Color(0xffDCA23D),
    ),
    child: Center(
      child: Text(
        text,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget buildContainerSettings(BuildContext context, String text, String image) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  return Container(
    width: width * 0.9,
    height: height * 0.09,
    decoration: BoxDecoration(
      color: const Color(0xffECECEC),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(image),
            color: Color(0xffDCA23D),
          ),
          buildwidth(context, 0.03),
          Text(
            text,
            style: const TextStyle(
              fontFamily: "Sf",
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildContainerWorkTime(BuildContext context, CostaRestaurants event) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  return Container(
    width: width * 0.9,
    height: height * 0.06,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: const Color(0xffECECEC), // Outline color
        width: 1, // Outline width
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Work time",
            style: const TextStyle(
              fontFamily: "Sf",
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          buildwidth(context, 0.09),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Image(
                    image: AssetImage("images/cronometru.png"),
                  ),
                  buildwidth(context, 0.02),
                  Text(
                    event.time,
                    style: const TextStyle(
                      fontFamily: "Sf",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xff303030),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
