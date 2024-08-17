import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:te_breath/te_screens/te_main_screen/te_main_screen.dart';
import 'package:te_breath/te_values/te_colors.dart';
import 'package:te_breath/te_values/te_text.dart';

class TeDemo2Screen extends StatefulWidget {
  const TeDemo2Screen({super.key});

  @override
  State<TeDemo2Screen> createState() => _TeDemo2ScreenState();
}

class _TeDemo2ScreenState extends State<TeDemo2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TeColors.purple,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Text(
                'Te Breath: AllergoBook',
                textAlign: TextAlign.center,
                style: TeText.header1.copyWith(color: TeColors.white),
              ),
              SizedBox(
                height: 31,
              ),
              Text(
                '''
• Manage allergies
• Blooming tips
• Med reminders
• Track symptoms
• Health analysis
• Pollen map
• Diet recipes (Premium)''',
                style: TeText.header3.copyWith(color: TeColors.white),
              ),
              SizedBox(
                height: 47,
              ),
              GestureDetector(
                onTap: () {
                  final teBox = GetStorage();
                  teBox.write('showTeDemo', false);
                  Get.offAll(() => TeMainScreen());
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: TeColors.white,
                  ),
                  child: Text(
                    'Next',
                    style: TeText.header1.copyWith(color: TeColors.purple),
                  ),
                ),
              ),
              SizedBox(
                height: 37,
              ),
              Expanded(
                child: Image.asset(
                  'te_assets/images/demo2.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
