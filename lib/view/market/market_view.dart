// ignore_for_file: deprecated_member_use

import 'package:coinspace/config.dart';
import 'package:coinspace/controller/home_controller.dart';
import 'package:coinspace/view/market/bitcoin_screen.dart';
import 'package:coinspace/view/profile/scan_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/theme/app_themes.dart';

class MarketView extends StatefulWidget {
  const MarketView({super.key});

  @override
  State<MarketView> createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> {
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                "Market",
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
                    const SizedBox(height: 30),
                    Container(
                      height: 48,
                      width: Get.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: HexColor(AppTheme.secondaryColorString!)
                              .withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFormField(
                        controller: homeController.searchController.value,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              top: 13, left: 14, right: 14),
                          border: InputBorder.none,
                          prefixIcon: SizedBox(
                            height: 24,
                            width: 24,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(
                                imageAssets.search,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                              ),
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              homeController.searchController.value.clear();
                              setState(() {});
                            },
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                  imageAssets.h3,
                                ),
                              ),
                            ),
                          ),
                          hintText: "Search",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: HexColor(AppTheme.secondaryColorString!),
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => homeController
                              .searchController.value.text.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var i = 0; i < 2; i++)
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        () => const BitcoinScreen(),
                                        transition: Transition.rightToLeft,
                                      );
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: CoinView(
                                        image: i == 0
                                            ? imageAssets.h15
                                            : imageAssets.h19,
                                        text1: i == 0 ? "Bitcoin" : "Ethereum",
                                        text2: i == 0 ? "BTC/USs" : "ETH/USD",
                                        text3: i == 0 ? "40,168.53" : "2744.37",
                                        text4: i == 0 ? "+2.16%" : "+1.15%",
                                      ),
                                    ),
                                  ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var i = 0; i < 6; i++)
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        () => const BitcoinScreen(),
                                        transition: Transition.rightToLeft,
                                      );
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: CoinView(
                                        image: i == 0
                                            ? imageAssets.h15
                                            : i == 1
                                                ? imageAssets.h19
                                                : i == 2
                                                    ? imageAssets.h26
                                                    : i == 3
                                                        ? imageAssets.h18
                                                        : i == 4
                                                            ? imageAssets.h25
                                                            : imageAssets.h20,
                                        text1: i == 0
                                            ? "Bitcoin"
                                            : i == 1
                                                ? "Ethereum"
                                                : i == 2
                                                    ? "USD Coin"
                                                    : i == 3
                                                        ? "Dogecoin"
                                                        : i == 4
                                                            ? "The Sandbox"
                                                            : "Flow",
                                        text2: i == 0
                                            ? "BTC/USds"
                                            : i == 1
                                                ? "ETH/USD"
                                                : i == 2
                                                    ? "ETH/USD"
                                                    : i == 3
                                                        ? "DOGE/USD"
                                                        : i == 4
                                                            ? "SAND/USD"
                                                            : "ETH/USD",
                                        text3: i == 0
                                            ? "40,168.53"
                                            : i == 1
                                                ? "2744.37"
                                                : i == 2
                                                    ? "1.00"
                                                    : i == 3
                                                        ? "3.31"
                                                        : i == 4
                                                            ? "5.89"
                                                            : "2744.37",
                                        text4: i == 0
                                            ? "+2.16%"
                                            : i == 1
                                                ? "+1.15%"
                                                : i == 2
                                                    ? "+0.00%"
                                                    : i == 3
                                                        ? "+0.23%"
                                                        : i == 4
                                                            ? "-5.14%"
                                                            : "+1.15%",
                                        graphImage: i == 0
                                            ? imageAssets.h29
                                            : i == 2
                                                ? imageAssets.h31
                                                : i == 3
                                                    ? imageAssets.h32
                                                    : imageAssets.h30,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                    ),
                    const SizedBox(height: 20),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
