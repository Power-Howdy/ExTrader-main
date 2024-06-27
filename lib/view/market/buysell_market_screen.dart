import 'package:coinspace/common/theme/app_css.dart';
import 'package:coinspace/constants/extrader_contants.dart';
import 'package:coinspace/services/api_service.dart';
import 'package:coinspace/services/secure_storage.dart';
import 'package:coinspace/services/websocket_service.dart';
import 'package:coinspace/widget/back_icon.dart';
import 'package:coinspace/widget/linechart.dart';
import 'package:coinspace/widget/numeric_step_button.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BuySellMarketPage extends StatefulWidget {
  final String pair_name;
  const BuySellMarketPage({super.key, required this.pair_name});

  @override
  State<BuySellMarketPage> createState() => _BuySellMarketState();
}

class _BuySellMarketState extends State<BuySellMarketPage> {
  final WebSocketService _webSocketService = WebSocketService();
  final APIService _apiService = APIService();
  final SecureStorage _secureStorage = SecureStorage();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<double> bidData = [];
  List<double> askData = [];
  var currentMinValue = 0;
  var currentMaxValue = 0;
  var lowBid = 0;
  var highBid = 0;
  double ask = 0.0;
  double bid = 0.0;
  double high = 0.0;
  double low = 0.0;
  var accessKey = '';
  String quoteSymbol = '';

  Map<String, dynamic> marketType = ExtraderConstants().buysellTypes.first;
  @override
  void initState() {
    super.initState();
    loadAccessKey();
    subscribeAndConnect();
  }

  void loadAccessKey() async {
    String? tempKey = await _secureStorage.getAccessKey();
    if (tempKey != null) {
      setState(() {
        accessKey =
            tempKey; // Assuming accessKey is used where a non-nullable String is required.
      });
    } else {
      // Handle null case, perhaps set a default value or update the UI accordingly.
    }
  }

  Future<void> subscribeAndConnect() async {
    // Ensure accessKey is loaded before attempting to connect
    String? tempKey = await _secureStorage.getAccessKey();
    String wsUrl;
    if (tempKey != null) {
      setState(() {
        accessKey = tempKey;
      });

      wsUrl = 'ws://mt4.extrader-sys.com/OnQuote?id=$accessKey';
      _webSocketService.connect(wsUrl);
      _webSocketService.stream?.listen((message) {
        Map<String, dynamic> data = message;
        String quoteSymbol = data['data']["symbol"];
        var quoteBid = data['data']["bid"];
        var quoteAsk = data['data']["ask"];
        var quoteHigh = data['data']["high"];
        var quoteLow = data['data']["low"];
        String quoteTime = data['data']["time"];
        setState(() {
          high = quoteHigh;
          low = quoteLow;
          if (quoteSymbol == widget.pair_name) {
            ask = quoteAsk;
            bid = quoteBid;
            if (askData.length == 60) {
              askData.removeAt(0); // Remove the first element
            } else {
              askData.add(quoteAsk); // Add the new data at the end
            }
            if (bidData.length == 60) {
              bidData.removeAt(0); // Remove the first element
            } else {
              bidData.add(quoteBid); // Add the new data at the end
            }
          }
        });

        // Handle incoming messages as needed
      });
    } else {
      print("Access key is null. Cannot establish WebSocket connection.");
      // Handle the case where there is no access key
    }
  }

  @override
  void dispose() {
    _webSocketService.close();
    super.dispose();
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
                    const SizedBox(width: 20),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  isExpanded: true,
                  items: ExtraderConstants()
                      .buysellTypes
                      .map((Map<String, dynamic> item) {
                    return DropdownMenuItem<String>(
                      value:
                          item['name'], // Use 'name' as the value for each item
                      child: Center(
                        child: Text(
                          item['label'], // Display 'label' for each item
                          style: AppCss.poppinsRegular17.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  itemHeight: 50.0,
                  elevation: 0,
                  hint: Center(
                    child: Text(
                      marketType['label'],
                      style: AppCss.poppinsRegular17
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  icon: Container(),
                  onChanged: (String? newValue) {
                    // Find the newly selected item map based on 'name'
                    final newMarketType =
                        ExtraderConstants().buysellTypes.firstWhere(
                              (item) => item['name'] == newValue,
                              orElse: () => ExtraderConstants()
                                  .buysellTypes
                                  .first, // Default value or some error handling
                            );
                    setState(() {
                      marketType =
                          newMarketType; // Update the state with the new item
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Align children to the center of the Row's main axis

                  children: [
                    Text(
                      ask.toString(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    const VerticalDivider(
                      width:
                          50, // The width of the divider (includes padding/margin)
                      thickness: 1, // The thickness/width of the line itself
                      color: Colors.black, // Color of the line
                    ),
                    Text(
                      bid.toString(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    NumericStepButton(
                      key: UniqueKey(), // provide a unique key
                      minValue: 0, // minimum value for the stepper
                      maxValue: 10, // maximum value for the stepper
                      step: 0.00001,
                      onChanged: (value) {
                        // this function is triggered when the value is changed

                        // You can also perform other actions based on value change here
                      },
                    ),
                    NumericStepButton(
                      key: UniqueKey(), // provide a unique key
                      minValue: 0, // minimum value for the stepper
                      maxValue: 10, // maximum value for the stepper
                      step: 0.00001,
                      onChanged: (value) {
                        setState(() {});
                        // this function is triggered when the value is changed

                        // You can also perform other actions based on value change here
                      },
                    )
                  ],
                ),
                const SizedBox(height: 100),
                Row(
                  children: [
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 4, // Define an appropriate aspect ratio
                        child: LineChartSample9(
                          chartAskData: askData,
                          chartBidData: bidData,
                          high: high,
                          low: low,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
          children: [
            marketType['name'] != 'market-execution'
                ? const SizedBox.shrink()
                : Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Your button 1 action here
                      },
                      // ignore: sort_child_properties_last
                      child: const Column(
                        mainAxisSize:
                            MainAxisSize.min, // Use min to fit content
                        children: [
                          Text(
                            'Sell', // First text
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          Text(
                            'By Market', // Second text directly below the first
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 10),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Button color
                        foregroundColor: Colors.red, // Text color
                        elevation: 0, // Remove shadow
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.zero, // Remove rounded edges
                        ),
                      ),
                    ),
                  ),
            marketType['name'] != 'market-execution'
                ? const SizedBox.shrink()
                : Container(
                    height: 20, // Adjust the height to fit your design
                    width: 1, // Width of the line
                    color: Colors.black, // Color of the line
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8), // Spacing around the line
                  ),
            marketType['name'] != 'market-execution'
                ? const SizedBox.shrink()
                : Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Your button 1 action here
                      },
                      // ignore: sort_child_properties_last
                      child: const Column(
                        mainAxisSize:
                            MainAxisSize.min, // Use min to fit content
                        children: [
                          Text(
                            'Buy', // First text
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          Text(
                            'By Market', // Second text directly below the first
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 10),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Button color
                        foregroundColor: Colors.blue, // Text color
                        elevation: 0, // Remove shadow
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.zero, // Remove rounded edges
                        ),
                      ),
                    ),
                  ),
            marketType['name'] == 'market-execution'
                ? const SizedBox.shrink()
                : Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Your button 1 action here
                      },
                      // ignore: sort_child_properties_last
                      child: const Text(
                        "Place Order", // First text
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Button color
                        foregroundColor: Colors.blue, // Text color
                        elevation: 0, // Remove shadow
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.zero, // Remove rounded edges
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
