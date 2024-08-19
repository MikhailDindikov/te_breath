import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:te_breath/te_models/te_allergy_model.dart';
import 'package:te_breath/te_screens/te_allergy_screen/te_allergy_card.dart';
import 'package:te_breath/te_screens/te_settings/te_settings_screen.dart';
import 'package:te_breath/te_values/te_colors.dart';
import 'package:te_breath/te_values/te_text.dart';

class TeAllergyScreen extends StatelessWidget {
  const TeAllergyScreen({super.key});

  static const _teAllergyModels = [
    TeAllergyModel(
      teTitle: 'WARNING!',
      teColor: TeColors.yellow,
      teLabel:
          'In addition to the above information, we strongly advise you to consult a doctor. This application is not medical, but only helps to control and keep track of your allergies.',
      teSubLabel: '',
    ),
    TeAllergyModel(
      teTitle: '1. Allergen Identification',
      teColor: TeColors.yellow,
      teLabel:
          'Allergy cannot be diagnosed solely based on tests; clinical symptoms are required. For example: nasal mucosa swelling, redness and pain in the eyes, difficulty breathing, headache, various skin rashes, etc.',
      teSubLabel:
          'To diagnose an allergy, detailed medical history needs to be gathered, diet analyzed through a food diary and observations, and skin tests and/or provocation tests conducted for suspected allergens. Among laboratory diagnostic methods, the most common is the quantitative measurement of IgE antibodies to specific allergens or a panel of allergenic substances.',
    ),
    TeAllergyModel(
      teTitle: '2. Avoiding Allergens',
      teColor: TeColors.purple,
      teLabel:
          '''Home Environment: Frequently dust, use hypoallergenic bedding, avoid carpets, and minimize contact with pets if allergic.

Food Allergy: Carefully read product labels and avoid foods that trigger allergic reactions.

Outdoors: During plant blooming, limit time outside, and wear hats and sunglasses to reduce pollen contact.''',
      teSubLabel: '',
    ),
    TeAllergyModel(
      teTitle: '3. Medications',
      teColor: TeColors.yellow,
      teLabel:
          '''Antihistamines: Drugs that block histamine, a key player in allergic inflammation.

Decongestants: Medications to reduce nasal congestion, but not for long-term use.

Topical Creams and Ointments: Useful for skin reactions; local corticosteroids can help.

Inhalers: For those with allergy-related asthma.

Hormonal Medications: Corticosteroids may be prescribed in severe cases.''',
      teSubLabel: '',
    ),
    TeAllergyModel(
      teTitle: '4. Allergen-Specific Immunotherapy (ASIT)',
      teColor: TeColors.purple,
      teLabel:
          'ASIT (SPLIT): A long-term treatment method involving the gradual introduction of small, increasing doses of an allergen to build tolerance.',
      teSubLabel: '',
    ),
    TeAllergyModel(
      teTitle: '5. General Tips',
      teColor: TeColors.yellow,
      teLabel:
          '''Healthy Lifestyle: Follow a diet rich in vitamins and minerals, engage in regular exercise, and avoid smoking and alcohol.

Boost Immune System: Consume probiotics and vitamins, especially vitamins C and D.

Home Cleanliness: Perform regular wet cleaning, use air purifiers, and maintain humidity levels with humidifiers.''',
      teSubLabel: '',
    ),
    TeAllergyModel(
      teTitle: '6. Additional Treatments',
      teColor: TeColors.purple,
      teLabel: '''Acupuncture: May help alleviate symptoms for some people.

Alternative Methods: Some home remedies may be beneficial, but consult a doctor first.''',
      teSubLabel: '',
    ),
    TeAllergyModel(
      teTitle: '7. Monitoring and Discussing with Your Doctor',
      teColor: TeColors.yellow,
      teLabel:
          '''Regular Consultations: Meet with an allergist or immunologist to adjust treatment as needed.

Follow Recommendations: Adhere to your doctor's instructions, take prescribed medications on time, and monitor your symptoms.''',
      teSubLabel: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TeColors.lightGraySec,
      appBar: AppBar(
        backgroundColor: TeColors.lightGraySec,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Allergy control',
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
      body: ListView.separated(
        itemCount: _teAllergyModels.length,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) => TeAllergyCard(
          teAllergyModel: _teAllergyModels[index],
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 16,
        ),
      ),
    );
  }
}
