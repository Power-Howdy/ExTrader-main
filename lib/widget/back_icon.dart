// ignore_for_file: deprecated_member_use

import 'package:flutter_svg/flutter_svg.dart';
import 'package:coinspace/config.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
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
    );
  }
}
