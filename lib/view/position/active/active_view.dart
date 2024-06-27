import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/active_controller.dart';
import 'one_position_card.dart';
import 'over_view.dart';

class ActiveView extends StatefulWidget {
  const ActiveView({super.key});

  @override
  State<ActiveView> createState() => _ActiveViewState();
}

class _ActiveViewState extends State<ActiveView> {
  final activeController = Get.put(ActiveController());
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.only(top: 20),
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.red,
                width: double.infinity,
                height: 53,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "-5213 JPY",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const OverView(),
              const Divider(color: Colors.grey),
              Container(
                color: const Color(0xFFE3E3E8),
                padding: const EdgeInsets.all(16), // Adjust the value as needed
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Positions",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                    ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Close All",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 14,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w800,
                                    ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              for (var cnt = 0; cnt < 20; cnt++) const OnePositionCard()
            ],
          ),
        ],
      ),
    );
  }
}
