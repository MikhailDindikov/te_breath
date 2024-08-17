import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:te_breath/te_controllers.dart/te_reminders_controller.dart';
import 'package:te_breath/te_models/te_reminder_model.dart';
import 'package:te_breath/te_values/te_colors.dart';
import 'package:te_breath/te_values/te_text.dart';

class TeAddReminderScreen extends StatefulWidget {
  final TeReminderModel? teReminderModel;
  const TeAddReminderScreen({super.key, this.teReminderModel});

  @override
  State<TeAddReminderScreen> createState() => _TeAddReminderScreenState();
}

class _TeAddReminderScreenState extends State<TeAddReminderScreen> {
  final teRemindersController = Get.find<TeRemindersController>();
  final _teAddName = TextEditingController();
  final _teAddDosage = TextEditingController();
  late final RxInt _teAddTimingType;
  final _teAddSpecify = TextEditingController();
  final _teAddNotes = TextEditingController();
  late final RxInt _teAddIconType;

  @override
  void initState() {
    _teAddName.text = widget.teReminderModel == null
        ? ''
        : widget.teReminderModel!.reminderName;
    _teAddDosage.text = widget.teReminderModel == null
        ? ''
        : widget.teReminderModel!.reminderDosage;
    _teAddTimingType = (widget.teReminderModel == null
            ? 0
            : widget.teReminderModel!.reminderTimerType)
        .obs;
    _teAddSpecify.text = widget.teReminderModel == null
        ? ''
        : widget.teReminderModel!.reminderSpecifyTime;
    _teAddNotes.text = widget.teReminderModel == null
        ? ''
        : widget.teReminderModel!.reminderNotes;
    _teAddIconType = (widget.teReminderModel == null
            ? 0
            : widget.teReminderModel!.reminderIconType)
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
            Get.back(id: 1);
          },
          child: Container(
            height: 32,
            width: 32,
            alignment: Alignment.center,
            child: SvgPicture.asset('te_assets/icons/back.svg'),
          ),
        ),
        title: Text(
          'Reminder',
          style: TeText.navbar.copyWith(color: TeColors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                'Name of the medication',
                style: TeText.header5.copyWith(color: TeColors.black),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _teAddName,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: TeColors.lightBlueSec,
                  hintText: 'Name..',
                  hintStyle: TeText.body3.copyWith(color: TeColors.lightGray),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Text(
                'Dosage',
                style: TeText.header5.copyWith(color: TeColors.black),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _teAddDosage,
                maxLines: 2,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: TeColors.lightBlueSec,
                  hintText: 'Amount to be taken..',
                  hintStyle: TeText.body3.copyWith(color: TeColors.lightGray),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Text(
                'Timing',
                style: TeText.header5.copyWith(color: TeColors.black),
              ),
              SizedBox(
                height: 21,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _teAddTimingType.value = 0;
                    },
                    child: Obx(
                      () => Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 22.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _teAddTimingType.value == 0
                              ? TeColors.purple
                              : TeColors.lightBlueSec,
                        ),
                        child: Text(
                          'Before meal',
                          style: TeText.body2.copyWith(
                              color: _teAddTimingType.value == 0
                                  ? TeColors.white
                                  : TeColors.lightGray),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      _teAddTimingType.value = 1;
                    },
                    child: Obx(
                      () => Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 22.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _teAddTimingType.value == 1
                              ? TeColors.purple
                              : TeColors.lightBlueSec,
                        ),
                        child: Text(
                          'During meal',
                          style: TeText.body2.copyWith(
                              color: _teAddTimingType.value == 1
                                  ? TeColors.white
                                  : TeColors.lightGray),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  _teAddTimingType.value = 2;
                },
                child: Obx(
                  () => Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 22.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _teAddTimingType.value == 2
                          ? TeColors.purple
                          : TeColors.lightBlueSec,
                    ),
                    child: Text(
                      'After meal',
                      style: TeText.body2.copyWith(
                          color: _teAddTimingType.value == 2
                              ? TeColors.white
                              : TeColors.lightGray),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Text(
                'Specify time',
                style: TeText.header5.copyWith(color: TeColors.black),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _teAddSpecify,
                maxLines: 2,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: TeColors.lightBlueSec,
                  hintText: '2 hours before',
                  hintStyle: TeText.body3.copyWith(color: TeColors.lightGray),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Text(
                'Notes',
                style: TeText.header5.copyWith(color: TeColors.black),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _teAddNotes,
                maxLines: 2,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: TeColors.lightBlueSec,
                  hintText: 'Add additional info',
                  hintStyle: TeText.body3.copyWith(color: TeColors.lightGray),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Text(
                'Icon',
                style: TeText.header5.copyWith(color: TeColors.black),
              ),
              SizedBox(
                height: 21,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _teAddIconType.value = 0;
                    },
                    child: Obx(
                      () => Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _teAddIconType.value == 0
                                ? TeColors.purple
                                : TeColors.lightBlueSec,
                          ),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'te_assets/icons/syringe.svg',
                            color: _teAddIconType.value == 0
                                ? TeColors.white
                                : null,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      _teAddIconType.value = 1;
                    },
                    child: Obx(
                      () => Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _teAddIconType.value == 1
                                ? TeColors.purple
                                : TeColors.lightBlueSec,
                          ),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'te_assets/icons/pill.svg',
                            color: _teAddIconType.value == 1
                                ? TeColors.white
                                : null,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      _teAddIconType.value = 2;
                    },
                    child: Obx(
                      () => Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _teAddIconType.value == 2
                                ? TeColors.purple
                                : TeColors.lightBlueSec,
                          ),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'te_assets/icons/tablet.svg',
                            color: _teAddIconType.value == 2
                                ? TeColors.white
                                : null,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () async {
                  if (_teAddName.text.isEmpty ||
                      _teAddDosage.text.isEmpty ||
                      _teAddSpecify.text.isEmpty ||
                      _teAddNotes.text.isEmpty) {
                    Get.showSnackbar(GetSnackBar(
                      duration: Duration(milliseconds: 3000),
                      backgroundColor: TeColors.purple,
                      messageText: Text(
                        'Please fill out the entire form.',
                        style: TeText.header5.copyWith(color: TeColors.white),
                      ),
                    ));
                  } else {
                    if (widget.teReminderModel == null) {
                      await teRemindersController.addReminder(TeReminderModel(
                        id: 0,
                        reminderName: _teAddName.text,
                        reminderDosage: _teAddDosage.text,
                        reminderTimerType: _teAddTimingType.value,
                        reminderSpecifyTime: _teAddSpecify.text,
                        reminderNotes: _teAddNotes.text,
                        reminderIconType: _teAddIconType.value,
                      ));
                    } else {
                      await teRemindersController
                          .updateReminders(TeReminderModel(
                        id: widget.teReminderModel!.id,
                        reminderName: _teAddName.text,
                        reminderDosage: _teAddDosage.text,
                        reminderTimerType: _teAddTimingType.value,
                        reminderSpecifyTime: _teAddSpecify.text,
                        reminderNotes: _teAddNotes.text,
                        reminderIconType: _teAddIconType.value,
                      ));
                    }

                    teRemindersController.getReminders();

                    Get.back(id: 1);
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
