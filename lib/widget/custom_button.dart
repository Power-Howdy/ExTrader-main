// ignore_for_file: deprecated_member_use

import 'package:coinspace/common/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final Color? bg;
  final String text;
  final Color? textColor;
  final VoidCallback onTap;
  final Color? borderColor;
  const CustomButton(
      {super.key,
      this.bg,
      required this.text,
      this.textColor,
      required this.onTap,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: bg ?? HexColor(AppTheme.primaryColorString!),
          border: Border.all(color: borderColor ?? Colors.transparent),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: textColor ?? Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  final Color? bg;
  final String text;
  final Color? textColor;
  final VoidCallback onTap;
  final Color? borderColor;
  const SmallButton(
      {super.key,
      this.bg,
      required this.text,
      this.textColor,
      required this.onTap,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 32,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: bg ?? HexColor(AppTheme.primaryColorString!),
          border: Border.all(color: borderColor ?? Colors.transparent),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: textColor ?? Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
