import 'package:coinspace/config.dart';

import '../../common/theme/app_css.dart';

class SignalsView extends StatefulWidget {
  const SignalsView({super.key});

  @override
  State<SignalsView> createState() => _SignalsViewState();
}

class _SignalsViewState extends State<SignalsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Signals",
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  items: <String>[
                    'filter1',
                    'filter2',
                    'filter3',
                    'filter4',
                    'filter5',
                    'filter6',
                    'filter7',
                    'filter8'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: AppCss.poppinsRegular17
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    );
                  }).toList(),
                  itemHeight: 50.0,
                  elevation: 0,
                  hint: Row(
                    children: [
                      Icon(
                        Icons.filter_alt_outlined,
                        size: 17,
                        color: Theme.of(context).primaryColor,
                      ),
                      const HSpace(8.0),
                      Text(
                        "Filter",
                        style: AppCss.poppinsRegular17
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                  icon: Container(),
                  onChanged: (_) {},
                ),
                DropdownButton<String>(
                  items: <String>[
                    'sort by1',
                    'sort by2',
                    'sort by3',
                    'sort by4',
                    'sort by5',
                    'sort by6',
                    'sort by7',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: AppCss.poppinsRegular17
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    );
                  }).toList(),
                  itemHeight: 50.0,
                  elevation: 0,
                  hint: Row(
                    children: [
                      Icon(
                        Icons.sort_by_alpha_outlined,
                        size: 17,
                        color: Theme.of(context).primaryColor,
                      ),
                      const HSpace(8.0),
                      Text(
                        "Sort by",
                        style: AppCss.poppinsRegular17
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                  icon: Container(),
                  onChanged: (_) {},
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.search_outlined,
                        size: 17,
                        color: Theme.of(context).primaryColor,
                      ),
                      const HSpace(8.0),
                      Text(
                        "Search",
                        style: AppCss.poppinsRegular17
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SignalItemView(
                  signal: SignalsModel(
                    id: 1,
                    signalName: "Capability",
                    userName: "Evgenii Gavrilov",
                    userIamge: imageAssets.user1,
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
                    userIamge: imageAssets.user2,
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
        ],
      ),
    );
  }
}
