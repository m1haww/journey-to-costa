import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:journey_to_costa/pages/add_events_succes.dart';
import 'package:journey_to_costa/pages/app_provider.dart';
import 'package:journey_to_costa/pages/basement.dart';
import 'package:journey_to_costa/pages/basements_text.dart';
import 'package:journey_to_costa/pages/grid_events_list.dart';
import 'package:journey_to_costa/pages/sistem.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class AddEventsPage extends StatefulWidget {
  const AddEventsPage({super.key});

  @override
  State<AddEventsPage> createState() => _AddEventsPageState();
}

class _AddEventsPageState extends State<AddEventsPage> {
  DateTime? _selectedDate;
  SistemEvent? sistemEvent;
  bool _issave = false;
  final TextEditingController _namecontrolerr = TextEditingController();
  final TextEditingController _descriptioncontroler = TextEditingController();
  File? _selectedImage;
  Uint8List? _imageData;
  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from the gallery and cache it
  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      print("Image selected: ${pickedImage.path}");

      if (kIsWeb) {
        Uint8List imageBytes = await pickedImage.readAsBytes();
        setState(() {
          _imageData = imageBytes;
        });
      } else {
        final directory = await getTemporaryDirectory();
        final cachedImage = File('${directory.path}/${pickedImage.name}');
        await File(pickedImage.path).copy(cachedImage.path);

        setState(() {
          _selectedImage = cachedImage;
          print("Image cached at: ${cachedImage.path}");
        });
      }
    } else {
      print("No image selected.");
    }
  }

  @override
  void initState() {
    super.initState();
    _namecontrolerr.addListener(_updateSaveButtonState);
    _descriptioncontroler.addListener(_updateSaveButtonState);
  }

  @override
  void dispose() {
    _namecontrolerr.dispose();
    _descriptioncontroler.dispose();
    super.dispose();
  }

  void _updateSaveButtonState() {
    setState(() {
      _issave = _namecontrolerr.text.isNotEmpty &&
          _descriptioncontroler.text.isNotEmpty &&
          _selectedDate != null;
    });
  }

  Future<void> _showCupertinoDatePicker(BuildContext context) async {
    DateTime tempDate = _selectedDate ?? DateTime.now();

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: 300,
          child: Column(
            children: [
              Expanded(
                child: CupertinoDatePicker(
                  initialDateTime: tempDate,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime newDate) {
                    tempDate = newDate;
                  },
                ),
              ),
              CupertinoButton(
                child: const Text(
                  "Confirm",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.activeBlue,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _selectedDate = tempDate;
                    _updateSaveButtonState();
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back)),
            buildwidth(context, 0.02),
          ],
        ),
        centerTitle: false,
        title: buildTextForAdd(context, "Adding an event"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildheight(context, 0.04),
              buildContainerDate(context, _selectedDate,
                  () => _showCupertinoDatePicker(context)),
              buildheight(context, 0.02),
              buildTextForINPUT(context, "Event name"),
              buildheight(context, 0.02),
              buildInput(context, "Task name", Colors.grey, Colors.white,
                  controller: _namecontrolerr),
              buildheight(context, 0.02),
              buildTextForINPUT(context, "Description"),
              buildheight(context, 0.02),
              buildInputBig(context, "Task name", Colors.grey, Colors.white,
                  controller: _descriptioncontroler),
              buildheight(context, 0.02),
              buildTextForINPUT(context, "Cover"),
              buildheight(context, 0.03),
              buildCoverImage(context, _selectedImage, _imageData, _pickImage),
              buildheight(context, 0.03),
              GestureDetector(
                  onTap: _issave
                      ? () {
                          final provider =
                              Provider.of<AppProvider>(context, listen: false);

                          final newEvent = GridEventsList(
                            date: _selectedDate != null
                                ? DateFormat('yyyy-MM-dd')
                                    .format(_selectedDate!)
                                : 'Not selected',
                            description: _descriptioncontroler.text,
                            info: _namecontrolerr.text,
                            image: (_selectedImage?.path ?? "images/V.png"),
                            time: DateFormat('HH:mm').format(DateTime.now()),
                            title: '',
                          );

                          newEvent.isown = true;
                          newEvent.fileImage = _selectedImage;
                          provider.addEvent(newEvent);

                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => AddEventsSucces(),
                            ),
                          );
                        }
                      : () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Please complete all required fields.",
                                style: TextStyle(fontFamily: "Sf"),
                              ),
                              backgroundColor: Color(0xffE5182B),
                            ),
                          );
                        },
                  child: buildSaveButton(context, "Save")),
              buildheight(context, 0.03),
            ],
          ),
        ),
      )),
    );
  }
}
