import 'package:coinspace/config/images.dart';
import 'package:coinspace/config/textstyle.dart';
import 'package:coinspace/view/market/buysell_market_screen.dart';
import 'package:coinspace/view/market/share_sheet.dart';
import 'package:coinspace/widget/back_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TradingViewPage extends StatefulWidget {
  final String pair_name;
  const TradingViewPage({super.key, required this.pair_name});

  @override
  State<TradingViewPage> createState() => _TradingViewPageState();
}

class _TradingViewPageState extends State<TradingViewPage> {
  late final WebViewController controller;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse('http://118.27.13.128:9500?symbol=${widget.pair_name}'),
      );
  }

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
                  widget.pair_name,
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
                          DefaultImages.m21,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BuySellMarketPage(
                                  pair_name: widget.pair_name),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 30,
                          width: 24,
                          child: SvgPicture.asset(
                            DefaultImages.addPosition,
                            color: Theme.of(context).textTheme.bodyMedium!.color,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: WebViewWidget(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
