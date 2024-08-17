import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:te_breath/te_models/te_note_model.dart';
import 'package:te_breath/te_models/te_reminder_model.dart';
import 'package:te_breath/te_screens/te_notes_screen/te_add_note_screen.dart';
import 'package:te_breath/te_screens/te_notes_screen/te_add_reminder_screen.dart';
import 'package:te_breath/te_screens/te_notes_screen/te_notes_screen.dart';

class TeNotesNavigator extends StatelessWidget {
  const TeNotesNavigator({super.key});

  @override
  Widget build(BuildContext context) => Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/notes',
        observers: [HeroController()],
        onGenerateRoute: (settings) {
          if (settings.name == '/notes') {
            return GetPageRoute<dynamic>(
              page: () => TeNotesScreen(),
            );
          } else if (settings.name == '/add_notes') {
            return GetPageRoute<dynamic>(
              page: () => TeAddNoteScreen(
                teNoteModel: settings.arguments as TeNoteModel?,
              ),
            );
          } else if (settings.name == '/add_reminder') {
            return GetPageRoute<dynamic>(
              page: () => TeAddReminderScreen(
                teReminderModel: settings.arguments as TeReminderModel?,
              ),
            );
          }
          return null;
        },
      );
}
