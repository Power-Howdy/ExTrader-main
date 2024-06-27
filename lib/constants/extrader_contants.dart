class ExtraderConstants {
  List<String> metatraderSymbols = [
    "EURUSD",
    "GBPUSD",
    "USDJPY",
    "AUDUSD",
    "USDCHF",
    "USDCAD",
    "NZDUSD",
    "EURGBP",
    "EURJPY",
    "GBPJPY",
    "AUDJPY",
    "CADJPY",
    "NZDJPY",
    "EURCHF",
    "GBPCHF",
    "CHFJPY",
    "EURAUD",
    "EURCAD",
    "AUDCAD",
    "GBPAUD",
    "GBPCAD",
    "AUDNZD",
    "GBPNZD",
    "NZDCAD",
    "XAUUSD",
    "XAGUSD",
    // Add more symbols as needed
  ];

  List<Map<String, dynamic>> buysellTypes = [
    {'index': 0, 'label': "Market Execution", 'name': "market-execution"},
    {'index': 1, 'label': "Buy Limit", 'name': "buy-limit"},
    {'index': 2, 'label': "Sell Limit", 'name': "sell-limit"},
    {'index': 3, 'label': "Buy Stop", 'name': "buy-stop"},
    {'index': 4, 'label': "Sell Stop", 'name': "sell-stop"},
  ];
}
