import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:te_breath/te_screens/te_demo_screen/te_demo_2_screen.dart';
import 'package:te_breath/te_values/te_colors.dart';
import 'package:te_breath/te_values/te_text.dart';

class TeDemo1Screen extends StatefulWidget {
  const TeDemo1Screen({super.key});

  @override
  State<TeDemo1Screen> createState() => _TeDemo1ScreenState();
}

class _TeDemo1ScreenState extends State<TeDemo1Screen> {
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
              Image.asset(
                'te_assets/images/demo_logo.png',
                height: 66,
                width: 65,
              ),
              SizedBox(
                height: 47,
              ),
              Text(
                'Start Managing Your Allergies With Te Breath: AllergoBook',
                textAlign: TextAlign.center,
                style: TeText.header1.copyWith(color: TeColors.white),
              ),
              SizedBox(
                height: 47,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => TeDemo2Screen());
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
                  'te_assets/images/demo1.png',
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
