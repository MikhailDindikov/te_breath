import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_composite_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:te_breath/te_screens/te_settings/te_settings_card.dart';
import 'package:te_breath/te_screens/te_system/te_system_screen.dart';
import 'package:te_breath/te_values/te_colors.dart';
import 'package:te_breath/te_values/te_text.dart';

class TeSettingsScreen extends StatefulWidget {
  const TeSettingsScreen({super.key});

  @override
  State<TeSettingsScreen> createState() => _TeSettingsScreenState();
}

class _TeSettingsScreenState extends State<TeSettingsScreen> {
  final RxBool _tePurLo = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TeColors.lightGraySec,
      appBar: AppBar(
        backgroundColor: TeColors.lightGraySec,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: Get.back,
          child: Container(
            height: 32,
            width: 32,
            alignment: Alignment.center,
            child: SvgPicture.asset('te_assets/icons/back.svg'),
          ),
        ),
        title: Text(
          'Settings',
          style: TeText.navbar.copyWith(color: TeColors.black),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          TeSettingsCard(
            teLabel: 'Privacy Policy',
            onTeSetCardTap: () {
              Get.to(() => TeSystemScreen(tecontrollerWT: 'Privacy Policy'));
            },
          ),
          TeSettingsCard(
            teLabel: 'Terms of Use',
            onTeSetCardTap: () {
              Get.to(() => TeSystemScreen(tecontrollerWT: 'Terms of Use'));
            },
          ),
          TeSettingsCard(
            teLabel: 'Support',
            onTeSetCardTap: () {
              Get.to(() => TeSystemScreen(tecontrollerWT: 'Support'));
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 17)
                .copyWith(top: 0),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async {
                if (!_tePurLo.value) {
                  _tePurLo.value = true;
                  final ApphudComposite terestPud =
                      await Apphud.restorePurchases();

                  bool tefailPu = true;

                  if (terestPud.purchases.isNotEmpty) {
                    for (final pu in terestPud.purchases) {
                      if (pu.productId == 'premium') {
                        tefailPu = false;
                        final teBox = GetStorage();
                        teBox.write('hasTePrem', true);

                        break;
                      }
                    }
                  }

                  if (tefailPu) {
                    Get.showSnackbar(GetSnackBar(
                      duration: Duration(milliseconds: 3000),
                      backgroundColor: TeColors.purple,
                      messageText: Text(
                        'Your purchase is not found!',
                        style: TeText.header5.copyWith(color: TeColors.white),
                      ),
                    ));
                  } else {
                    Get.showSnackbar(GetSnackBar(
                      duration: Duration(milliseconds: 3000),
                      backgroundColor: TeColors.purple,
                      messageText: Text(
                        'Premium has been activated!',
                        style: TeText.header5.copyWith(color: TeColors.white),
                      ),
                    ));
                  }

                  _tePurLo.value = false;
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => _tePurLo.value
                        ? CupertinoActivityIndicator()
                        : Text(
                            'Restore Purchases',
                            style:
                                TeText.header5.copyWith(color: TeColors.black),
                          ),
                  ),
                  Container(
                      height: 32,
                      width: 32,
                      alignment: Alignment.center,
                      child: SvgPicture.asset('te_assets/icons/next.svg')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
