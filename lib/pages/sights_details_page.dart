import 'package:flutter/material.dart';
import 'package:journey_to_costa/pages/basement.dart';
import 'package:journey_to_costa/pages/sistem.dart';

class SightsDetailsPage extends StatefulWidget {
  final Sights sights;

  const SightsDetailsPage({super.key, required this.sights});
  @override
  State<SightsDetailsPage> createState() => _SightsDetailsPageState();
}

class _SightsDetailsPageState extends State<SightsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Stack(children: [
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Image.asset(
                      widget.sights.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 10,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'images/back.png',
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.sights.miniinfo,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Date: ${widget.sights.description}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    buildheight(context, 0.02),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
