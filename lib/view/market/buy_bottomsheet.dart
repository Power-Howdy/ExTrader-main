// ignore_for_file: deprecated_member_use

import 'package:coinspace/config.dart';
import 'package:coinspace/common/theme/app_themes.dart';

class BuyBottomSheet extends StatelessWidget {
  const BuyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        color: AppTheme.isLightTheme == true
            ? Colors.white
            : const Color(0xff1C222E),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: Image.asset(
                      imageAssets.m2,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        height: 32,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: HexColor(AppTheme.secondaryColorString!)
                                .withOpacity(0.2),
                          ),
                          color: AppTheme.isLightTheme == true
                              ? HexColor(AppTheme.lightGrayString!)
                              : HexColor(AppTheme.darkGrayString!),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text(
                                    "Market",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: HexColor(AppTheme.primaryColorString!),
                                ),
                                child: Center(
                                  child: Text(
                                    "Limit",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text(
                                    "Stop-Limit",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Text(
                            "Limit Price",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      HexColor(AppTheme.secondaryColorString!),
                                ),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            "12.394.00",
                            style:
                                Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          Text(
                            "  USDT",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      HexColor(AppTheme.secondaryColorString!),
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Amount",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      HexColor(AppTheme.secondaryColorString!),
                                ),
                          ),
                          const Expanded(child: SizedBox()),
                          SizedBox(
                            width: 50,
                            height: 25,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.end,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                              controller: TextEditingController(text: '0.5'),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              "   BTC",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor(
                                        AppTheme.secondaryColorString!),
                                  ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Divider(
                        height: 1,
                        color: HexColor(AppTheme.secondaryColorString!)
                            .withOpacity(0.2),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      HexColor(AppTheme.secondaryColorString!),
                                ),
                          ),
                          Text(
                            "0 USDT",
                            style:
                                Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Text(
                          "Avbl: 823743 USDT",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: HexColor(AppTheme.secondaryColorString!),
                              ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 48,
              child: CustomButton(
                text: "Place buy order",
                onTap: () {},
                bg: HexColor(AppTheme.greenColorString!),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
