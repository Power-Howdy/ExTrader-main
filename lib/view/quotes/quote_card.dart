// ignore_for_file: deprecated_member_use

import 'package:coinspace/models/symbols_model.dart';
import 'package:flutter/material.dart';

import '../../common/theme/app_themes.dart';
import 'package:coinspace/view/market/trading_view_page.dart';

class QuoteCard extends StatelessWidget {
  final int index = 0;
  final Symbol symbol;
  const QuoteCard({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TradingViewPage(pair_name: symbol.symbol),
            ),
          );
        },
        child: Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
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
                      Row(
                        children: [
                          Text(
                            symbol.symbol,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                    ),
                          ),
                        ],
                      ),
                      Text(
                        symbol.timestmp,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      Text(
                        "Spread:",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: HexColor(AppTheme.greenColorString!),
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        symbol.bid.toString(),
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: !symbol.ishigh
                                  ? HexColor(AppTheme.redColorString!)
                                  : HexColor(AppTheme.greenColorString!),
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Low: ${symbol.low}",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: index == 0 || index == 1
                                  ? HexColor(AppTheme.redColorString!)
                                  : HexColor(AppTheme.greenColorString!),
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        symbol.ask.toString(),
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: !symbol.ishigh
                                  ? HexColor(AppTheme.redColorString!)
                                  : HexColor(AppTheme.greenColorString!),
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "High: ${symbol.low}",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: index == 2
                                  ? HexColor(AppTheme.secondaryColorString!)
                                  : HexColor(AppTheme.greenColorString!),
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
    );
  }
}
