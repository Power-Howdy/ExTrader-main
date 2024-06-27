// ignore_for_file: unnecessary_null_in_if_null_operators, deprecated_member_use

import 'package:coinspace/common/theme/app_themes.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? textEditingController;
  final bool isObsecure;
  final Widget? sufix;
  final Widget? prefix;
  final TextInputType? inputType;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.textEditingController,
    this.isObsecure = false,
    this.sufix,
    this.inputType,
    this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextFormField(
        keyboardType: inputType,
        obscureText: isObsecure,
        controller: textEditingController,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 13, left: 14, right: 14),
          border: InputBorder.none,
          suffixIcon: sufix ?? const SizedBox(),
          prefixIcon: prefix ?? null,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: HexColor(AppTheme.secondaryColorString!),
              ),
        ),
      ),
    );
  }
}
