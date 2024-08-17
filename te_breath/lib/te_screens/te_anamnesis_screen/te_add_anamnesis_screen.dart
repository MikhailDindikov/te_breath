import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:te_breath/te_controllers.dart/te_anamnesis_controller.dart';
import 'package:te_breath/te_models/te_anamnesis_model.dart';
import 'package:te_breath/te_values/te_colors.dart';
import 'package:te_breath/te_values/te_text.dart';

class TeAddAnamnesisScreen extends StatefulWidget {
  final TeAnamnesisModel? teAnamnesisModel;
  const TeAddAnamnesisScreen({super.key, this.teAnamnesisModel});

  @override
  State<TeAddAnamnesisScreen> createState() => _TeAddAnamnesisScreenState();
}

class _TeAddAnamnesisScreenState extends State<TeAddAnamnesisScreen> {
  final teAnamnesisController = Get.find<TeAnamnesisController>();
  late final RxString _teArise;
  late final RxString _teSymptoms;
  late final RxString _teFamilys;
  final _teCountController = TextEditingController();
  final _teDurationController = TextEditingController();

  final _teExpArise = ExpandableController();
  final _teExpSymptoms = ExpandableController();
  final _teExpFamilys = ExpandableController();

  final _arises = [
    'Contact with animals',
    'Consumption of food',
    'Use of medications',
    'Respiratory illnesses',
    'Other cases',
  ];

  final _symptoms = [
    'Itchy eyes',
    'Swelling',
    'Eyelid swelling',
    'Redness of the eyes',
    'Nasal congestion',
    'Itchy nose',
    'Runny nose',
    'Sneezing',
    'Nausea',
    'Abdominal heaviness',
    'Bloating',
    'Diarrhea',
    'Vomiting',
    'Shortness of breath',
    'Difficulty breathing',
    'Heaviness on inhalation',
    'Dry cough',
    'Wet cough',
    'Dizziness',
    'Clouded consciousness',
  ];

  final _familys = [
    'YES',
    'NO',
  ];

  @override
  void initState() {
    _teCountController.text = widget.teAnamnesisModel == null
        ? ''
        : widget.teAnamnesisModel!.anamNumber;
    _teDurationController.text = widget.teAnamnesisModel == null
        ? ''
        : widget.teAnamnesisModel!.duration;
    _teArise = (widget.teAnamnesisModel == null
            ? 'When Complaints Arise'
            : widget.teAnamnesisModel!.anamArise)
        .obs;
    _teSymptoms = (widget.teAnamnesisModel == null
            ? 'Symptoms'
            : widget.teAnamnesisModel!.anamSymptoms)
        .obs;
    _teFamilys = (widget.teAnamnesisModel == null
            ? 'Family History Burden'
            : widget.teAnamnesisModel!.anamFamily)
        .obs;

    super.initState();
  }

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
          'Anamnesis',
          style: TeText.navbar.copyWith(color: TeColors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 25,
              ),
              Flexible(
                child: ExpandableNotifier(
                  controller: _teExpArise,
                  child: Expandable(
                    collapsed: GestureDetector(
                      onTap: () {
                        _teExpArise.toggle();
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: TeColors.purple,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Obx(
                                () => Text(
                                  _teArise.value,
                                  style: TeText.header5
                                      .copyWith(color: TeColors.white),
                                ),
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: 2,
                              child: Container(
                                  height: 32,
                                  width: 32,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                      'te_assets/icons/up.svg')),
                            ),
                          ],
                        ),
                      ),
                    ),
                    expanded: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _teExpArise.toggle();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 16),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: TeColors.purple,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Obx(
                                    () => Text(
                                      _teArise.value,
                                      style: TeText.header5
                                          .copyWith(color: TeColors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                    height: 32,
                                    width: 32,
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                        'te_assets/icons/up.svg')),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: TeColors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                color: Color.fromRGBO(64, 53, 138, 0.1),
                              )
                            ],
                          ),
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _arises.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                _teArise.value = _arises[index];
                                _teExpArise.toggle();
                              },
                              behavior: HitTestBehavior.opaque,
                              child: Text(
                                _arises[index],
                                style: TeText.body1
                                    .copyWith(color: TeColors.black),
                              ),
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Flexible(
                child: ExpandableNotifier(
                  controller: _teExpSymptoms,
                  child: Expandable(
                    collapsed: GestureDetector(
                      onTap: () {
                        _teExpSymptoms.toggle();
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: TeColors.purple,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Obx(
                                () => Text(
                                  _teSymptoms.value,
                                  style: TeText.header5
                                      .copyWith(color: TeColors.white),
                                ),
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: 2,
                              child: Container(
                                  height: 32,
                                  width: 32,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                      'te_assets/icons/up.svg')),
                            ),
                          ],
                        ),
                      ),
                    ),
                    expanded: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _teExpSymptoms.toggle();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 16),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: TeColors.purple,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Obx(
                                    () => Text(
                                      _teSymptoms.value,
                                      style: TeText.header5
                                          .copyWith(color: TeColors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                    height: 32,
                                    width: 32,
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                        'te_assets/icons/up.svg')),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: TeColors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                color: Color.fromRGBO(64, 53, 138, 0.1),
                              )
                            ],
                          ),
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _symptoms.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                _teSymptoms.value = _symptoms[index];
                                _teExpSymptoms.toggle();
                              },
                              behavior: HitTestBehavior.opaque,
                              child: Text(
                                _symptoms[index],
                                style: TeText.body1
                                    .copyWith(color: TeColors.black),
                              ),
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: TeColors.purple,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              height: 32,
                              child: Text(
                                'Frequency of Symptoms',
                                style: TeText.header5
                                    .copyWith(color: TeColors.white),
                              ),
                            ),
                          ),
                          SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: TeColors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          color: Color.fromRGBO(64, 53, 138, 0.1),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _teCountController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: TeColors.lightBlueSec,
                            hintText: 'Count',
                            hintStyle: TeText.body3
                                .copyWith(color: TeColors.lightGray),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _teDurationController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: TeColors.lightBlueSec,
                            hintText: 'Duration',
                            hintStyle: TeText.body3
                                .copyWith(color: TeColors.lightGray),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Flexible(
                child: ExpandableNotifier(
                  controller: _teExpFamilys,
                  child: Expandable(
                    collapsed: GestureDetector(
                      onTap: () {
                        _teExpFamilys.toggle();
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: TeColors.purple,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Obx(
                                () => Text(
                                  _teFamilys.value,
                                  style: TeText.header5
                                      .copyWith(color: TeColors.white),
                                ),
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: 2,
                              child: Container(
                                  height: 32,
                                  width: 32,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                      'te_assets/icons/up.svg')),
                            ),
                          ],
                        ),
                      ),
                    ),
                    expanded: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _teExpFamilys.toggle();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 16),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: TeColors.purple,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Obx(
                                    () => Text(
                                      _teFamilys.value,
                                      style: TeText.header5
                                          .copyWith(color: TeColors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                    height: 32,
                                    width: 32,
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                        'te_assets/icons/up.svg')),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: TeColors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                color: Color.fromRGBO(64, 53, 138, 0.1),
                              )
                            ],
                          ),
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _familys.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                _teFamilys.value = _familys[index];
                                _teExpFamilys.toggle();
                              },
                              behavior: HitTestBehavior.opaque,
                              child: Text(
                                _familys[index],
                                style: TeText.body1
                                    .copyWith(color: TeColors.black),
                              ),
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () async {
                  if (_teCountController.text.isEmpty ||
                      _teDurationController.text.isEmpty ||
                      _teArise.value == 'When Complaints Arise' ||
                      _teSymptoms.value == 'Symptoms' ||
                      _teFamilys.value == 'Family History Burden') {
                    Get.showSnackbar(GetSnackBar(
                      duration: Duration(milliseconds: 3000),
                      backgroundColor: TeColors.purple,
                      messageText: Text(
                        'Please fill out the entire form.',
                        style: TeText.header5.copyWith(color: TeColors.white),
                      ),
                    ));
                  } else {
                    if (widget.teAnamnesisModel == null) {
                      await teAnamnesisController.addAnamnesis(TeAnamnesisModel(
                        id: 0,
                        anamArise: _teArise.value,
                        anamSymptoms: _teSymptoms.value,
                        anamNumber: _teCountController.text,
                        duration: _teDurationController.text,
                        anamFamily: _teFamilys.value,
                      ));
                    } else {
                      await teAnamnesisController
                          .updateAnamnesis(TeAnamnesisModel(
                        id: widget.teAnamnesisModel!.id,
                        anamArise: _teArise.value,
                        anamSymptoms: _teSymptoms.value,
                        anamNumber: _teCountController.text,
                        duration: _teDurationController.text,
                        anamFamily: _teFamilys.value,
                      ));
                    }

                    teAnamnesisController.getAnamnesis();
                    Get.back(id: 0);
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: TeColors.yellow,
                  ),
                  child: Text(
                    'Save',
                    style: TeText.header2.copyWith(color: TeColors.purple),
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
