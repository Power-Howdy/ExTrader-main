// ignore_for_file: deprecated_member_use

import 'package:coinspace/config.dart';
import 'package:coinspace/common/theme/app_themes.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 15),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackIcon(),
                Text(
                  "Bitcoin News",
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
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 8,
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            physics: const ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int i) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
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
              );
            },
          ))
        ],
      ),
    );
  }
}
