import 'package:get/get.dart';
import 'package:te_breath/te_db.dart';
import 'package:te_breath/te_models/te_anamnesis_model.dart';

class TeAnamnesisController extends GetxController {
  List<TeAnamnesisModel> teAnamnesis = [];

  Future<void> addAnamnesis(TeAnamnesisModel teAnamnesisModel) async {
    final tedb = TeDBHelper();

    await tedb.addTeAnamnesis(teAnamnesisModel);
    teAnamnesis = await tedb.getAllAnamnesis();
    update();
  }

  Future<void> updateAnamnesis(TeAnamnesisModel teAnamnesisModel) async {
    final tedb = TeDBHelper();

    await tedb.updateTeAnamnesis(teAnamnesisModel);
    teAnamnesis = await tedb.getAllAnamnesis();
    update();
  }

  Future<void> deleteAnamnesis(TeAnamnesisModel teAnamnesisModel) async {
    final tedb = TeDBHelper();

    await tedb.deteleTeAnamnesis(teAnamnesisModel);
    teAnamnesis = await tedb.getAllAnamnesis();
    update();
  }

  Future<void> getAnamnesis() async {
    final tedb = TeDBHelper();
    teAnamnesis = await tedb.getAllAnamnesis();
    update();
  }
}
