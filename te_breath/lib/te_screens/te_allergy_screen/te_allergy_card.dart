import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:te_breath/te_models/te_allergy_model.dart';
import 'package:te_breath/te_values/te_colors.dart';
import 'package:te_breath/te_values/te_text.dart';

class TeAllergyCard extends StatelessWidget {
  final TeAllergyModel teAllergyModel;
  const TeAllergyCard({super.key, required this.teAllergyModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: TeColors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Text(
              teAllergyModel.teTitle,
              style: TeText.header5.copyWith(color: TeColors.black),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: double.infinity,
                  width: 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: teAllergyModel.teColor,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Text(
                    teAllergyModel.teLabel,
                    style: TeText.body2.copyWith(color: TeColors.black),
                  ),
                ),
              ],
            ),
          ),
          if (teAllergyModel.teSubLabel.isNotEmpty)
            SizedBox(
              height: 15,
            ),
          if (teAllergyModel.teSubLabel.isNotEmpty)
            Text(
              teAllergyModel.teSubLabel,
              style: TeText.body2.copyWith(color: TeColors.black),
            ),
        ],
      ),
    );
  }
}
