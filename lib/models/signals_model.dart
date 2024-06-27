class SignalsModel {
  int id;
  String signalName;
  String userName;
  String userIamge;
  String country;
  String firstTradeDate;
  String growth;
  double balance;
  double profit;
  String avgProfit;
  int subscribers;

  SignalsModel({
    required this.id,
    required this.signalName,
    required this.userName,
    required this.userIamge,
    required this.country,
    required this.firstTradeDate,
    required this.growth,
    required this.balance,
    required this.profit,
    required this.avgProfit,
    required this.subscribers,
  });

  factory SignalsModel.fromJson(Map<String, dynamic> json) {
    return SignalsModel(
      id: json['id'],
      signalName: json['signal_name'],
      userName: json['user_name'],
      userIamge: json['user_image'],
      country: json['country'],
      firstTradeDate: json['first_trade_date'],
      growth: json['growth'],
      balance: json['balance'],
      profit: json['profit'],
      avgProfit: json['average_profit'],
      subscribers: json['subscribers'],
    );
  }
}
