import 'package:coinspace/config.dart';
import 'package:coinspace/controller/home_controller.dart';
import 'package:coinspace/view/position/position_view.dart';
import 'package:coinspace/view/quotes/quotes_view.dart';
import 'package:coinspace/view/market/market_view.dart';
import 'package:coinspace/view/profile/profile_view.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.scaffoldKey,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      bottomNavigationBar: SizedBox(
        height:MediaQuery.of(context).padding.bottom+kBottomNavigationBarHeight+8,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                tab(
                  imageAssets.accountTab,
                  "Account",
                  () {
                    homeController.tabFlag.value = 0;
                  },
                  homeController.tabFlag.value == 0 ? true : false,
                ),
                tab(
                  imageAssets.tradingTab,
                  "Trading",
                  () {
                    homeController.tabFlag.value = 2;
                  },
                  homeController.tabFlag.value == 2 ? true : false,
                ),
                tab(
                  imageAssets.positionTab,
                  "Position",
                  () {
                    homeController.tabFlag.value = 3;
                  },
                  homeController.tabFlag.value == 3 ? true : false,
                ),
                tab(
                  imageAssets.signalsTab,
                  "Signaling",
                  () {
                    homeController.tabFlag.value = 1;
                  },
                  homeController.tabFlag.value == 1 ? true : false,
                ),
                tab(
                  imageAssets.settingTab,
                  "Setting",
                  () {
                    homeController.tabFlag.value = 4;
                  },
                  homeController.tabFlag.value == 4 ? true : false,
                )
              ],
            ),
          ),
        ),
      ),
      body: Obx(
        () => homeController.tabFlag.value == 0
            ? const QuotesView() // will change this with appropriate screen
            : homeController.tabFlag.value == 1
                ? const SignalsView()
                : homeController.tabFlag.value == 2
                    ? const SignalsView()
                    : homeController.tabFlag.value == 3
                        ? const PositionView()
                        : const ProfileView(),
      ),
    );
  }

  Widget tab(
    String image,
    String text,
    VoidCallback onTap,
    bool isSelected,
  ) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          SizedBox(
            height: 24,
            width: 24,
            child: Image.asset(
              image,
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : const Color(0xff999999),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : const Color(0xff999999),
                ),
          ),
        ],
      ),
    );
  }
}
