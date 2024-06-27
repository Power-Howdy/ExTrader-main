// ignore_for_file: deprecated_member_use

import 'package:coinspace/common/theme/app_themes.dart';
import 'package:coinspace/view/auth/account_screen.dart';
import 'package:coinspace/widget/back_icon.dart';
import 'package:coinspace/widget/custom_button.dart';
import 'package:coinspace/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 20),
            const BackIcon(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      Text(
                        "If you're a citizen or more than one\ncountry, please pick one",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: HexColor(AppTheme.secondaryColorString!),
                              height: 1.6,
                            ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        hintText: "Country",
                        prefix: null,
                        sufix: Icon(
                          Icons.keyboard_arrow_down,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                          size: 20,
                        ),
                        textEditingController:
                            TextEditingController(text: "Singapore"),
                        inputType: TextInputType.number,
                        isObsecure: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomButton(
              text: "Continue",
              onTap: () {
                Get.to(
                  () => const AccountScreen(
                    isAuth: true,
                  ),
                  transition: Transition.rightToLeft,
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
