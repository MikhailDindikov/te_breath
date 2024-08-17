import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:te_breath/te_models/te_anamnesis_model.dart';
import 'package:te_breath/te_values/te_colors.dart';
import 'package:te_breath/te_values/te_text.dart';

class TeAnamnesisCard extends StatelessWidget {
  final TeAnamnesisModel teAnamnesisModel;
  final void Function() teOnTap;
  final void Function() teOnEditTap;
  final void Function() teOnDeleteTap;
  const TeAnamnesisCard(
      {super.key,
      required this.teAnamnesisModel,
      required this.teOnTap,
      required this.teOnEditTap,
      required this.teOnDeleteTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: teOnTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: TeColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        alignment: Alignment.center,
                        child: SvgPicture.asset('te_assets/icons/anamnesis.svg'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        teAnamnesisModel.anamArise,
                        style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 15,
                          fontVariations: [FontVariation('wght', 700)],
                          letterSpacing: 1,
                        ).copyWith(color: TeColors.black),
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
            SizedBox(
              height: 8,
            ),
            Text(
              teAnamnesisModel.anamSymptoms,
              style: TeText.body2.copyWith(color: TeColors.lightGray),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '${teAnamnesisModel.anamNumber} · ${teAnamnesisModel.duration}',
              style: TeText.body2.copyWith(color: TeColors.lightGray),
            ),
            SizedBox(
              height: 8,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Family History Burden: ',
                    style: TeText.body2.copyWith(color: TeColors.lightGray),
                  ),
                  TextSpan(
                    text: teAnamnesisModel.anamFamily,
                    style: TextStyle(
                      fontFamily: 'Karla',
                      fontSize: 15,
                      fontVariations: [FontVariation('wght', 700)],
                      letterSpacing: 1,
                    ).copyWith(color: TeColors.lightGray),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
