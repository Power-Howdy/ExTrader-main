// ignore_for_file: deprecated_member_use

import 'package:coinspace/common/theme/app_themes.dart';
import 'package:coinspace/view/auth/authentication_screen.dart';
import 'package:coinspace/widget/back_icon.dart';
import 'package:coinspace/widget/custom_button.dart';
import 'package:coinspace/widget/custom_textfield.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
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
            const SizedBox(height: 30),
            Text(
              "Phone Number",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              "Enter your phone number so we can text\nyou an authentication code.",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: HexColor(AppTheme.secondaryColorString!),
                    height: 1.6,
                  ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hintText: "Password",
              prefix: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                  width: 80,
                  child: Row(
                    children: [
                      CountryPickerDropdown(
                        initialValue: 'IN',
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: HexColor(AppTheme.secondaryColorString!),
                          size: 20,
                        ),
                        itemBuilder: (Country country) => Container(
                          height: 26,
                          width: 26,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child:
                                CountryPickerUtils.getDefaultFlagImage(country),
                          ),
                        ),
                        sortComparator: (Country a, Country b) =>
                            a.isoCode.compareTo(b.isoCode),
                        onValuePicked: (Country country) {
                          debugPrint(country.name);
                        },
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 26,
                        width: 1.2,
                        color: HexColor(AppTheme.secondaryColorString!),
                      ),
                    ],
                  ),
                ),
              ),
              sufix: const SizedBox(),
              textEditingController: TextEditingController(),
              inputType: TextInputType.emailAddress,
              isObsecure: false,
            ),
            const Expanded(child: SizedBox()),
            CustomButton(
              text: "Continue",
              onTap: () {
                Get.to(
                  () => const AuthenticationScreen(),
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
