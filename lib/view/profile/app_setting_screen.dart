// ignore_for_file: deprecated_member_use

import 'package:coinspace/config.dart';
import 'package:coinspace/common/theme/app_themes.dart';
import 'package:coinspace/controller/profile_controller.dart';
import 'package:coinspace/main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSettingScreen extends StatefulWidget {
  const AppSettingScreen({super.key});

  @override
  State<AppSettingScreen> createState() => _AppSettingScreenState();
}

class _AppSettingScreenState extends State<AppSettingScreen> {
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    int light = 1;
    int dark = 2;
    changeColor(int color) {
      if (color == light) {
        MyApp.setCustomeTheme(context, 6);
      } else {
        MyApp.setCustomeTheme(context, 7);
      }
    }

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
                  "App Settings",
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
                    GestureDetector(
                      onTap: () {
                        if (AppTheme.isLightTheme == true) {
                          changeColor(dark);
                        } else {
                          changeColor(light);
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
                                      ? HexColor(AppTheme.lightGrayString!)
                                      : HexColor(AppTheme.darkGrayString!),
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: i == 1
                                      ? SvgPicture.asset(
                                          imageAssets.m26,
                                          color: const Color(0xff2DD4BF),
                                        )
                                      : SvgPicture.asset(
                                          i == 0
                                              ? imageAssets.p2
                                              : i == 1
                                                  ? imageAssets.m26
                                                  : i == 2
                                                      ? imageAssets.p4
                                                      : imageAssets.p7,
                                        ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                i == 0
                                    ? "Display"
                                    : i == 1
                                        ? "Language"
                                        : i == 2
                                            ? "Night mode"
                                            : "Preference",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                              const Expanded(child: SizedBox()),
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
                          const SizedBox(height: 20),
                          Divider(
                            height: 1,
                            color: HexColor(AppTheme.secondaryColorString!)
                                .withOpacity(0.2),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
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
