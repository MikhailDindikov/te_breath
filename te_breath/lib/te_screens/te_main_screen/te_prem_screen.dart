import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_composite_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:te_breath/te_screens/te_system/te_system_screen.dart';
import 'package:te_breath/te_values/te_colors.dart';
import 'package:te_breath/te_values/te_text.dart';

class TePremScreen extends StatefulWidget {
  const TePremScreen({super.key});

  @override
  State<TePremScreen> createState() => _TePremScreenState();
}

class _TePremScreenState extends State<TePremScreen> {
  final RxBool _teBuyLo = false.obs;
  final RxBool _tePurLo = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TeColors.purple,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: Get.back,
                    child: Container(
                      height: 32,
                      width: 32,
                      alignment: Alignment.center,
                      child: SvgPicture.asset('te_assets/icons/cross.svg'),
                    ),
                  ),
                  Text(
                    'Premium',
                    style: TeText.navbar.copyWith(color: TeColors.white),
                  ),
                  Opacity(
                    opacity: 0,
                    child: Container(
                      height: 32,
                      width: 32,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Image.asset(
                  'te_assets/images/prem.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 42,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Unlock with ',
                      style: TeText.header1.copyWith(color: TeColors.white),
                    ),
                    TextSpan(
                      text: 'Premium',
                      style: TeText.header1.copyWith(color: TeColors.yellow),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: TeColors.white.withOpacity(0.1),
                ),
                child: Text(
                  'Delicious and Allergy-Friendly Recipes for a Healthy Diet',
                  textAlign: TextAlign.center,
                  style: TeText.header4.copyWith(color: TeColors.white),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () async {
                  if (!_teBuyLo.value) {
                    _teBuyLo.value = true;
                    final tewwwwwwa = await Apphud.paywalls();
                    print(tewwwwwwa?.paywalls.first.products!
                        .where((element) => element.productId == 'premium')
                        .toList()
                        .first);

                    final teananafna = await Apphud.purchase(
                      product: tewwwwwwa?.paywalls.first.products!
                          .where((fodpofdopfd) =>
                              fodpofdopfd.productId == 'premium')
                          .toList()
                          .first,
                    );
                    if (teananafna.error == null) {
                      final teBox = GetStorage();
                      teBox.write('hasTePrem', true);
                      Get.back();
                      Get.showSnackbar(GetSnackBar(
                        duration: Duration(milliseconds: 3000),
                        backgroundColor: TeColors.purple,
                        messageText: Text(
                          'Premium has been activated!',
                          style: TeText.header5.copyWith(color: TeColors.white),
                        ),
                      ));
                    }

                    _teBuyLo.value = false;
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: TeColors.yellow,
                  ),
                  child: Obx(
                    () => _teBuyLo.value
                        ? CupertinoActivityIndicator()
                        : Text(
                            'Buy premium for \$0,99',
                            style:
                                TeText.header2.copyWith(color: TeColors.white),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Get.to(() =>
                          TeSystemScreen(tecontrollerWT: 'Privacy policy'));
                    },
                    child: Text(
                      'Privacy policy',
                      style: TeText.body4.copyWith(
                        color: Color.fromRGBO(189, 189, 189, 1),
                      ),
                    ),
                  ),
                  GestureDetector(
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
                              style: TeText.header5
                                  .copyWith(color: TeColors.white),
                            ),
                          ));
                        } else {
                          Get.showSnackbar(GetSnackBar(
                            duration: Duration(milliseconds: 3000),
                            backgroundColor: TeColors.purple,
                            messageText: Text(
                              'Premium has been activated!',
                              style: TeText.header5
                                  .copyWith(color: TeColors.white),
                            ),
                          ));
                        }

                        _tePurLo.value = false;
                      }
                    },
                    child: Obx(
                      () => _tePurLo.value
                          ? CupertinoActivityIndicator()
                          : Text(
                              'Restore',
                              style: TeText.body4.copyWith(
                                color: Color.fromRGBO(189, 189, 189, 1),
                              ),
                            ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Get.to(
                          () => TeSystemScreen(tecontrollerWT: 'Terms of Use'));
                    },
                    child: Text(
                      'Terms of use',
                      style: TeText.body4.copyWith(
                        color: Color.fromRGBO(189, 189, 189, 1),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
