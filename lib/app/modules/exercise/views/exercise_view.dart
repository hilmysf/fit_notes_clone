import 'dart:convert';

import 'package:fit_notes/app/data/models/exercise_model.dart';
import 'package:fit_notes/app/data/models/muscles_group.dart';
import 'package:fit_notes/app/data/services/exercise_services.dart';
import 'package:fit_notes/app/global/const/colors.dart';
import 'package:fit_notes/app/global/const/string.dart';
import 'package:fit_notes/app/global/widget/cancel_button.dart';
import 'package:fit_notes/app/modules/exercise_detail/controllers/exercise_detail_controller.dart';
import 'package:fit_notes/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/exercise_controller.dart';

class ExerciseView extends GetView<ExerciseController> {
  const ExerciseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CancelButton(onTap: () => Get.back()),
            const Text('Choose Exercise'),
            InkWell(
              onTap: () async {
                final exercise = Exercise(
                    musclesGroup:
                        MusclesGroup(color: '0xFF0000FF', title: BACK),
                    name: 'Single Row');
                await ExerciseServices.addExercise(exercise);
                // Get.toNamed(
                //   Routes.EXERCISE_DETAIL,
                // );
              },
              child: const Icon(
                CupertinoIcons.add,
                color: ColorsApp.primary,
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.r),
        child: Column(
          children: [
            buildTabBar(),
            SizedBox(
              height: 8.h,
            ),
            Expanded(
                child: TabBarView(
                    controller: controller.tabController,
                    children: [buildExercisesTab(), buildTemplatesTab()]))
          ],
        ),
      ),
    );
  }

  Container buildTabBar() {
    return Container(
      height: 32.r,
      decoration: BoxDecoration(
        color: ColorsApp.darkGrey,
        borderRadius: BorderRadius.circular(
          8.r,
        ),
      ),
      child: Theme(
        data: ThemeData(useMaterial3: false),
        child: TabBar(
          controller: controller.tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8.r,
            ),
            color: ColorsApp.lightGrey,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          enableFeedback: true,
          tabs: controller.myTabs,
          onTap: (index) {},
        ),
      ),
    );
  }

  Widget buildExercisesTab() {
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          children: [
            buildSearchSection(),
            SizedBox(
              height: 8.h,
            ),
            buildChipsSection(),
            ...List.generate(controller.filteredExerciseList.length, (index) {
              Exercise exercise = controller.filteredExerciseList[index];
              return Column(
                children: [
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -3),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 8.r,
                    ),
                    minVerticalPadding: 0.r,
                    minLeadingWidth: 4.r,
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 16.r,
                          width: 16.r,
                          decoration: BoxDecoration(
                              color:
                                  Color(int.parse(exercise.musclesGroup.color)),
                              shape: BoxShape.circle),
                        ),
                      ],
                    ),
                    title: Text(exercise.name, style: Get.textTheme.titleSmall),
                    subtitle: Text(
                        exercise.workoutCount == null
                            ? '0 workouts'
                            : '${exercise.workoutCount} workouts',
                        style:
                            Get.textTheme.bodySmall?.copyWith(fontSize: 10.sp)),
                    trailing: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.EXERCISE_DETAIL,
                            arguments: ExerciseDetailArgs(exercise: exercise));
                      },
                      child: const Icon(
                        CupertinoIcons.info_circle,
                        color: ColorsApp.primary,
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: ColorsApp.lightGrey,
                  )
                ],
              );
            })
          ],
        ),
      ),
    );
  }

  Row buildSearchSection() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              fillColor: ColorsApp.darkGrey,
              filled: true,
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: ColorsApp.lightGrey,
              ),
              hintText: 'Exercise Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 4.r, horizontal: 4.r),
            ),
            onChanged: controller.onTextChanged,
          ),
        ),
        SizedBox(
          width: 8.r,
        ),
        PopupMenuButton<String>(
          icon: const Icon(CupertinoIcons.line_horizontal_3_decrease),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          onSelected: (String result) {
            controller.onSort(result);
            print('Selected: $result');
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'title',
              enabled: false,
              child: Text('Sort Options',
                  style: Get.textTheme.bodySmall?.copyWith(
                    fontSize: 10.sp,
                    color: ColorsApp.darkGrey,
                  )),
            ),
            const PopupMenuDivider(),
            PopupMenuItem<String>(
                value: 'Alphabetical',
                child: Text(
                  'Alphabetical',
                  style: Get.textTheme.titleSmall?.copyWith(
                    fontSize: 12.sp,
                    color: ColorsApp.darkGrey,
                  ),
                )),
            const PopupMenuDivider(),
            PopupMenuItem<String>(
              value: 'Most Frequent',
              child: Text(
                'Most Frequent',
                style: Get.textTheme.titleSmall?.copyWith(
                  fontSize: 12.sp,
                  color: ColorsApp.darkGrey,
                ),
              ),
            ),
            const PopupMenuDivider(),
            PopupMenuItem<String>(
              value: 'Most Recent',
              child: Text(
                'Most Recent',
                style: Get.textTheme.titleSmall?.copyWith(
                  fontSize: 12.sp,
                  color: ColorsApp.darkGrey,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 8.r,
        ),
      ],
    );
  }

  Widget buildChipsSection() {
    return Obx(
      () => Wrap(
        alignment: WrapAlignment.center,
        spacing: 4,
        children: [
          ...controller.musclesGroupList
              .map(
                (e) => Obx(
                  () => Theme(
                    data: ThemeData(useMaterial3: false),
                    child: ChoiceChip(
                      backgroundColor: ColorsApp.lightGrey,
                      surfaceTintColor: ColorsApp.lightGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          side: BorderSide.none),
                      onSelected: (value) {
                        if (controller.selectedChip.value == e.title) {
                          controller.selectedChip.value = null;
                        } else {
                          controller.selectedChip.value = e.title;
                        }
                        controller.onChipTap(controller.selectedChip.value);
                      },
                      selectedColor: ColorsApp.lightGrey.withOpacity(0.6),
                      label: Text(
                        e.title,
                        style: Get.textTheme.bodySmall,
                      ),
                      selected: controller.selectedChip.value == e.title,
                      avatar: Container(
                        height: 16.r,
                        decoration: BoxDecoration(
                            color: Color(int.parse(e.color)),
                            shape: BoxShape.circle),
                      ),
                    ),
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }

  SingleChildScrollView buildTemplatesTab() => const SingleChildScrollView();
}
