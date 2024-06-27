// ignore_for_file: deprecated_member_use

import 'package:coinspace/config.dart';
import 'package:coinspace/common/theme/app_themes.dart';
import 'package:coinspace/view/market/news_screen.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Divider(
            height: 1,
            color: HexColor(AppTheme.secondaryColorString!).withOpacity(0.2),
            thickness: 1.6,
          ),
          const SizedBox(height: 20),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Text(
                      "Order Book",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "Trade History",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Container(
                  height: 3,
                  width: Get.width / 4.5,
                  color: HexColor(AppTheme.primaryColorString!),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Divider(
              height: 1,
              color: HexColor(AppTheme.secondaryColorString!).withOpacity(0.2),
              thickness: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          for (var i = 0; i < 10; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 14, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    i == 0
                        ? "0.001672"
                        : i == 1
                            ? "0.012783"
                            : i == 2
                                ? "0.034619"
                                : i == 3
                                    ? "0.006621"
                                    : i == 4
                                        ? "0.012053"
                                        : i == 5
                                            ? "0.009125"
                                            : i == 6
                                                ? "0.016348"
                                                : i == 7
                                                    ? "0.001729"
                                                    : i == 8
                                                        ? "0.014535"
                                                        : "0.009921",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Row(
                    children: [
                      Text(
                        i == 0
                            ? "40,162.14"
                            : i == 1
                                ? "39,953.21"
                                : i == 2
                                    ? "39,900.12"
                                    : i == 3
                                        ? "39,841.78"
                                        : i == 4
                                            ? "39,798.01"
                                            : i == 5
                                                ? "39,701.76"
                                                : i == 6
                                                    ? "39,633.18"
                                                    : i == 7
                                                        ? "39,502.71"
                                                        : i == 8
                                                            ? "38,417.09"
                                                            : "39,001.82",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: HexColor(AppTheme.greenColorString!),
                            ),
                      ),
                      const SizedBox(width: 14),
                      Text(
                        i == 0
                            ? "40,166.82"
                            : i == 1
                                ? "39,962.74"
                                : i == 2
                                    ? "39,928.36"
                                    : i == 3
                                        ? "39,887.52"
                                        : i == 4
                                            ? "39,803.56"
                                            : i == 5
                                                ? "39,788.92"
                                                : i == 6
                                                    ? "39,673.85"
                                                    : i == 7
                                                        ? "39,562.51"
                                                        : i == 8
                                                            ? "39,492.01"
                                                            : "39,272.69",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: HexColor(AppTheme.redColorString!),
                            ),
                      ),
                    ],
                  ),
                  Text(
                    i == 0
                        ? "0.006291"
                        : i == 1
                            ? "0.015928"
                            : i == 2
                                ? "0.013094"
                                : i == 3
                                    ? "0.012389"
                                    : i == 4
                                        ? "0.005918"
                                        : i == 5
                                            ? "0.008921"
                                            : i == 6
                                                ? "0.015769"
                                                : i == 7
                                                    ? "0.001728"
                                                    : i == 8
                                                        ? "0.008913"
                                                        : "0.015336",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 10),
          Divider(
            height: 1,
            color: HexColor(AppTheme.secondaryColorString!).withOpacity(0.2),
            thickness: 1.6,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 15),
            child: Text(
              "Bitcoin News",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ),
          Column(
            children: [
              for (var i = 0; i < 5; i++)
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                  child: Container(
                    height: 80,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppTheme.isLightTheme == true
                          ? HexColor(AppTheme.lightGrayString!)
                          : HexColor(AppTheme.darkGrayString!),
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
                                  i == 0
                                      ? "Nasdaq-Listed Microstrategy Obtains \$205 Million Bitcoin-Backed Loan to…"
                                      : i == 1
                                          ? "Bitcoin: Relief Rally Then Dip"
                                          : i == 2
                                              ? "TA: Bitcoin Key Indicators Suggest Strengthening Case For More…"
                                              : i == 3
                                                  ? "A \$165 Million 'Bitcoin Odyssey': Okcoin, Stacks Aim to Accelerate BTC…"
                                                  : "Market Wrap: Bitcoin Stuck Below \$40K, Altcoins See Less Selling…",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        height: 1.4,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  i == 0
                                      ? "Bitcoin News • 1h"
                                      : i == 1
                                          ? "Seeking Alpha •1h"
                                          : i == 2
                                              ? "NeWsBTC • 1h"
                                              : i == 3
                                                  ? "Decryot • 1h"
                                                  : "CoinDesk • 2h",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: HexColor(
                                            AppTheme.secondaryColorString!),
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 14),
                          Container(
                            height: 56,
                            width: 56,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  i == 0
                                      ? imageAssets.m31
                                      : i == 1
                                          ? imageAssets.m27
                                          : i == 2
                                              ? imageAssets.m28
                                              : i == 3
                                                  ? imageAssets.m29
                                                  : imageAssets.m30,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Get.to(
                () => const NewsScreen(),
                transition: Transition.rightToLeft,
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Container(
                height: 45,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppTheme.isLightTheme == true
                      ? HexColor(AppTheme.lightGrayString!)
                      : HexColor(AppTheme.darkGrayString!),
                ),
                child: Center(
                  child: Text(
                    "Read More",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
