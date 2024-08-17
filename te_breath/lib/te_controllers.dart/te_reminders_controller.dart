import 'package:get/get.dart';
import 'package:te_breath/te_db.dart';
import 'package:te_breath/te_models/te_reminder_model.dart';

class TeRemindersController extends GetxController {
  List<TeReminderModel> teReminders = [];

  Future<void> addReminder(TeReminderModel teReminderModel) async {
    final tedb = TeDBHelper();

    await tedb.addTeReminder(teReminderModel);
    teReminders = await tedb.getAllReminders();
    update();
  }

  Future<void> updateReminders(TeReminderModel teReminderModel) async {
    final tedb = TeDBHelper();

    await tedb.updateTeReminder(teReminderModel);
    teReminders = await tedb.getAllReminders();
    update();
  }

  Future<void> deleteReminders(TeReminderModel teReminderModel) async {
    final tedb = TeDBHelper();

    await tedb.deteleTeReminder(teReminderModel);
    teReminders = await tedb.getAllReminders();
    update();
  }

  Future<void> getReminders() async {
    final tedb = TeDBHelper();
    teReminders = await tedb.getAllReminders();
    update();
  }
}
