import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  RxInt tabFlag = 0.obs;
  RxBool notify = false.obs;
  RxInt isBit = 0.obs;
  RxBool isSCan = false.obs;
  final searchController = TextEditingController().obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();
}