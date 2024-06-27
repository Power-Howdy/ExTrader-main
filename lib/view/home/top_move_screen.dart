// ignore_for_file: deprecated_member_use

import 'package:coinspace/config.dart';

class TopMoveScreen extends StatefulWidget {
  const TopMoveScreen({super.key});

  @override
  State<TopMoveScreen> createState() => _TopMoveScreenState();
}

class _TopMoveScreenState extends State<TopMoveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackIcon(),
                Text(
                  "Top Movers",
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
            const SizedBox(height: 20),
            Text(
              "Top Gainers",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 7,
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.only(top: 20, bottom: 15),
                itemBuilder: (BuildContext context, int i) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: CoinView(
                      image: i == 0
                          ? imageAssets.h11
                          : i == 1
                              ? imageAssets.h13
                              : i == 2
                                  ? imageAssets.h21
                                  : i == 3
                                      ? imageAssets.h10
                                      : i == 4
                                          ? imageAssets.h15
                                          : i == 5
                                              ? imageAssets.h19
                                              : imageAssets.h18,
                      text1: i == 0
                          ? "Cardano"
                          : i == 1
                              ? "Avalanche"
                              : i == 2
                                  ? "Litecoin"
                                  : i == 3
                                      ? "Aave"
                                      : i == 4
                                          ? "Bitcoin"
                                          : i == 5
                                              ? "Ethereum"
                                              : "Dogecoin",
                      text2: i == 0
                          ? "ADA/USD"
                          : i == 1
                              ? "AVAX/USD"
                              : i == 2
                                  ? "LTC/USD"
                                  : i == 3
                                      ? "AAVE/USD"
                                      : i == 4
                                          ? "BTC/USd"
                                          : i == 5
                                              ? "ETH/USD"
                                              : "DOGE/USD",
                      text3: i == 0
                          ? "1.23"
                          : i == 1
                              ? "93.83"
                              : i == 2
                                  ? "130.94"
                                  : i == 3
                                      ? "182.50"
                                      : i == 4
                                          ? "40,168.53"
                                          : i == 5
                                              ? "0.1382"
                                              : "2744.37",
                      text4: i == 0
                          ? "+25.86%"
                          : i == 1
                              ? "+19.17%"
                              : i == 2
                                  ? "+12.15%"
                                  : i == 3
                                      ? "+10.01%"
                                      : i == 4
                                          ? "+2.16%"
                                          : i == 5
                                              ? "+1.15%"
                                              : "+0.23%",
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
