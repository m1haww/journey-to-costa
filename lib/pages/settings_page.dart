import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      await launchUrl(_url,
          mode: LaunchMode
              .externalApplication); // Use external browser for both web and mobile
    } else {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildTextForAppbar(context, "Settings"),
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
            buildContainerSettings(context, "Rate Us", "images/d.png"),
          ],
        ),
      )),
    );
  }
}
