// ignore_for_file: deprecated_member_use

import 'package:coinspace/common/theme/app_themes.dart';
import 'package:coinspace/controller/profile_controller.dart';
import 'package:coinspace/widget/back_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
                  "Notifications",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                  const SizedBox(height: 30),
                  Text(
                    "Push Notifications",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: HexColor(AppTheme.secondaryColorString!),
                        ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Turn On / Off ",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      SizedBox(
                        height: 10,
                        child: CupertinoSwitch(
                          activeColor: HexColor(AppTheme.primaryColorString!),
                          value: profileController.isSecurity.value,
                          onChanged: (v) {
                            setState(() {
                              profileController.isSecurity.value = v;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Divider(
                    height: 1,
                    color: HexColor(AppTheme.secondaryColorString!)
                        .withOpacity(0.2),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Customize Notifications",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: HexColor(AppTheme.secondaryColorString!),
                        ),
                  ),
                  const SizedBox(height: 25),
                  for (var i = 0; i < 4; i++)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    i == 0
                                        ? "Security alerts"
                                        : i == 1
                                            ? "Account activity"
                                            : i == 2
                                                ? "Price alerts"
                                                : "News",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                        ),
                                  ),
                                  const SizedBox(height: 9),
                                  Text(
                                    i == 0
                                        ? "Push, Email, SMS, In app"
                                        : i == 1
                                            ? "Push, Email, In app"
                                            : i == 2
                                                ? "Push, In app, Email"
                                                : "In app",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: HexColor(
                                              AppTheme.secondaryColorString!),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                              size: 12,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Divider(
                          height: 1,
                          color: HexColor(AppTheme.secondaryColorString!)
                              .withOpacity(0.2),
                        ),
                        const SizedBox(height: 15),
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
