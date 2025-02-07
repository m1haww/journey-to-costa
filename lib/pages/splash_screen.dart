import 'dart:async';

import 'package:flutter/material.dart';
import 'package:journey_to_costa/pages/app_provider.dart';
import 'package:journey_to_costa/pages/navigation_page.dart';
import 'package:path_provider/path_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavigationPage()),
      );
    });
  }

  Future<void> load() async {
    final directoy = await getTemporaryDirectory();
    directorypath = directoy.path;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
