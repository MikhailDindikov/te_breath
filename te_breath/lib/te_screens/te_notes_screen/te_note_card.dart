import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:te_breath/te_models/te_note_model.dart';
import 'package:te_breath/te_values/te_colors.dart';
import 'package:te_breath/te_values/te_text.dart';

class TeNoteCard extends StatelessWidget {
  final TeNoteModel teNoteModel;
  final void Function() teOnEditTap;
  final void Function() teOnDeleteTap;
  const TeNoteCard(
      {super.key,
      required this.teNoteModel,
      required this.teOnEditTap,
      required this.teOnDeleteTap});

  String get getWeekday {
    if (teNoteModel.noteDate.weekday == 1) {
      return 'Monday';
    } else if (teNoteModel.noteDate.weekday == 2) {
      return 'Tuesday';
    } else if (teNoteModel.noteDate.weekday == 3) {
      return 'Wednesday';
    } else if (teNoteModel.noteDate.weekday == 4) {
      return 'Thursday';
    } else if (teNoteModel.noteDate.weekday == 5) {
      return 'Friday';
    } else if (teNoteModel.noteDate.weekday == 6) {
      return 'Saturday';
    } else {
      return 'Sunday';
    }
  }

  String get getMonth {
    if (teNoteModel.noteDate.month == 1) {
      return 'January';
    } else if (teNoteModel.noteDate.month == 2) {
      return 'February';
    } else if (teNoteModel.noteDate.month == 3) {
      return 'March';
    } else if (teNoteModel.noteDate.month == 4) {
      return 'April';
    } else if (teNoteModel.noteDate.month == 5) {
      return 'May';
    } else if (teNoteModel.noteDate.month == 6) {
      return 'June';
    } else if (teNoteModel.noteDate.month == 7) {
      return 'July';
    } else if (teNoteModel.noteDate.month == 8) {
      return 'August';
    } else if (teNoteModel.noteDate.month == 9) {
      return 'September';
    } else if (teNoteModel.noteDate.month == 10) {
      return 'October';
    } else if (teNoteModel.noteDate.month == 11) {
      return 'November';
    } else {
      return 'December';
    }
  }

  String get beingType {
    if (teNoteModel.noteBeingType == 0) {
      return 'te_assets/images/excellent.png';
    } else if (teNoteModel.noteBeingType == 1) {
      return 'te_assets/images/good.png';
    } else if (teNoteModel.noteBeingType == 2) {
      return 'te_assets/images/fair.png';
    } else {
      return 'te_assets/images/poor.png';
    }
  }

  Color get beingColorType {
    if (teNoteModel.noteBeingType == 0) {
      return TeColors.lightGreenSec;
    } else if (teNoteModel.noteBeingType == 1) {
      return TeColors.yellow;
    } else if (teNoteModel.noteBeingType == 2) {
      return Colors.amber;
    } else {
      return TeColors.redSec;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16).copyWith(top: 0),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: TeColors.white,
      ),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        beingType,
                        height: 32,
                        width: 32,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              teNoteModel.noteReason,
                              style: TextStyle(
                                fontFamily: 'Karla',
                                fontSize: 15,
                                fontVariations: [FontVariation('wght', 700)],
                                letterSpacing: 1,
                                color: beingColorType,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '$getWeekday, $getMonth ${teNoteModel.noteDate.day}',
                              style: TeText.body4
                                  .copyWith(color: TeColors.lightGray),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: teOnEditTap,
                      child: Container(
                        height: 32,
                        width: 32,
                        alignment: Alignment.center,
                        child: SvgPicture.asset('te_assets/icons/edit.svg'),
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: teOnDeleteTap,
                      child: Container(
                        height: 32,
                        width: 32,
                        alignment: Alignment.center,
                        child: SvgPicture.asset('te_assets/icons/delete.svg'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            textDirection: TextDirection.ltr,
            children: [
              Text(
                'Food:  ',
                style: TextStyle(
                  fontFamily: 'Karla',
                  fontSize: 15,
                  fontVariations: [FontVariation('wght', 700)],
                  letterSpacing: 1,
                  color: TeColors.purple,
                ),
              ),
              Expanded(
                child: Text(
                  teNoteModel.noteFood,
                  style: TextStyle(
                    fontFamily: 'Karla',
                    fontSize: 15,
                    fontVariations: [FontVariation('wght', 700)],
                    letterSpacing: 1,
                    color: TeColors.lightGray,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            textDirection: TextDirection.ltr,
            children: [
              Text(
                'Location:  ',
                style: TextStyle(
                  fontFamily: 'Karla',
                  fontSize: 15,
                  fontVariations: [FontVariation('wght', 700)],
                  letterSpacing: 1,
                  color: TeColors.purple,
                ),
              ),
              Expanded(
                child: Text(
                  teNoteModel.noteLocation,
                  style: TextStyle(
                    fontFamily: 'Karla',
                    fontSize: 15,
                    fontVariations: [FontVariation('wght', 700)],
                    letterSpacing: 1,
                    color: TeColors.lightGray,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            textDirection: TextDirection.ltr,
            children: [
              Text(
                'Allergen:  ',
                style: TextStyle(
                  fontFamily: 'Karla',
                  fontSize: 15,
                  fontVariations: [FontVariation('wght', 700)],
                  letterSpacing: 1,
                  color: TeColors.purple,
                ),
              ),
              Expanded(
                child: Text(
                  teNoteModel.noteAllergen,
                  style: TextStyle(
                    fontFamily: 'Karla',
                    fontSize: 15,
                    fontVariations: [FontVariation('wght', 700)],
                    letterSpacing: 1,
                    color: TeColors.lightGray,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            textDirection: TextDirection.ltr,
            children: [
              Text(
                'Plants:  ',
                style: TextStyle(
                  fontFamily: 'Karla',
                  fontSize: 15,
                  fontVariations: [FontVariation('wght', 700)],
                  letterSpacing: 1,
                  color: TeColors.purple,
                ),
              ),
              Expanded(
                child: Text(
                  teNoteModel.notePlants,
                  style: TextStyle(
                    fontFamily: 'Karla',
                    fontSize: 15,
                    fontVariations: [FontVariation('wght', 700)],
                    letterSpacing: 1,
                    color: TeColors.lightGray,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            textDirection: TextDirection.ltr,
            children: [
              Text(
                'Animals:  ',
                style: TextStyle(
                  fontFamily: 'Karla',
                  fontSize: 15,
                  fontVariations: [FontVariation('wght', 700)],
                  letterSpacing: 1,
                  color: TeColors.purple,
                ),
              ),
              Expanded(
                child: Text(
                  teNoteModel.noteAnimals,
                  style: TextStyle(
                    fontFamily: 'Karla',
                    fontSize: 15,
                    fontVariations: [FontVariation('wght', 700)],
                    letterSpacing: 1,
                    color: TeColors.lightGray,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
