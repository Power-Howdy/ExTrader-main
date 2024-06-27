import 'package:coinspace/common/theme/app_themes.dart';
import 'package:coinspace/controller/history_controller.dart';
import 'package:coinspace/view/position/history/custome_day_view.dart';
import 'package:coinspace/view/position/history/day_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final historyController = Get.put(HistoryController());
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  color: const Color(0xFFF2F2F7),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 40, right: 40, bottom: 20),
                    child: Container(
                      height: 37,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppTheme.isLightTheme == true
                            ? const Color(0xFFE3E3E8)
                            : HexColor(AppTheme.darkGrayString!),
                      ),
                      child: Obx(
                        () => Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  historyController.isBit.value = 0;
                                },
                                child: Container(
                                  height: 37,
                                  margin:
                                      const EdgeInsets.only(top: 2, bottom: 2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            historyController.isBit.value == 0
                                                ? Colors.grey.withOpacity(0.3)
                                                : Colors.transparent,
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        offset: const Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                    ],
                                    color: historyController.isBit.value == 0
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Day",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  historyController.isBit.value = 1;
                                },
                                child: Container(
                                  height: 37,
                                  margin:
                                      const EdgeInsets.only(top: 2, bottom: 2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            historyController.isBit.value == 1
                                                ? Colors.grey.withOpacity(0.5)
                                                : Colors.transparent,
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        offset: const Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                    ],
                                    color: historyController.isBit.value == 1
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Week",
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
                                  historyController.isBit.value = 2;
                                },
                                child: Container(
                                  height: 37,
                                  margin:
                                      const EdgeInsets.only(top: 2, bottom: 2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            historyController.isBit.value == 2
                                                ? Colors.grey.withOpacity(0.5)
                                                : Colors.transparent,
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        offset: const Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                    ],
                                    color: historyController.isBit.value == 2
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Month",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  historyController.isBit.value = 3;
                                },
                                child: Container(
                                  height: 37,
                                  margin:
                                      const EdgeInsets.only(top: 2, bottom: 2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            historyController.isBit.value == 3
                                                ? Colors.grey.withOpacity(0.5)
                                                : Colors.transparent,
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        offset: const Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                    ],
                                    color: historyController.isBit.value == 3
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Custom",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
              Obx(() => historyController.isBit.value == 0
                  ? const DayView()
                  : historyController.isBit.value == 1
                      ? const DayView()
                      : historyController.isBit.value == 2
                          ? const DayView()
                          : const CustomDayView())
            ],
          )
        ],
      ),
    );
  }
}
