import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:te_breath/te_models/te_anamnesis_model.dart';
import 'package:te_breath/te_values/te_colors.dart';
import 'package:te_breath/te_values/te_text.dart';

class TeAnamnesisDetailScreen extends StatelessWidget {
  final TeAnamnesisModel teAnamnesisModel;
  const TeAnamnesisDetailScreen({super.key, required this.teAnamnesisModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TeColors.lightGraySec,
      appBar: AppBar(
        backgroundColor: TeColors.lightGraySec,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back(id: 0);
          },
          child: Container(
            height: 32,
            width: 32,
            alignment: Alignment.center,
            child: SvgPicture.asset('te_assets/icons/back.svg'),
          ),
        ),
        title: Text(
          'Created medical histories',
          style: TeText.navbar.copyWith(color: TeColors.black),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: TeColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TeAnamnesisDetailCard(
                  teindex: 1,
                  telabel: 'When Complaints Arise',
                  tetext: teAnamnesisModel.anamArise,
                ),
                SizedBox(
                  height: 20,
                ),
                TeAnamnesisDetailCard(
                  teindex: 2,
                  telabel: 'Symptoms',
                  tetext: teAnamnesisModel.anamSymptoms,
                ),
                SizedBox(
                  height: 20,
                ),
                TeAnamnesisDetailCard(
                  teindex: 3,
                  telabel: 'Frequency of symptoms',
                  tetext:
                      '${teAnamnesisModel.anamNumber}\n${teAnamnesisModel.duration}',
                ),
                SizedBox(
                  height: 20,
                ),
                TeAnamnesisDetailCard(
                  teindex: 4,
                  telabel: 'Family history burden',
                  tetext: teAnamnesisModel.anamFamily,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TeAnamnesisDetailCard extends StatelessWidget {
  final int teindex;
  final String telabel;
  final String tetext;
  const TeAnamnesisDetailCard(
      {super.key,
      required this.teindex,
      required this.telabel,
      required this.tetext});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 1.5, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: TeColors.purple,
          ),
          child: Text(
            teindex.toString(),
            style: TeText.body3.copyWith(color: TeColors.yellow),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                telabel,
                style: TeText.header5.copyWith(color: TeColors.purple),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                telabel,
                style: TeText.body1.copyWith(color: TeColors.lightGray),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
