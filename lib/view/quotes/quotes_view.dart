import 'dart:convert';
import 'dart:core';
import 'dart:math';
import 'package:coinspace/config.dart';
import 'package:coinspace/common/theme/app_themes.dart';
import 'package:coinspace/constants/extrader_contants.dart';
import 'package:coinspace/controller/home_controller.dart';
import 'package:coinspace/models/symbols_model.dart';
import 'package:coinspace/services/api_service.dart';
import 'package:coinspace/services/secure_storage.dart';
import 'package:coinspace/services/websocket_service.dart';
import 'package:coinspace/view/assets/notification_view.dart';
import 'package:coinspace/view/quotes/quote_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';
import 'package:coinspace/view/market/trading_view_page.dart';
import 'dart:developer' as developer;

class QuotesView extends StatefulWidget {
  const QuotesView({super.key});

  @override
  State<QuotesView> createState() => _QuotesViewState();
}

class _QuotesViewState extends State<QuotesView> {
  final homeController = Get.put(HomeController());
  final APIService _apiService = APIService();
  final SecureStorage _secureStorage = SecureStorage();
  final WebSocketService _webSocketService = WebSocketService();
  var accessKey = '';
  late IOWebSocketChannel channel;
  List<String> updatedQuotes = [];
  List<Symbol> symbols = [];
  @override
  void initState() {
    super.initState();
    loadAccessKey().then((access_token) {
      subscribeAndConnect();
    });
  }

  Future<String?> loadAccessKey() async {
    String? tempKey = await _secureStorage.getAccessKey();
    if (tempKey != null) {
      setState(() {
        accessKey =
            tempKey; // Assuming accessKey is used where a non-nullable String is required.
      });
    } else {
      // Handle null case, perhaps set a default value or update the UI accordingly.
    }
    return tempKey;
  }

  Future<void> subscribeAndConnect() async {
    // Ensure accessKey is loaded before attempting to connect
    String? tempKey = await _secureStorage.getAccessKey();
    String wsUrl;
    if (tempKey != null) {
      setState(() {
        accessKey = tempKey;
      });

      await _apiService.subscribeMany(access_token: accessKey).then((value) {
        wsUrl = 'ws://mt4.extrader-sys.com/OnQuote?id=$accessKey';
        _webSocketService.connect(wsUrl);
        for (var element in ExtraderConstants().metatraderSymbols) {
          Symbol newSymbol = Symbol(
            element,
            0,
            0,
            0,
            0,
            '',
            true,
          );
          setState(() {
            symbols.add(newSymbol);
          });
        }

        _webSocketService.stream.listen((message) {
          setState(() {
            Map<String, dynamic> data = message;
            String quoteSymbol = data['data']["symbol"];
            double quoteBid = data['data']["bid"];
            double quoteAsk = data['data']["ask"];
            double quoteHigh = data['data']["high"];
            double quoteLow = data['data']["low"];
            String quoteTime = data['data']["time"];
            DateTime dateTime = DateTime.parse(quoteTime);
            bool symbolExists = false;
            bool ishigh = false;

            for (int i = 0; i < symbols.length; i++) {
              if (symbols[i].symbol == quoteSymbol) {
                symbolExists = true;
                symbols[i].ishigh = quoteBid >= symbols[i].bid;
                symbols[i].bid = quoteBid;
                symbols[i].ask = quoteAsk;
                symbols[i].high = quoteHigh;
                symbols[i].low = quoteLow;
                symbols[i].timestmp = quoteTime;

                break;
              }
            }
            // (quoteSymbol);
            // if (!symbolExists) {
            //   Symbol newSymbol = Symbol(quoteSymbol, quoteBid, quoteAsk,
            //       quoteHigh, quoteLow, quoteTime, ishigh);
            //   symbols.add(newSymbol);
            // }
          });
        });
      });
    } else {
      print("Access key is null. Cannot establish WebSocket connection.");
      // Handle the case where there is no access key
    }
  }

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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var symbol in symbols)
                                  QuoteCard(symbol: symbol),
                              ],
                            ),
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
