import 'package:flutter/material.dart';

Widget buildTextForAppbar(BuildContext context, String text) {
  return Row(
    children: [
      Text(
        text,
        style: const TextStyle(
            fontFamily: "Sf",
            fontWeight: FontWeight.w800,
            fontSize: 28,
            color: Colors.black),
      ),
    ],
  );
}

Widget buildTextForTitleEvents(BuildContext context, String text) {
  return Text(
    text,
    style: const TextStyle(
        fontFamily: "Sf",
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: Colors.black),
  );
}

Widget buildTextForUnderTitleEvents(BuildContext context, String text) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: "Sf",
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Colors.black.withOpacity(0.4)),
  );
}

Widget buildTextForAdd(BuildContext context, String text) {
  return Row(
    children: [
      Text(
        text,
        style: const TextStyle(
            fontFamily: "Sf",
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.black),
      ),
    ],
  );
}

Widget buildTextForINPUT(BuildContext context, String text) {
  return Text(
    text,
    style: const TextStyle(
        fontFamily: "Sf",
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: Colors.black),
  );
}

Widget buildTextForFinish(BuildContext context, String text) {
  return Row(
    children: [
      Text(
        textAlign: TextAlign.center,
        text,
        style: const TextStyle(
            fontFamily: "Sf",
            fontWeight: FontWeight.w700,
            fontSize: 34,
            color: Colors.black),
      ),
    ],
  );
}

Widget buildTextUNderFInish(BuildContext context, String text) {
  return Row(
    children: [
      Text(
        text,
        style: const TextStyle(
            fontFamily: "Sf",
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black),
      ),
    ],
  );
}

Widget buildTextdetails(BuildContext context, String text) {
  return Row(
    children: [
      Text(
        text,
        style: const TextStyle(
            fontFamily: "Sf",
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.black),
      ),
    ],
  );
}

Widget buildTextWorkTime(BuildContext context, String text) {
  return Row(
    children: [
      Text(
        text,
        style: const TextStyle(
            fontFamily: "Sf",
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.black),
      ),
    ],
  );
}
