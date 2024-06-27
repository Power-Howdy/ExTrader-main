import 'package:coinspace/view/position/history/one_position_card.dart';
import 'package:coinspace/view/position/history/over_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomDayView extends StatefulWidget {
  const CustomDayView({super.key});

  @override
  State<CustomDayView> createState() => _CustomDayViewState();
}

class _CustomDayViewState extends State<CustomDayView> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  DateTimeRange? pickedDate;

  final DateTime currentDate = DateTime.now();
  final DateFormat dateFormat = DateFormat('yyyy/MM/dd');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xFFF2F2F7),
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    pickedDate != null
                        ? '${dateFormat.format(pickedDate!.start)} - ${dateFormat.format(pickedDate!.end)}'
                        : dateFormat.format(currentDate),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, size: 18),
                    onPressed: () async {
                      final picked = await showDateRangePicker(
                        context: context,
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2025),
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              textButtonTheme: TextButtonThemeData(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.disabled)) {
                                        return Colors.grey;
                                      }
                                      return Colors.green;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );

                      if (picked != null) {
                        setState(() {
                          pickedDate = picked;
                        });
                      }
                    },
                  ),
                ],
              ),
              OutlinedButton.icon(
                onPressed: () {
                  // Code to be executed when the button is pressed
                },
                label: const Text(
                  'CSV',
                  style: TextStyle(fontSize: 12),
                ),
                icon: const Icon(
                  Icons.download,
                  size: 18,
                ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.blue),
                  side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.blue)),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: Get.height * 0.65,
          child: ListView(
            padding: const EdgeInsets.only(top: 0),
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const OverView(),
                  const Divider(color: Colors.grey),
                  for (var cnt = 0; cnt < 20; cnt++) const OnePositionCard()
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
