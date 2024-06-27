import 'package:coinspace/common/theme/app_themes.dart';
import 'package:coinspace/controller/position_controller.dart';
import 'package:coinspace/view/position/active/active_view.dart';
import 'package:coinspace/view/position/history/history_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PositionView extends StatefulWidget {
  const PositionView({super.key});

  @override
  State<PositionView> createState() => _PositionViewState();
}

class _PositionViewState extends State<PositionView> {
  final positionController = Get.isRegistered<PositionController>()
      ? Get.find<PositionController>()
      : Get.put(PositionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            decoration: const BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Color(0xF2F2F2FF),
                width: 1,
              ),
            )),
            child: Center(
              child: Text(
                "Positions",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 52,
              width: Get.width,
              decoration: BoxDecoration(
                  border: Border.all(
                color: HexColor(AppTheme.secondaryColorString!).withOpacity(0),
              )),
              child: Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          positionController.isBit.value = 0;
                        },
                        child: Container(
                          height: 52,
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color: positionController.isBit.value == 0
                                  ? Colors.blue
                                  : Colors.transparent,
                            ),
                          )),
                          child: Center(
                            child: Text(
                              "active",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          positionController.isBit.value = 1;
                        },
                        child: Container(
                          height: 52,
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                              color: positionController.isBit.value == 1
                                  ? Colors.blue
                                  : Colors.transparent,
                              width: 2,
                            ),
                          )),
                          child: Center(
                            child: Text(
                              "history",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => positionController.isBit.value == 0
                ? const ActiveView()
                : const HistoryView(),
          ),
        ],
      ),
    );
  }
}
