// ignore_for_file: deprecated_member_use

import 'package:coinspace/config.dart';
import 'package:coinspace/common/theme/app_themes.dart';
import 'package:coinspace/view/profile/payment_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                  "Profile",
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
                      const SizedBox(height: 20),
                      Container(
                        height: 120,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: AppTheme.isLightTheme == true
                              ? HexColor(AppTheme.lightGrayString!)
                              : HexColor(AppTheme.darkGrayString!),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Profile Token",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "8219F492-3FF3-401C-A2C9-FEB4C9E73E6D",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
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
                              Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: HexColor(AppTheme.primaryColorString!),
                                ),
                                child: Center(
                                  child: Text(
                                    "Copy",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var i = 0; i < 4; i++)
                            GestureDetector(
                              onTap: () {
                                if (i == 1) {
                                  () => Get.to(
                                        const PaymentScreen(),
                                        transition: Transition.rightToLeft,
                                      );
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
                                                    ? imageAssets.p5
                                                    : i == 2
                                                        ? imageAssets.p6
                                                        : imageAssets.p3,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Text(
                                        i == 0
                                            ? "Profile"
                                            : i == 1
                                                ? "Payment methods"
                                                : i == 2
                                                    ? "Phone number"
                                                    : "Email",
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
      ),
    );
  }
}
