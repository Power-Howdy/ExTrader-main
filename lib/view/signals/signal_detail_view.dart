import 'package:coinspace/config.dart';

import '../../common/theme/app_css.dart';

class SignalDetailView extends StatefulWidget {
  const SignalDetailView({super.key, required this.signal});
  final SignalsModel signal;

  @override
  State<SignalDetailView> createState() => _SignalDetailViewState();
}

class _SignalDetailViewState extends State<SignalDetailView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: Row(
            children: [
              Icon(
                Icons.keyboard_arrow_left,
                size: 22,
                color: Theme.of(context).primaryColor,
              ),
              Text(
                "back",
                style: AppCss.poppinsRegular14
                    .copyWith(color: Theme.of(context).primaryColor),
              )
            ],
          ),
        ),
        title: Text(
          widget.signal.signalName,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: 16, fontWeight: FontWeight.w800),
        ),
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add, color: Colors.black),
          )
        ],
      ),
      body: Column(
        children: [
          const ExpandableMTVersionWidget(),
          SignalItemView(signal: widget.signal),
          const Divider(height: 1, thickness: 1),
          SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TriveFinancial MT5Live 2",
                    style: AppCss.poppinsRegular17,
                  ),
                  Text(
                    "1.10",
                    style: AppCss.poppinsRegular17
                        .copyWith(color: const Color(0x3c3c4399)),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1, thickness: 1),
          const VSpace(10.0),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  onTap: () => setState(() => selectedIndex = 0),
                  child: tabbarWidget("account detail", 0),
                ),
                InkWell(
                  onTap: () => setState(() => selectedIndex = 1),
                  child: tabbarWidget("profit/loss graph", 1),
                ),
                InkWell(
                  onTap: () => setState(() => selectedIndex = 2),
                  child: tabbarWidget("trading strategy", 2),
                ),
                InkWell(
                  onTap: () => setState(() => selectedIndex = 3),
                  child: tabbarWidget("loss strategy", 3),
                ),
                InkWell(
                  onTap: () => setState(() => selectedIndex = 4),
                  child:
                      tabbarWidget("other strategies provided by traders", 4),
                ),
              ],
            ),
          ),
          if (selectedIndex == 0)
            Expanded(
              child: AccountDetailWidget(signal: widget.signal),
            ),
          if (selectedIndex == 1)
            Expanded(
              child: ProfitLossGraphWidget(signal: widget.signal),
            ),
          if (selectedIndex == 2)
            Expanded(
              child: TradingStrategyWidget(signal: widget.signal),
            ),
          if (selectedIndex == 3)
            Expanded(
              child: LossStrategyWidget(signal: widget.signal),
            ),
          if (selectedIndex == 4)
            Expanded(
              child: OtherStrategiesWidget(signal: widget.signal),
            ),
        ],
      ),
    );
  }

  Widget tabbarWidget(String title, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: selectedIndex == index
              ? BorderSide(width: 1, color: Theme.of(context).primaryColor)
              : BorderSide.none,
        ),
      ),
      child: Text(title, style: AppCss.poppinsSemiBold15),
    );
  }
}
