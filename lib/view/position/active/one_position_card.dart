import 'package:flutter/material.dart';

class OnePositionCard extends StatelessWidget {
  final int index = 0;

  const OnePositionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: Colors.black12,
        ),
      )),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 16),
        child: Row(
          children: [
            Radio(
              value: 0, // Set the value for this radio option
              groupValue: 1, // Set the currently selected value in the group
              onChanged: (value) {
                // Handle radio value change here
              },
              fillColor: MaterialStateColor.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.grey; // Selected color
                }
                return Colors.grey; // Unselected color
              }),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "AUDNZmicro,",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      Text(
                        " buy 0.11",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.blue),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "1.07432 -> 1.072434",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
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
                    "-35",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.red,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
