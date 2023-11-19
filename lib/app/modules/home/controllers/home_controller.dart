import 'package:fit_notes/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  Rx<DateTime> date = Rx(DateTime.now());
  Rx<String> dateString = Rx('');
  final bottomNavigationBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.person), label: 'Body'),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.calendar), label: 'Calendar'),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.add), label: 'Exercise'),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.chart_bar), label: 'Charts'),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.settings), label: 'Settings'),
  ];

  void onBottomNavigationTap(int index) {
    if (index == 0) {
      Get.toNamed(Routes.BODY);
    } else if (index == 1) {
      Get.toNamed(Routes.CALENDAR);
    } else if (index == 2) {
      Get.toNamed(Routes.EXERCISE);
    } else if (index == 3) {
      Get.toNamed(Routes.CHARTS);
    } else {
      Get.toNamed(Routes.SETTINGS);
    }
  }

  void onDateChanged(int index) {
    date.value = date.value.add(Duration(days: index));
    setDateString(date.value);
  }

  int calculateDifference(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }

  void setDateString(DateTime date) {
    if (calculateDifference(date) == -1) {
      dateString.value = 'Yesterday';
    } else if (calculateDifference(date) == 0) {
      dateString.value = 'Today';
    } else if (calculateDifference(date) == 1) {
      dateString.value = 'Tomorrow';
    } else {
      dateString.value = DateFormat('EEEE, dd MMMM yyyy').format(date);
    }
  }

  @override
  void onInit() {
    setDateString(date.value);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
