import 'package:coinspace/view/position/history/one_position_card.dart';
import 'package:coinspace/view/position/history/over_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DayView extends StatefulWidget {
  const DayView({super.key});

  @override
  State<DayView> createState() => _DayViewState();
}

class _DayViewState extends State<DayView> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.68,
      child: ListView(
        padding: const EdgeInsets.only(top: 20),
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OverView(),
              const Divider(color: Colors.grey),
              for (var cnt = 0; cnt < 20; cnt++) const OnePositionCard()
            ],
          ),
        ],
      ),
    );
  }
}
