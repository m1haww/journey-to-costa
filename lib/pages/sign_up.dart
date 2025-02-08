import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:journey_to_costa/pages/app_provider.dart';
import 'package:journey_to_costa/pages/basement.dart';
import 'package:journey_to_costa/pages/basements_text.dart';
import 'package:journey_to_costa/pages/grid_events_list.dart';
import 'package:journey_to_costa/pages/sign_succesfully.dart';
import 'package:journey_to_costa/pages/sistem.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  final GridEventsList event;

  const SignUp({super.key, required this.event});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Signup? signup;
  DateTime? _selectedDate;
  bool _isSaveEnabled = false;

  final TextEditingController _namecontroler = TextEditingController();
  final TextEditingController _numbercontroler = TextEditingController();
  final TextEditingController _commentcontroler = TextEditingController();

  @override
  void initState() {
    super.initState();
    _namecontroler.addListener(_updateSaveButtonState);
    _numbercontroler.addListener(_updateSaveButtonState);
    _commentcontroler.addListener(_updateSaveButtonState);
  }

  @override
  void dispose() {
    _namecontroler.dispose();
    _numbercontroler.dispose();
    _commentcontroler.dispose();
    super.dispose();
  }

  void _updateSaveButtonState() {
    setState(() {
      _isSaveEnabled = _namecontroler.text.isNotEmpty &&
          _numbercontroler.text.isNotEmpty &&
          _commentcontroler.text.isNotEmpty &&
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
  Widget build(
    BuildContext context,
  ) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: buildTextForAdd(context, "Sign up the event"),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.event.title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Sf",
                        color: Colors.black),
                  ),
                  Text(
                    widget.event.description,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Sf",
                        color: Color(0xff999999)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            buildheight(context, 0.02),
            buildContainerDate(context, _selectedDate,
                () => _showCupertinoDatePicker(context)),
            buildheight(context, 0.02),
            buildInput(context, "Phone Number", Colors.grey, Colors.white,
                controller: _numbercontroler),
            buildheight(context, 0.02),
            buildInput(context, "Name", Colors.grey, Colors.white,
                controller: _namecontroler),
            buildheight(context, 0.02),
            buildInputBig(context, "Comment", Colors.black, Colors.white,
                Color(0xff999999),
                controller: _commentcontroler),
            const Spacer(),
            GestureDetector(
              onTap: _isSaveEnabled
                  ? () {
                      final provider =
                          Provider.of<AppProvider>(context, listen: false);

                      final newSignup = Signup(
                        date: _selectedDate != null
                            ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                            : 'Not selected',
                        name: _namecontroler.text,
                        number: _numbercontroler.text,
                        comment: _commentcontroler.text,
                      );

                      provider.addSignup(newSignup);

                      print(
                          "Signup added: ${newSignup.name}, ${newSignup.number}, ${newSignup.comment}, ${newSignup.date}");

                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => SignSuccesfully(
                            selectedDate: _selectedDate!,
                            event: widget.event,
                          ),
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
                      print(
                          "Form is incomplete. Name: ${_namecontroler.text}, Number: ${_numbercontroler.text}, Comment: ${_commentcontroler.text}");
                    },
              child: buildSaveButton(context, "Save"),
            ),
          ],
        ),
      ),
    );
  }
}
