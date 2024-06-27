// ignore_for_file: deprecated_member_use

import 'package:coinspace/config.dart';
import 'package:coinspace/common/theme/app_themes.dart';
import 'package:coinspace/controller/home_controller.dart';
import 'package:coinspace/view/assets/notification_view.dart';
import 'package:coinspace/view/home/card.dart';
import 'package:coinspace/view/market/bitcoin_screen.dart';
import 'package:coinspace/view/profile/scan_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetsView extends StatefulWidget {
  const AssetsView({super.key});

  @override
  State<AssetsView> createState() => _AssetsViewState();
}

class _AssetsViewState extends State<AssetsView> {
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Obx(
        () => homeController.notify.value == true
            ? const NotificationView()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).padding.top + 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          homeController.notify.value = true;
                        },
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: SvgPicture.asset(
                            AppTheme.isLightTheme == true
                                ? imageAssets.h5
                                : imageAssets.m8,
                          ),
                        ),
                      )
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
                              "Portfolio Value",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                            const SizedBox(height: 15),
                            const CardView(),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                Get.bottomSheet(
                                  Container(
                                    height: Get.height / 2.8,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      color: AppTheme.isLightTheme == true
                                          ? Colors.white
                                          : const Color(0xff1C222E),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 30),
                                        for (var i = 0; i < 4; i++)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 16,
                                                right: 16,
                                                bottom: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                ),
                                                Text(
                                                  i == 0
                                                      ? "All Time"
                                                      : i == 1
                                                          ? "24 Hours"
                                                          : i == 2
                                                              ? "Last Trade"
                                                              : "Current Holdings",
                                                  style: Theme.of(Get.context!)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: i == 0
                                                            ? Theme.of(context)
                                                                .textTheme
                                                                .bodyText1!
                                                                .color
                                                            : HexColor(AppTheme
                                                                .secondaryColorString!),
                                                      ),
                                                ),
                                                i == 0
                                                    ? Container(
                                                        height: 20,
                                                        width: 20,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                              imageAssets.h17,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : const SizedBox()
                                              ],
                                            ),
                                          ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "QTY",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      const SizedBox(width: 5),
                                      Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              imageAssets.a3,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "All Time．P/L",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: HexColor(AppTheme
                                                  .secondaryColorString!),
                                            ),
                                      ),
                                      const SizedBox(width: 5),
                                      SizedBox(
                                        height: 12,
                                        width: 12,
                                        child: SvgPicture.asset(
                                          imageAssets.a1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Price",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: HexColor(AppTheme
                                                  .secondaryColorString!),
                                            ),
                                      ),
                                      const SizedBox(width: 5),
                                      Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              imageAssets.a2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var i = 0; i < 5; i++)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const BitcoinScreen(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 80,
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          color: AppTheme.isLightTheme == true
                                              ? HexColor(
                                                  AppTheme.lightGrayString!)
                                              : HexColor(
                                                  AppTheme.darkGrayString!),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          height: 16,
                                                          width: 16,
                                                          child: Image.asset(
                                                            i == 0
                                                                ? imageAssets
                                                                    .h14
                                                                : i == 1
                                                                    ? imageAssets
                                                                        .h19
                                                                    : i == 2
                                                                        ? imageAssets
                                                                            .h26
                                                                        : i == 3
                                                                            ? imageAssets.h18
                                                                            : imageAssets.h25,
                                                          ),
                                                        ),
                                                        Text(
                                                          i == 0
                                                              ? "  \$819,702"
                                                              : i == 1
                                                                  ? "  \$178,658"
                                                                  : i == 2
                                                                      ? "  \$93,267"
                                                                      : "  \$7,768",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                  ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      i == 0
                                                          ? "20.406595 BTC"
                                                          : i == 1
                                                              ? "65.106697 ETH"
                                                              : i == 2
                                                                  ? "93,267.02 USDC"
                                                                  : "56212.58 DOGE",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: HexColor(AppTheme
                                                                .greenColorString!),
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 14),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      i == 0
                                                          ? "-84,265.36"
                                                          : i == 1
                                                              ? "+44,199.00"
                                                              : i == 2
                                                                  ? "+44,199.00"
                                                                  : "+44,199.00",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color: i == 0 ||
                                                                    i == 1
                                                                ? HexColor(AppTheme
                                                                    .redColorString!)
                                                                : HexColor(AppTheme
                                                                    .greenColorString!),
                                                          ),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      i == 0
                                                          ? "-10.28%"
                                                          : i == 1
                                                              ? "-8.15%"
                                                              : i == 2
                                                                  ? "+0.03%"
                                                                  : "+1.85%",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: i == 0 ||
                                                                    i == 1
                                                                ? HexColor(AppTheme
                                                                    .redColorString!)
                                                                : HexColor(AppTheme
                                                                    .greenColorString!),
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 14),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      i == 0
                                                          ? "40,168.53"
                                                          : i == 1
                                                              ? "2744.37"
                                                              : i == 2
                                                                  ? "1.00"
                                                                  : "0.1382",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                          ),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      i == 0
                                                          ? "+2.16%"
                                                          : i == 1
                                                              ? "+1.15%"
                                                              : i == 2
                                                                  ? "+0.00%"
                                                                  : "+0.23%",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: i == 2
                                                                ? HexColor(AppTheme
                                                                    .secondaryColorString!)
                                                                : HexColor(AppTheme
                                                                    .greenColorString!),
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
