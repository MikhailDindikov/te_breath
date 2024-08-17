import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:te_breath/te_controllers.dart/te_blooming_controller.dart';
import 'package:te_breath/te_screens/te_settings/te_settings_screen.dart';
import 'package:te_breath/te_values/te_colors.dart';
import 'package:te_breath/te_values/te_text.dart';

class TeBloomingScreen extends StatefulWidget {
  const TeBloomingScreen({super.key});

  @override
  State<TeBloomingScreen> createState() => _TeBloomingScreenState();
}

class _TeBloomingScreenState extends State<TeBloomingScreen> {
  final teBlooming = Get.find<TeBloomingController>();
  late final PageController _tePageController;
  final _teSearchController = TextEditingController();
  final RxBool _showBloomingInfo = false.obs;
  final RxInt _selPollenType = 0.obs;

  @override
  void initState() {
    final teBox = GetStorage();
    final showTeDemo = teBox.read<bool?>('showBloomingDemo') ?? true;
    _tePageController = PageController(initialPage: showTeDemo ? 0 : 1);
    super.initState();
  }

  String _getPollenString(int pollenLvl) {
    final pollenType = _selPollenType.value == 0
        ? 'Trees'
        : _selPollenType.value == 1
            ? 'Weeds'
            : 'Grass';
    if (pollenLvl == 0) {
      return 'There is no ${pollenType} Pollen';
    } else if (pollenLvl == 1) {
      return '${pollenType} pollen level is very low';
    } else if (pollenLvl == 2) {
      return '${pollenType} pollen level is low';
    } else if (pollenLvl == 3) {
      return '${pollenType} pollen level is normal';
    } else if (pollenLvl == 3) {
      return '${pollenType} pollen level is high';
    } else {
      return '${pollenType} pollen level is very high';
    }
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
          'Blooming Season',
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
      body: GetBuilder<TeBloomingController>(builder: (_) {
        return PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tePageController,
          children: [
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 40),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12.5, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: TeColors.white,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Blooming season can be challenging time for anyone with allergies, but there are always ways to manage it.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Karla',
                              fontSize: 20,
                              fontVariations: [FontVariation('wght', 700)],
                              letterSpacing: 1,
                              color: TeColors.purple,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'This section provides up-to-date information on pollen concentrations in your city to help ease the discomfort of hay fever.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Karla',
                              fontSize: 15,
                              fontVariations: [FontVariation('wght', 300)],
                              letterSpacing: 1,
                              color: TeColors.purple,
                            ),
                          ),
                          SizedBox(
                            height: 29,
                          ),
                          Expanded(
                            child: Image.asset(
                              'te_assets/images/flowers.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  GestureDetector(
                    onTap: () {
                      final teBox = GetStorage();
                      teBox.write('showBloomingDemo', false);
                      _tePageController.animateToPage(1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: TeColors.purple,
                      ),
                      child: Text(
                        'Next',
                        style: TeText.button.copyWith(color: TeColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: TeText.header5.copyWith(color: TeColors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _teSearchController,
                    onFieldSubmitted: (value) {
                      teBlooming.getTeData(value);
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: TeColors.lightBlueSec,
                      hintText: 'Toronto, CA',
                      hintStyle:
                          TeText.body4.copyWith(color: TeColors.lightGray),
                      suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 19,
                              width: 19,
                              margin: EdgeInsets.only(right: 21),
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                  'te_assets/icons/search.svg'),
                            ),
                          ]),
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
                    height: 33,
                  ),
                  if (teBlooming.isEmpty && teBlooming.teState == TeState.done)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'No data founded',
                            style:
                                TeText.header5.copyWith(color: TeColors.purple),
                          ),
                        ),
                      ],
                    )
                  else if (teBlooming.teState == TeState.loading)
                    Expanded(
                      child: Center(
                        child: CupertinoActivityIndicator(),
                      ),
                    )
                  else if (teBlooming.teState == TeState.done)
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16).copyWith(bottom: 47),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: TeColors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Today',
                            style:
                                TeText.header5.copyWith(color: TeColors.black),
                          ),
                          SizedBox(
                            height: 26,
                          ),
                          Center(
                            child: IntrinsicWidth(
                              child: Column(
                                children: [
                                  Obx(
                                    () => CustomPaint(
                                      size: Size(230, 110),
                                      painter: TeInfo(
                                          pollenLvl: _selPollenType.value == 0
                                              ? teBlooming.teTrees.value
                                              : _selPollenType.value == 1
                                                  ? teBlooming.tePlants.value
                                                  : teBlooming.teGrass.value),
                                      child: SizedBox(
                                        height: 110,
                                        width: 230,
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Positioned(
                                                bottom: -5,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Obx(
                                                      () => Text(
                                                        (_selPollenType.value ==
                                                                    0
                                                                ? teBlooming
                                                                    .teTrees
                                                                    .value
                                                                : _selPollenType
                                                                            .value ==
                                                                        1
                                                                    ? teBlooming
                                                                        .tePlants
                                                                        .value
                                                                    : teBlooming
                                                                        .teGrass
                                                                        .value)
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontFamily: 'Karla',
                                                          fontSize: 64,
                                                          fontVariations: [
                                                            FontVariation(
                                                                'wght', 500)
                                                          ],
                                                          letterSpacing: 1,
                                                          color: TeColors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      ' / 5',
                                                      style: TextStyle(
                                                        fontFamily: 'Karla',
                                                        fontSize: 27,
                                                        fontVariations: [
                                                          FontVariation(
                                                              'wght', 500)
                                                        ],
                                                        letterSpacing: 1,
                                                        color:
                                                            TeColors.lightGray,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '0',
                                        style: TeText.body1.copyWith(
                                            color: TeColors.lightGray),
                                      ),
                                      Text(
                                        '5',
                                        style: TeText.body1.copyWith(
                                            color: TeColors.lightGray),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 11,
                          ),
                          Center(
                            child: Obx(
                              () => Text(
                                _getPollenString(_selPollenType.value == 0
                                    ? teBlooming.teTrees.value
                                    : _selPollenType.value == 1
                                        ? teBlooming.tePlants.value
                                        : teBlooming.teGrass.value),
                                style: TeText.body1
                                    .copyWith(color: TeColors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (_selPollenType.value != 0) {
                                    _selPollenType.value = 0;
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 14),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: TeColors.lightBlueSec,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 18,
                                        width: 18,
                                        alignment: Alignment.center,
                                        child: Obx(
                                          () => SvgPicture.asset(
                                            'te_assets/icons/trees.svg',
                                            color: _selPollenType.value == 0
                                                ? TeColors.greenSec
                                                : null,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Obx(
                                        () => Text(
                                          'Trees',
                                          style: TextStyle(
                                            fontFamily: 'Karla',
                                            fontSize: 15,
                                            fontVariations: [
                                              FontVariation('wght', 700)
                                            ],
                                            letterSpacing: 1,
                                            color: _selPollenType.value == 0
                                                ? TeColors.black
                                                : TeColors.lightGray,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_selPollenType.value != 1) {
                                    _selPollenType.value = 1;
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 14),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: TeColors.lightBlueSec,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 18,
                                        width: 18,
                                        alignment: Alignment.center,
                                        child: Obx(
                                          () => SvgPicture.asset(
                                            'te_assets/icons/weeds.svg',
                                            color: _selPollenType.value == 1
                                                ? TeColors.greenSec
                                                : null,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Obx(
                                        () => Text(
                                          'Weeds',
                                          style: TextStyle(
                                            fontFamily: 'Karla',
                                            fontSize: 15,
                                            fontVariations: [
                                              FontVariation('wght', 700)
                                            ],
                                            letterSpacing: 1,
                                            color: _selPollenType.value == 1
                                                ? TeColors.black
                                                : TeColors.lightGray,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_selPollenType.value != 2) {
                                    _selPollenType.value = 2;
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 14),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: TeColors.lightBlueSec,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 18,
                                        width: 18,
                                        alignment: Alignment.center,
                                        child: Obx(
                                          () => SvgPicture.asset(
                                            'te_assets/icons/grass.svg',
                                            color: _selPollenType.value == 2
                                                ? TeColors.greenSec
                                                : null,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Obx(
                                        () => Text(
                                          'Grass',
                                          style: TextStyle(
                                            fontFamily: 'Karla',
                                            fontSize: 15,
                                            fontVariations: [
                                              FontVariation('wght', 700)
                                            ],
                                            letterSpacing: 1,
                                            color: _selPollenType.value == 2
                                                ? TeColors.black
                                                : TeColors.lightGray,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class TeInfo extends CustomPainter {
  final int pollenLvl;

  const TeInfo({super.repaint, required this.pollenLvl});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, 110);
    final path = Path();
    path.addArc(Rect.fromCircle(center: Offset.zero, radius: 110), 0, -pi);
    canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..color = TeColors.lightBlueSec
          ..strokeWidth = 10);

    final path1 = Path();
    path1.addArc(Rect.fromCircle(center: Offset.zero, radius: 110), pi,
        pi * pollenLvl / 5);
    canvas.drawPath(
        path1,
        Paint()
          ..style = PaintingStyle.stroke
          ..color = pollenLvl == 0
              ? Colors.transparent
              : pollenLvl == 1
                  ? TeColors.greenSec
                  : pollenLvl == 2
                      ? TeColors.lightGreenSec
                      : pollenLvl == 3
                          ? TeColors.yellow
                          : TeColors.redSec
          ..strokeWidth = 10);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate != this;
}
