// ignore_for_file: deprecated_member_use

import 'package:coinspace/common/theme/app_themes.dart';
import 'package:coinspace/view/auth/address_screen.dart';
import 'package:coinspace/widget/back_icon.dart';
import 'package:coinspace/widget/custom_button.dart';
import 'package:coinspace/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
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
                        "Join CoinSpace",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: "First Name",
                        prefix: null,
                        sufix: const SizedBox(),
                        textEditingController:
                            TextEditingController(text: "Tony"),
                        inputType: TextInputType.name,
                        isObsecure: false,
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: "Last Name",
                        prefix: null,
                        sufix: const SizedBox(),
                        textEditingController:
                            TextEditingController(text: "Stark"),
                        inputType: TextInputType.name,
                        isObsecure: false,
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: "DOB",
                        prefix: null,
                        sufix: const SizedBox(),
                        textEditingController:
                            TextEditingController(text: "06 / 21 / 1979"),
                        inputType: TextInputType.name,
                        isObsecure: false,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "We use 128-bit encryption for added security, and this\ninformation is only used for identity verification purposes.",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: HexColor(AppTheme.secondaryColorString!),
                              height: 1.6,
                            ),
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
                  () => const AddressScreen(),
                  transition: Transition.rightToLeft,
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
