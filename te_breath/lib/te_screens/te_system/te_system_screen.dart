import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:te_breath/te_values/te_colors.dart';
import 'package:te_breath/te_values/te_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TeSystemScreen extends StatefulWidget {
  final String tecontrollerWT;
  const TeSystemScreen({super.key, required this.tecontrollerWT});

  @override
  State<TeSystemScreen> createState() => _TeSystemScreenState();
}

class _TeSystemScreenState extends State<TeSystemScreen> {
  late WebViewController tecontrollerW;

  @override
  void initState() {
    String tellllW = '';
    if (widget.tecontrollerWT == 'Privacy Policy') {
      tellllW =
          'https://docs.google.com/document/d/14wSNMu73toe53ui6DR_XnzMZIBA9rO8zIPFiYBECy7g/edit?usp=sharing';
    } else if (widget.tecontrollerWT == 'Terms of Use') {
      tellllW =
          'https://docs.google.com/document/d/1Po4WQZu1cm12EtStZtqZp9zXhOfSgUFg5g0V8oLDsZQ/edit?usp=sharing';
    } else {
      tellllW = 'https://sites.google.com/view/rad-one-oy/support-form';
    }

    tecontrollerW = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(tellllW));
    super.initState();
  }

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
          widget.tecontrollerWT,
          style: TeText.navbar.copyWith(color: TeColors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: WebViewWidget(
              controller: tecontrollerW,
            ),
          )
        ],
      ),
    );
  }
}
