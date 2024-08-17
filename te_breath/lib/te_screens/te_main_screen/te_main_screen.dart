import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:te_breath/te_navigators/te_anamnesis_navigator.dart';
import 'package:te_breath/te_navigators/te_notes_navigator.dart';
import 'package:te_breath/te_screens/te_allergy_screen/te_allergy_screen.dart';
import 'package:te_breath/te_screens/te_blooming_screen/te_blooming_screen.dart';
import 'package:te_breath/te_screens/te_main_screen/te_prem_screen.dart';
import 'package:te_breath/te_screens/te_recipes_screen/te_recipes_screen.dart';
import 'package:te_breath/te_values/te_colors.dart';

class TeMainScreen extends StatefulWidget {
  const TeMainScreen({super.key});

  @override
  State<TeMainScreen> createState() => _TeMainScreenState();
}

class _TeMainScreenState extends State<TeMainScreen> {
  final teController = CupertinoTabController();
  int tinkSelectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: teController,
      backgroundColor: TeColors.lightGraySec,
      tabBar: CupertinoTabBar(
        height: 83,
        onTap: (index) {
          if (index == 4) {
            final teBox = GetStorage();
            final hasTePrem = teBox.read<bool?>('hasTePrem') ?? false;
            if (!hasTePrem) {
              teController.index = tinkSelectedScreen;
              Get.to(() => TePremScreen());
            }
          } else {
            tinkSelectedScreen = index;
          }
        },
        backgroundColor: TeColors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: SvgPicture.asset(
                'te_assets/icons/allergy_nav.svg',
                color: TeColors.purple,
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: SvgPicture.asset(
                'te_assets/icons/allergy_nav.svg',
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: SvgPicture.asset(
                'te_assets/icons/anamnesis_nav.svg',
                color: TeColors.purple,
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: SvgPicture.asset(
                'te_assets/icons/anamnesis_nav.svg',
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: SvgPicture.asset(
                'te_assets/icons/notes_nav.svg',
                color: TeColors.purple,
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: SvgPicture.asset(
                'te_assets/icons/notes_nav.svg',
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: SvgPicture.asset(
                'te_assets/icons/blooming_nav.svg',
                color: TeColors.purple,
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: SvgPicture.asset(
                'te_assets/icons/blooming_nav.svg',
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: SvgPicture.asset(
                'te_assets/icons/recipes_nav.svg',
                color: TeColors.purple,
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: SvgPicture.asset(
                'te_assets/icons/recipes_nav.svg',
              ),
            ),
          ),
        ],
      ),
      tabBuilder: (ctx, index) => Builder(
        builder: (ctx) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (context) => CupertinoPageScaffold(
                  child: TeAllergyScreen(),
                ),
              );
            case 1:
              return CupertinoTabView(
                builder: (context) => CupertinoPageScaffold(
                  child: TeAnamnesisNavigator(),
                ),
              );
            case 2:
              return CupertinoTabView(
                builder: (context) => CupertinoPageScaffold(
                  child: TeNotesNavigator(),
                ),
              );
            case 3:
              return CupertinoTabView(
                builder: (context) => CupertinoPageScaffold(
                  child: TeBloomingScreen(),
                ),
              );
            case 4:
              return CupertinoTabView(
                builder: (context) => CupertinoPageScaffold(
                  child: TeRecipesScreen(),
                ),
              );
            default:
              return CupertinoTabView(
                builder: (context) => CupertinoPageScaffold(
                  child: Container(),
                ),
              );
          }
        },
      ),
    );
  }
}
