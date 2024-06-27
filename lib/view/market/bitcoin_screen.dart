// ignore_for_file: deprecated_member_use

import 'package:coinspace/config.dart';
import 'package:coinspace/controller/home_controller.dart';
import 'package:coinspace/view/market/buy_bottomsheet.dart';
import 'package:coinspace/view/market/share_sheet.dart';
import 'package:coinspace/view/market/transaction_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/theme/app_themes.dart';

class BitcoinScreen extends StatefulWidget {
  const BitcoinScreen({super.key});

  @override
  State<BitcoinScreen> createState() => _BitcoinScreenState();
}

class _BitcoinScreenState extends State<BitcoinScreen> {
  final homeController = Get.put(HomeController());
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 15),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackIcon(),
                Text(
                  "Bitcoin",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        scaffoldKey.currentState!.showBottomSheet(
                          backgroundColor: Colors.transparent,
                          (context) => const ShareSheet(),
                        );
                      },
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(
                          imageAssets.m21,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset(
                        imageAssets.m22,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const ClampingScrollPhysics(),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      child: Text(
                        "BTC/USDT",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: HexColor(AppTheme.secondaryColorString!),
                            ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "40,168.53",
                            style:
                                Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w800,
                                    ),
                          ),
                          Text(
                            "+980.67 (2.16%)",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: HexColor(AppTheme.greenColorString!),
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 32,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: HexColor(AppTheme.secondaryColorString!)
                                .withOpacity(0.2),
                          ),
                          color: AppTheme.isLightTheme == true
                              ? HexColor(AppTheme.lightGrayString!)
                              : HexColor(AppTheme.darkGrayString!),
                        ),
                        child: Obx(
                          () => Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    homeController.isBit.value = 0;
                                  },
                                  child: Container(
                                    height: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: homeController.isBit.value == 0
                                          ? HexColor(
                                              AppTheme.primaryColorString!)
                                          : Colors.transparent,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Price",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  homeController.isBit.value ==
                                                          0
                                                      ? Colors.white
                                                      : Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .color,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    homeController.isBit.value = 1;
                                  },
                                  child: Container(
                                    height: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: homeController.isBit.value == 1
                                          ? HexColor(
                                              AppTheme.primaryColorString!)
                                          : Colors.transparent,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Depth",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  homeController.isBit.value ==
                                                          1
                                                      ? Colors.white
                                                      : Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .color,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    homeController.isBit.value = 2;
                                  },
                                  child: Container(
                                    height: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: homeController.isBit.value == 2
                                          ? HexColor(
                                              AppTheme.primaryColorString!)
                                          : Colors.transparent,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Info",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  homeController.isBit.value ==
                                                          2
                                                      ? Colors.white
                                                      : Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .color,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Obx(
                      () => homeController.isBit.value == 2
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppTheme.isLightTheme == true
                                      ? HexColor(AppTheme.lightGrayString!)
                                      : HexColor(AppTheme.darkGrayString!),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, top: 20, bottom: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "About Bitcoin",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                          ),
                                          Text(
                                            "Read More",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w800,
                                                  color: HexColor(AppTheme
                                                      .primaryColorString!),
                                                ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        "The world's first cryptocurrency, Bitcoin is stored and exchanged securely on the internet through a digital ledger known as a blockchain. Bitcoins are…",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: HexColor(AppTheme
                                                  .secondaryColorString!),
                                              height: 1.6,
                                            ),
                                      ),
                                      const SizedBox(height: 15),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          for (var i = 0; i < 6; i++)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 15),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    height: 16,
                                                    width: 16,
                                                    child: SvgPicture.asset(
                                                      i == 0
                                                          ? imageAssets.m33
                                                          : i == 1
                                                              ? imageAssets.m14
                                                              : i == 2
                                                                  ? imageAssets
                                                                      .m12
                                                                  : i == 3
                                                                      ? imageAssets
                                                                          .m10
                                                                      : i == 4
                                                                          ? imageAssets
                                                                              .m10
                                                                          : imageAssets
                                                                              .m26,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    "Rank",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: HexColor(AppTheme
                                                              .secondaryColorString!),
                                                        ),
                                                  ),
                                                  const Expanded(
                                                      child: SizedBox()),
                                                  Text(
                                                    "2016",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: HexColor(AppTheme
                                                              .secondaryColorString!),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              height: 289,
                              width: Get.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    homeController.isBit.value == 0
                                        ? AppTheme.isLightTheme == true
                                            ? imageAssets.m3
                                            : imageAssets.darkGraph
                                        : imageAssets.m5,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                    ),
                    const TransactionView(),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Buy",
                    onTap: () {
                      Get.bottomSheet(
                        const BuyBottomSheet(),
                      );
                    },
                    bg: HexColor(AppTheme.greenColorString!),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: CustomButton(
                    text: "Sell",
                    onTap: () {},
                    bg: HexColor(AppTheme.redColorString!),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
