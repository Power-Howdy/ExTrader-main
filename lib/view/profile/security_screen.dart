// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:coinspace/common/theme/app_themes.dart';
import 'package:coinspace/controller/profile_controller.dart';
import 'package:coinspace/widget/back_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackIcon(),
                Text(
                  "Security",
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
                  const SizedBox(height: 50),
                  for (var i = 0; i < 4; i++)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              i == 0
                                  ? "Require PIN / Face ID"
                                  : i == 1
                                      ? "PIN / Face ID Settings"
                                      : i == 2
                                          ? "Password Settings"
                                          : "Change Password",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                            i == 0
                                ? SizedBox(
                                    height: 10,
                                    child: CupertinoSwitch(
                                      activeColor: HexColor(
                                          AppTheme.primaryColorString!),
                                      value: profileController.isSecurity.value,
                                      onChanged: (v) {
                                        setState(() {
                                          profileController.isSecurity.value =
                                              v;
                                        });
                                      },
                                    ),
                                  )
                                : Icon(
                                    Icons.arrow_forward_ios,
                                    color: Theme.of(context)
                                        .textTheme
                                        // ignore: deprecated_member_use
                                        .bodyMedium!
                                        .color,
                                    size: 12,
                                  ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Divider(
                          height: 1,
                          color: HexColor(AppTheme.secondaryColorString!)
                              .withOpacity(0.2),
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
