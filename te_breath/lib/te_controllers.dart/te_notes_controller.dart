import 'package:get/get.dart';
import 'package:te_breath/te_db.dart';
import 'package:te_breath/te_models/te_note_model.dart';
import 'package:te_breath/te_models/te_notedate_model.dart';

class TeNotesController extends GetxController {
  List<TeNoteModel> teNotes = [];
  List<TeNotedateModel> teNotedates = [];
  Rx<DateTime> selectedDate = DateTime.now().obs;

  Future<void> addNote(TeNoteModel teNoteModel) async {
    final tedb = TeDBHelper();

    await tedb.addTeNote(teNoteModel);
    teNotes = await tedb.getAllNotes(
      selectedDate.value.month.toString(),
      selectedDate.value.year.toString(),
    );
    teNotedates = await tedb.getAllNotesDate(
      selectedDate.value.month.toString(),
      selectedDate.value.year.toString(),
    );
    update();
  }

  Future<void> updateNotes(TeNoteModel teNoteModel) async {
    final tedb = TeDBHelper();

    await tedb.updateTeNote(teNoteModel);
    teNotes = await tedb.getAllNotes(
      selectedDate.value.month.toString(),
      selectedDate.value.year.toString(),
    );
    teNotedates = await tedb.getAllNotesDate(
      selectedDate.value.month.toString(),
      selectedDate.value.year.toString(),
    );
    update();
  }

  Future<void> deleteNotes(TeNoteModel teNoteModel) async {
    final tedb = TeDBHelper();

    await tedb.deteleTeNote(teNoteModel);
    teNotes = await tedb.getAllNotes(
      selectedDate.value.month.toString(),
      selectedDate.value.year.toString(),
    );
    teNotedates = await tedb.getAllNotesDate(
      selectedDate.value.month.toString(),
      selectedDate.value.year.toString(),
    );
    update();
  }

  Future<void> getNotes() async {
    final tedb = TeDBHelper();
    teNotes = await tedb.getAllNotes(
      selectedDate.value.month.toString(),
      selectedDate.value.year.toString(),
    );
    teNotedates = await tedb.getAllNotesDate(
      selectedDate.value.month.toString(),
      selectedDate.value.year.toString(),
    );
    update();
  }
}
