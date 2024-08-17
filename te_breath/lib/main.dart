import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:te_breath/te_binds.dart';
import 'package:te_breath/te_screens/te_demo_screen/te_demo_1_screen.dart';
import 'package:te_breath/te_screens/te_main_screen/te_main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  final teBox = GetStorage();
  final showTeDemo = teBox.read<bool?>('showTeDemo') ?? true;
  await Apphud.start(apiKey: 'app_mwYsebutQ5AZRQRMn7y6H7e1TxKLpH');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(TeBreathApp(showTeDemo: showTeDemo));
}

class TeBreathApp extends StatelessWidget {
  final bool showTeDemo;
  const TeBreathApp({super.key, required this.showTeDemo});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Te Breath',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      initialBinding: TeBinds(),
      home: MediaQuery.withNoTextScaling(
        child: showTeDemo ? TeDemo1Screen() : TeMainScreen(),
      ),
    );
  }
}
