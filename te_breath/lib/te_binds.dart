import 'package:get/get.dart';
import 'package:te_breath/te_controllers.dart/te_anamnesis_controller.dart';
import 'package:te_breath/te_controllers.dart/te_blooming_controller.dart';
import 'package:te_breath/te_controllers.dart/te_notes_controller.dart';
import 'package:te_breath/te_controllers.dart/te_reminders_controller.dart';

class TeBinds extends Bindings {
  @override
  void dependencies() {
    Get.put(TeAnamnesisController());
    Get.put(TeNotesController());
    Get.put(TeRemindersController());
    Get.put(TeBloomingController());
  }
}
