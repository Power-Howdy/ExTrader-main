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
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          children: [
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
                        "cell 0.11",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.red),
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
                    "2023.03.24 04:08:39",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "2",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: Colors.blue,
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
