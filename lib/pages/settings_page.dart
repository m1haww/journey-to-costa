import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:journey_to_costa/pages/basement.dart';
import 'package:journey_to_costa/pages/basements_text.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final Uri _url = Uri.parse(
      'https://www.termsfeed.com/live/4501b115-cd68-429a-bee2-7819a50f0d47');

  Future<void> _launchUrl() async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Could not launch $_url');
    }
  }

  final InAppReview inAppReview = InAppReview.instance;

  // Function to handle "Rate Us" action
  Future<void> _rateApp() async {
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview(); // In-app review request
    } else {
      // If in-app review is not available, open the store listing
      inAppReview.openStoreListing(
          appStoreId: 'YOUR_APP_STORE_ID'); // Replace with your App Store ID
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildTextForAppbar(context, "Settings"),
        centerTitle: true,
        leading: null,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildheight(context, 0.02),
              GestureDetector(
                  onTap: _launchUrl,
                  child: buildContainerSettings(
                      context, "Terms of use", "images/a.png")),
              buildheight(context, 0.02),
              GestureDetector(
                onTap: _launchUrl,
                child: buildContainerSettings(
                    context, "Developer website", "images/b.png"),
              ),
              buildheight(context, 0.02),
              GestureDetector(
                  onTap: _launchUrl,
                  child: buildContainerSettings(
                      context, "Privacy Policy", "images/c.png")),
              buildheight(context, 0.02),
              GestureDetector(
                onTap: _rateApp, // Trigger the rate action
                child:
                    buildContainerSettings(context, "Rate Us", "images/d.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
