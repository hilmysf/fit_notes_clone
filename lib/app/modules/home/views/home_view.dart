import 'package:fit_notes/app/global/const/colors.dart';
import 'package:fit_notes/app/modules/body/views/body_view.dart';
import 'package:fit_notes/app/modules/calendar/views/calendar_view.dart';
import 'package:fit_notes/app/modules/charts/views/charts_view.dart';
import 'package:fit_notes/app/modules/dashboard/views/dashboard_view.dart';
import 'package:fit_notes/app/modules/exercise/views/exercise_view.dart';
import 'package:fit_notes/app/modules/settings/views/settings_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Fit Notes',
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: controller.bottomNavigationBarItems,
          onTap: controller.onBottomNavigationTap,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.grey,
          unselectedItemColor: Colors.grey,
        ),
        body: Padding(
          padding: EdgeInsets.all(8.r),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () => controller.onDateChanged(-1),
                      child: Icon(
                        CupertinoIcons.chevron_back,
                        color: ColorsApp.primary,
                        size: 36.r,
                      )),
                  Obx(
                    () => Text(
                      controller.dateString.value,
                      style: Get.textTheme.titleMedium,
                    ),
                  ),
                  InkWell(
                      onTap: () => controller.onDateChanged(1),
                      child: Icon(
                        CupertinoIcons.chevron_forward,
                        color: ColorsApp.primary,
                        size: 36.r,
                      ))
                ],
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    children: [
                      Container(
                        width: 1.sw,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: ColorsApp.lightGrey,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(8.r))),
                              padding: EdgeInsets.all(8.r),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Dumbell Preacher Curl',
                                      style: Get.textTheme.titleMedium,
                                    ),
                                  ),
                                  const Icon(
                                    CupertinoIcons.circle,
                                    color: ColorsApp.primary,
                                  )
                                  // Icon(CupertinoIcons.circle_fill,
                                  //   color: ColorsApp.primary,)
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 8.r),
                              decoration: BoxDecoration(
                                  color: ColorsApp.darkGrey,
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(8.r))),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Icon(
                                          CupertinoIcons.star,
                                          color: ColorsApp.primary,
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text('15,0 kg'),
                                        Text('15,0 kg'),
                                        Text('15,0 kg'),
                                        Text('15,0 kg'),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text('8 reps'),
                                        Text('8 reps'),
                                        Text('8 reps'),
                                        Text('8 reps'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
