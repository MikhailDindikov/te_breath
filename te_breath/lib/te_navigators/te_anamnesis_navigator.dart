import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:te_breath/te_models/te_anamnesis_model.dart';
import 'package:te_breath/te_screens/te_anamnesis_screen/te_add_anamnesis_screen.dart';
import 'package:te_breath/te_screens/te_anamnesis_screen/te_anamnesis_detail_screen.dart';
import 'package:te_breath/te_screens/te_anamnesis_screen/te_anamnesis_screen.dart';

class TeAnamnesisNavigator extends StatelessWidget {
  const TeAnamnesisNavigator({super.key});

  @override
  Widget build(BuildContext context) => Navigator(
        key: Get.nestedKey(0),
        initialRoute: '/anamnesis',
        observers: [HeroController()],
        onGenerateRoute: (settings) {
          if (settings.name == '/anamnesis') {
            return GetPageRoute<dynamic>(
              page: () => TeAnamnesisScreen(),
            );
          } else if (settings.name == '/add_anamnesis') {
            return GetPageRoute<dynamic>(
              page: () => TeAddAnamnesisScreen(
                teAnamnesisModel: settings.arguments as TeAnamnesisModel?,
              ),
            );
          } else if (settings.name == '/anamnesis_detail') {
            return GetPageRoute<dynamic>(
              page: () => TeAnamnesisDetailScreen(
                teAnamnesisModel: settings.arguments as TeAnamnesisModel,
              ),
            );
          }
          return null;
        },
      );
}
