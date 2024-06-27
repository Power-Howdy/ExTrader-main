import 'package:coinspace/config.dart';

class OtherStrategiesWidget extends StatelessWidget {
  const OtherStrategiesWidget({Key? key, required this.signal})
      : super(key: key);

  final SignalsModel signal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: InkWell(
        onTap: () {
          Get.to(
            () => SignalDetailView(signal: signal),
            transition: Transition.rightToLeft,
          );
        },
        child: ListView(
          padding: const EdgeInsets.only(top: 20),
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            SignalItemView(
              signal: SignalsModel(
                id: 1,
                signalName: "Capability",
                userName: "Evgenii Gavrilov",
                userIamge: imageAssets.defaultAvatar,
                country: imageAssets.flag1,
                firstTradeDate: "2023/4/30",
                growth: '1801',
                balance: 30,
                profit: 16792.51,
                avgProfit: "100",
                subscribers: 76,
              ),
            ),
            SignalItemView(
              signal: SignalsModel(
                id: 2,
                signalName: "PriceAction2",
                userName: "Evgenii Gavrilov",
                userIamge: imageAssets.defaultAvatar,
                country: imageAssets.flag1,
                firstTradeDate: "2022/6/30",
                growth: '2825',
                balance: 30,
                profit: 16792.51,
                avgProfit: "90",
                subscribers: 23,
              ),
            ),
            SignalItemView(
              signal: SignalsModel(
                id: 2,
                signalName: "PriceAction2",
                userName: "Evgenii Gavrilov",
                userIamge: imageAssets.user3,
                country: imageAssets.flag1,
                firstTradeDate: "2022/6/30",
                growth: '2825',
                balance: 30,
                profit: 16792.51,
                avgProfit: "90",
                subscribers: 90,
              ),
            ),
            SignalItemView(
              signal: SignalsModel(
                id: 2,
                signalName: "PriceAction2",
                userName: "Evgenii Gavrilov",
                userIamge: imageAssets.user4,
                country: imageAssets.flag1,
                firstTradeDate: "2022/6/30",
                growth: '2825',
                balance: 30,
                profit: 16792.51,
                avgProfit: "90",
                subscribers: 48,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
