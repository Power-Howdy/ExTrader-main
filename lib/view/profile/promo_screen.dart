// ignore_for_file: deprecated_member_use

import 'package:coinspace/widget/back_icon.dart';
import 'package:coinspace/widget/custom_button.dart';
import 'package:coinspace/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({super.key});

  @override
  State<PromoScreen> createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
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
                  "Promo Code",
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
                        "Enter promo code",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: "Promo code",
                        prefix: null,
                        sufix: const SizedBox(),
                        textEditingController: TextEditingController(),
                      )
                    ],
                  )
                ],
              ),
            ),
            CustomButton(
              text: "Redeem",
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
