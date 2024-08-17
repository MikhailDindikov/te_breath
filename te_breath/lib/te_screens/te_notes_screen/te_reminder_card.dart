import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:te_breath/te_models/te_reminder_model.dart';
import 'package:te_breath/te_values/te_colors.dart';
import 'package:te_breath/te_values/te_text.dart';

class TeReminderCard extends StatelessWidget {
  final TeReminderModel teReminderModel;
  final void Function() teOnEditTap;
  final void Function() teOnDeleteTap;
  const TeReminderCard(
      {super.key,
      required this.teReminderModel,
      required this.teOnEditTap,
      required this.teOnDeleteTap});

  String get _getTimingType {
    if (teReminderModel.reminderTimerType == 0) {
      return 'before meal';
    } else if (teReminderModel.reminderTimerType == 1) {
      return 'during meal';
    } else {
      return 'after meal';
    }
  }

  String get _getIconType {
    if (teReminderModel.reminderIconType == 0) {
      return 'te_assets/icons/syringe.svg';
    } else if (teReminderModel.reminderIconType == 1) {
      return 'te_assets/icons/pill.svg';
    } else {
      return 'te_assets/icons/tablet.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
              alignment: Alignment.center,
              color: TeColors.purple,
              child: Container(
                height: 28,
                width: 28,
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  _getIconType,
                  color: TeColors.white,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                color: TeColors.white,
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            teReminderModel.reminderName,
                            style:
                                TeText.header5.copyWith(color: TeColors.purple),
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
                                child: SvgPicture.asset(
                                    'te_assets/icons/edit.svg'),
                              ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: teOnDeleteTap,
                              child: Container(
                                height: 32,
                                width: 32,
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                    'te_assets/icons/delete.svg'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${teReminderModel.reminderDosage} · ${teReminderModel.reminderSpecifyTime}',
                      style: TeText.body2.copyWith(color: TeColors.purple),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Note: ${teReminderModel.reminderNotes}',
                      style: TeText.body1.copyWith(color: TeColors.purple),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
