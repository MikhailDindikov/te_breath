import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:te_breath/te_controllers.dart/te_notes_controller.dart';
import 'package:te_breath/te_controllers.dart/te_reminders_controller.dart';
import 'package:te_breath/te_screens/te_notes_screen/te_note_card.dart';
import 'package:te_breath/te_screens/te_notes_screen/te_reminder_card.dart';
import 'package:te_breath/te_screens/te_settings/te_settings_screen.dart';
import 'package:te_breath/te_values/te_colors.dart';
import 'package:te_breath/te_values/te_text.dart';

class TeNotesScreen extends StatefulWidget {
  const TeNotesScreen({super.key});

  @override
  State<TeNotesScreen> createState() => _TeNotesScreenState();
}

class _TeNotesScreenState extends State<TeNotesScreen>
    with TickerProviderStateMixin {
  final teRemindersController = Get.find<TeRemindersController>();
  final teNotesController = Get.find<TeNotesController>();
  final Rx<DateTime> _teCurDay = DateTime.now().obs;
  late final _teTabController = TabController(length: 2, vsync: this);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      teNotesController.getNotes();
      teRemindersController.getReminders();
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
          'Notes & Reminders',
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
      body: Column(
        children: [
          TabBar(
            controller: _teTabController,
            labelStyle: TeText.header5,
            unselectedLabelStyle: TeText.header5,
            labelColor: TeColors.purple,
            unselectedLabelColor: TeColors.lightGray,
            indicatorColor: TeColors.purple,
            tabs: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: Text('Calendar'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: Text('Reminders'),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: TabBarView(
              controller: _teTabController,
              children: [
                GetBuilder<TeNotesController>(builder: (_) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          padding: const EdgeInsets.all(20).copyWith(top: 0),
                          color: Colors.transparent,
                          child: Obx(
                            () => TableCalendar(
                              focusedDay: teNotesController.selectedDate.value,
                              weekendDays: const [],
                              onDaySelected: (selectedDay, focusedDay) {},
                              onPageChanged: (focusedDay) {
                                teNotesController.selectedDate.value =
                                    focusedDay;
                                teNotesController.getNotes();
                              },
                              headerStyle: HeaderStyle(
                                titleCentered: true,
                                formatButtonVisible: false,
                                leftChevronIcon: SizedBox(),
                                rightChevronIcon: SizedBox(),
                                titleTextStyle: TeText.header5
                                    .copyWith(color: TeColors.black),
                              ),
                              startingDayOfWeek: StartingDayOfWeek.monday,
                              firstDay: DateTime.utc(DateTime.now().year - 1,
                                  DateTime.now().month, DateTime.now().day),
                              lastDay: DateTime.utc(DateTime.now().year + 1,
                                  DateTime.now().month, DateTime.now().day),
                              daysOfWeekHeight: 20,
                              calendarStyle: const CalendarStyle(),
                              daysOfWeekStyle: DaysOfWeekStyle(
                                weekdayStyle: TeText.body3
                                    .copyWith(color: TeColors.black),
                                weekendStyle: TeText.body3
                                    .copyWith(color: TeColors.black),
                              ),
                              calendarBuilders: CalendarBuilders(
                                defaultBuilder: (context, day, focusedDay) {
                                  final notedate = teNotesController.teNotedates
                                      .firstWhereOrNull(
                                          (element) => element.day == day.day);
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: notedate == null
                                              ? Colors.transparent
                                              : notedate.beingType == 0
                                                  ? TeColors.lightGreenSec
                                                  : notedate.beingType == 1
                                                      ? TeColors.yellow
                                                      : notedate.beingType == 2
                                                          ? Colors.amber
                                                          : TeColors.redSec,
                                        ),
                                      ),
                                      Text(
                                        day.day.toString(),
                                        style: TeText.header4
                                            .copyWith(color: TeColors.black),
                                      ),
                                    ],
                                  );
                                },
                                todayBuilder: (context, day, focusedDay) {
                                  final notedate = teNotesController.teNotedates
                                      .firstWhereOrNull(
                                          (element) => element.day == day.day);
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: notedate == null
                                              ? Colors.transparent
                                              : notedate.beingType == 0
                                                  ? TeColors.lightGreenSec
                                                  : notedate.beingType == 1
                                                      ? TeColors.yellow
                                                      : notedate.beingType == 2
                                                          ? Colors.amber
                                                          : TeColors.redSec,
                                        ),
                                      ),
                                      Text(
                                        day.day.toString(),
                                        style: TeText.header4
                                            .copyWith(color: TeColors.black),
                                      ),
                                    ],
                                  );
                                },
                                outsideBuilder: (context, day, focusedDay) {
                                  final notedate = teNotesController.teNotedates
                                      .firstWhereOrNull(
                                          (element) => element.day == day.day);
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Opacity(
                                        opacity: 0.5,
                                        child: Container(
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        day.day.toString(),
                                        style: TeText.header4.copyWith(
                                            color: TeColors.lightGray),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 0.5,
                          margin: EdgeInsets.symmetric(vertical: 26),
                          width: double.infinity,
                          color: TeColors.lightGray,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/add_notes', id: 1);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
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
                                  child: SvgPicture.asset(
                                      'te_assets/icons/add.svg'),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'Notes',
                                  style: TeText.button
                                      .copyWith(color: TeColors.purple),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (teNotesController.teNotes.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 26,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'Notes',
                                  style: TeText.header5
                                      .copyWith(color: TeColors.black),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Column(
                                children: List.generate(
                                  teNotesController.teNotes.length,
                                  (index) => TeNoteCard(
                                    teNoteModel:
                                        teNotesController.teNotes[index],
                                    teOnEditTap: () {
                                      Get.toNamed('/add_notes',
                                          id: 1,
                                          arguments:
                                              teNotesController.teNotes[index]);
                                    },
                                    teOnDeleteTap: () {
                                      teNotesController.deleteNotes(
                                          teNotesController.teNotes[index]);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  );
                }),
                GetBuilder<TeRemindersController>(builder: (context) {
                  return Column(
                    children: [
                      Expanded(
                        child: teRemindersController.teReminders.isEmpty
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
                            : ListView.separated(
                                itemCount:
                                    teRemindersController.teReminders.length,
                                padding: EdgeInsets.all(16),
                                itemBuilder: (context, index) => TeReminderCard(
                                  teReminderModel:
                                      teRemindersController.teReminders[index],
                                  teOnEditTap: () {
                                    Get.toNamed('/add_reminder',
                                        id: 1,
                                        arguments: teRemindersController
                                            .teReminders[index]);
                                  },
                                  teOnDeleteTap: () {
                                    teRemindersController.deleteReminders(
                                        teRemindersController
                                            .teReminders[index]);
                                  },
                                ),
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 16,
                                ),
                              ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/add_reminder', id: 1);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 26),
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
                                child:
                                    SvgPicture.asset('te_assets/icons/add.svg'),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Medication Reminder',
                                style: TeText.button
                                    .copyWith(color: TeColors.purple),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
