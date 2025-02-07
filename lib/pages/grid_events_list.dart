import 'dart:io';

class GridEventsList {
  final String image;
  final String title;
  final String info;
  final String date;
  final String time;
  final String description;
  bool issaved = false;
  bool isown = false;
  File? fileImage;

  GridEventsList({
    required this.image,
    required this.title,
    required this.info,
    required this.date,
    required this.time,
    required this.description,
  });
}
