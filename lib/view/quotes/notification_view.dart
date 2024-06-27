// ignore_for_file: deprecated_member_use

import 'package:coinspace/config.dart';
import 'package:coinspace/common/theme/app_themes.dart';
import 'package:coinspace/controller/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top + 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  homeController.notify.value = false;
                });
              },
              child: SizedBox(
                height: 24,
                width: 24,
                child: SvgPicture.asset(
                  imageAssets.h12,
                  fit: BoxFit.fill,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
            ),
            Text(
              "Notifications",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(
              height: 24,
              width: 24,
            )
          ],
        ),
        Expanded(
            child: ListView.builder(
          itemCount: 7,
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.only(top: 20, bottom: 30),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                height: 80,
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppTheme.isLightTheme == true
                      ? HexColor(AppTheme.lightGrayString!)
                      : HexColor(AppTheme.darkGrayString!),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              index == 0
                                  ? "Price Alert • Mar 11"
                                  : index == 0
                                      ? "Price Alert • Mar 11"
                                      : index == 0
                                          ? "Price Alert • Mar 8"
                                          : index == 0
                                              ? "Price Alert • Mar 6"
                                              : index == 0
                                                  ? "Price Alert • Mar 2"
                                                  : index == 0
                                                      ? "Price Alert • Mar 2"
                                                      : "Price Alert • Feb 25",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor(
                                        AppTheme.secondaryColorString!),
                                  ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              index == 0
                                  ? "Bitcoin (BTC) is up +5.61% to\n\$40,092.19 in the last 27 hours."
                                  : index == 1
                                      ? "Ethereum (ETH) is up +1.15% to\n\$2683.78 in the last 16 hours."
                                      : index == 2
                                          ? "Bitcoin (BTC) is down -7.12% to\n\$46.793.75 in the last 10 hours."
                                          : index == 3
                                              ? "Ethereum (ETH) is down -5.56% to\n\$2423.54 in the last 5 hours."
                                              : index == 4
                                                  ? "Bitcoin (BTC) is up +5.06% to\n\$38,962.52 in the last 18 hours."
                                                  : index == 5
                                                      ? "Ethereum (ETH) is up +5.01% to\n\$2751.79 in the last 7 hours."
                                                      : "Bitcoin (BTC) is up +5.72% to\n\$34,675.23 in the last 6 hours.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 1.6,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                              maxLines: 2,
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
                              index == 0
                                  ? "40,092.19"
                                  : index == 1
                                      ? "2683.78"
                                      : index == 2
                                          ? "37,824.05"
                                          : index == 3
                                              ? "2423.54"
                                              : index == 4
                                                  ? "38,962.52"
                                                  : index == 5
                                                      ? "2751.79"
                                                      : "34,675.23",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              index == 0
                                  ? "+5.61%"
                                  : index == 1
                                      ? "+5.12%"
                                      : index == 2
                                          ? "-7.12%"
                                          : index == 3
                                              ? "-5.56%"
                                              : index == 4
                                                  ? "+5.06%"
                                                  : index == 5
                                                      ? "+5.61%"
                                                      : "+5.01%",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: index == 2 || index == 3
                                        ? HexColor(AppTheme.redColorString!)
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
            );
          },
        ))
      ],
    );
  }
}
