import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:te_breath/te_controllers.dart/te_anamnesis_controller.dart';
import 'package:te_breath/te_screens/te_anamnesis_screen/te_anamnesis_card.dart';
import 'package:te_breath/te_screens/te_settings/te_settings_screen.dart';
import 'package:te_breath/te_values/te_colors.dart';
import 'package:te_breath/te_values/te_text.dart';

class TeAnamnesisScreen extends StatefulWidget {
  const TeAnamnesisScreen({super.key});

  @override
  State<TeAnamnesisScreen> createState() => _TeAnamnesisScreenState();
}

class _TeAnamnesisScreenState extends State<TeAnamnesisScreen> {
  final teAnamnesisController = Get.find<TeAnamnesisController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      teAnamnesisController.getAnamnesis();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: TeColors.lightGraySec,
        appBar: AppBar(
          backgroundColor: TeColors.lightGraySec,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Anamnesis',
            style: TeText.navbar.copyWith(color: TeColors.black),
          ),
          actions: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Get.to(() => TeSettingsScreen());
              },
              child: Container(
                  height: 32,
                  width: 32,
                  alignment: Alignment.center,
                  child: SvgPicture.asset('te_assets/icons/settings.svg')),
            ),
            SizedBox(
              width: 16,
            )
          ],
        ),
        body: GetBuilder<TeAnamnesisController>(
          builder: (_) => Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: teAnamnesisController.teAnamnesis.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'No data founded',
                              style: TeText.header5
                                  .copyWith(color: TeColors.purple),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              'Created Medical Histories',
                              style: TeText.header5
                                  .copyWith(color: TeColors.black),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Expanded(
                            child: ListView.separated(
                              itemCount:
                                  teAnamnesisController.teAnamnesis.length,
                              padding: EdgeInsets.all(16),
                              itemBuilder: (context, index) => TeAnamnesisCard(
                                teAnamnesisModel:
                                    teAnamnesisController.teAnamnesis[index],
                                teOnTap: () {
                                  Get.toNamed('/anamnesis_detail',
                                      id: 0,
                                      arguments: teAnamnesisController
                                          .teAnamnesis[index]);
                                },
                                teOnEditTap: () {
                                  Get.toNamed('/add_anamnesis',
                                      id: 0,
                                      arguments: teAnamnesisController
                                          .teAnamnesis[index]);
                                },
                                teOnDeleteTap: () {
                                  teAnamnesisController.deleteAnamnesis(
                                      teAnamnesisController.teAnamnesis[index]);
                                },
                              ),
                              separatorBuilder: (context, index) => SizedBox(
                                height: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/add_anamnesis', id: 0);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
                  padding: EdgeInsets.all(11),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: TeColors.yellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 28,
                        width: 28,
                        alignment: Alignment.center,
                        child: SvgPicture.asset('te_assets/icons/add.svg'),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Anamnesis',
                        style: TeText.button.copyWith(color: TeColors.purple),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
