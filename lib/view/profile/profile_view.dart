// ignore_for_file: deprecated_member_use

import 'package:coinspace/config.dart';
import 'package:coinspace/common/theme/app_themes.dart';
import 'package:coinspace/view/auth/onboarding_screen.dart';
import 'package:coinspace/view/profile/app_setting_screen.dart';
import 'package:coinspace/view/profile/notification_screen.dart';
import 'package:coinspace/view/profile/language_screen.dart';
import 'package:coinspace/view/profile/reward_screen.dart';
import 'package:coinspace/view/profile/scan_screen.dart';
import 'package:coinspace/view/profile/security_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool _notificationSwitchValue = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
              Text(
                "Settings",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.dialog(
                        const ScanScreen(),
                      );
                    },
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset(
                        imageAssets.h24,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset(
                      AppTheme.isLightTheme == true
                          ? imageAssets.h5
                          : imageAssets.m8,
                    ),
                  )
                ],
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
                    /*const SizedBox(height: 20),
                    Text(
                      "Tony Stark",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "java.super.dev@mail.com",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 172,
                      width: Get.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppTheme.isLightTheme == true
                                ? imageAssets.m4
                                : imageAssets.darkPay,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),*/
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var i = 0; i < 5; i++)
                          GestureDetector(
                            onTap: () {
                              if (i == 0) {
                                Get.to(
                                  () => const LanguageScreen(),
                                  transition: Transition.rightToLeft,
                                );
                              } else if (i == 1) {
                                _showConfirmationDialog();
                              } else if (i == 2) {
                                
                              } else if (i == 3) {
                                
                              } else if (i == 4) {
                                
                              }
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: AppTheme.isLightTheme == true
                                            ? HexColor(
                                                AppTheme.lightGrayString!)
                                            : HexColor(
                                                AppTheme.darkGrayString!),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset(
                                          i == 0
                                              ? imageAssets.m18
                                              : i == 1
                                                  ? imageAssets.m19
                                                  : i == 2
                                                      ? imageAssets.m9
                                                      : i == 3
                                                          ? imageAssets.m17
                                                            : imageAssets.m24,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                      i == 0
                                          ? "Languages"
                                          : i == 1
                                              ? "Notification"
                                              : i == 2
                                                  ? "Funds Charge"
                                                  : i == 3
                                                      ? "Point Purchase"
                                                        : "Reward Withdrawal",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                    if (i == 1) // Add switch button for Notification item
                                      const Spacer(),
                                    if (i == 1) // Add switch button for Notification item
                                      Switch(
                                        value: _notificationSwitchValue, // Placeholder value
                                        onChanged: (newValue) {
                                          // Handle switch onChanged
                                          setState(() {
                                            _notificationSwitchValue = newValue;
                                          });
                                        },
                                        activeColor: Colors.white,
                                        activeTrackColor: Colors.green,
                                      ),
                                    if (i != 1)
                                      const Expanded(child: SizedBox()),
                                    if (i != 1)
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .color,
                                        size: 12,
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Divider(
                                  height: 1,
                                  color:
                                      HexColor(AppTheme.secondaryColorString!)
                                          .withOpacity(0.2),
                                ),
                                const SizedBox(height: 15),
                              ],
                            ),
                          )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showConfirmationDialog() async {
  return showCupertinoDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text('Notification'),
        actions: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CupertinoDialogAction(
                onPressed: () {
                  // Perform necessary actions when confirmation is confirmed
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                isDestructiveAction: true,
                child: Text('Cancel'),
              ),
            ],
          ),
        ],
      );
    },
  );
}
}
