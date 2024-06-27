// ignore_for_file: deprecated_member_use

import 'package:coinspace/common/theme/app_themes.dart';
import 'package:coinspace/view/profile/done_screen.dart';
import 'package:coinspace/widget/back_icon.dart';
import 'package:coinspace/widget/custom_button.dart';
import 'package:coinspace/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinkScreen extends StatefulWidget {
  const LinkScreen({super.key});

  @override
  State<LinkScreen> createState() => _LinkScreenState();
}

class _LinkScreenState extends State<LinkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackIcon(),
                Text(
                  "Payment Method",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(
                  height: 24,
                  width: 24,
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        "Link your card",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "By adding a new card, you agree to the",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: HexColor(AppTheme.secondaryColorString!),
                            ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "credit/debit card terms.",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: HexColor(AppTheme.primaryColorString!),
                            ),
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: "Name on card",
                        prefix: null,
                        textEditingController: TextEditingController(),
                        sufix: const SizedBox(),
                      ),
                      const SizedBox(height: 25),
                      CustomTextField(
                        hintText: "Card number",
                        prefix: null,
                        textEditingController: TextEditingController(),
                        sufix: const SizedBox(),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              hintText: "MM/YY",
                              prefix: null,
                              textEditingController: TextEditingController(),
                              sufix: const SizedBox(),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: CustomTextField(
                              hintText: "CVC",
                              prefix: null,
                              textEditingController: TextEditingController(),
                              sufix: const SizedBox(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      CustomTextField(
                        hintText: "Postal code",
                        prefix: null,
                        textEditingController: TextEditingController(),
                        sufix: const SizedBox(),
                      )
                    ],
                  )
                ],
              ),
            ),
            CustomButton(
              text: "Add Card",
              onTap: () {
                Get.to(
                  () => const DoneScreen(),
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
