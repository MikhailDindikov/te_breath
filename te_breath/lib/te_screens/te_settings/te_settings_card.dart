import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:te_breath/te_values/te_colors.dart';
import 'package:te_breath/te_values/te_text.dart';

class TeSettingsCard extends StatelessWidget {
  final String teLabel;
  final void Function() onTeSetCardTap;
  const TeSettingsCard(
      {super.key, required this.teLabel, required this.onTeSetCardTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: 16, vertical: 17).copyWith(top: 0),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTeSetCardTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              teLabel,
              style: TeText.header5.copyWith(color: TeColors.black),
            ),
            Container(
                height: 32,
                width: 32,
                alignment: Alignment.center,
                child: SvgPicture.asset('te_assets/icons/next.svg')),
          ],
        ),
      ),
    );
  }
}
