import 'package:fit_notes/app/data/models/exercise_model.dart';
import 'package:fit_notes/app/data/models/muscles_group.dart';
import 'package:fit_notes/app/data/services/exercise_services.dart';
import 'package:fit_notes/app/data/services/muscles_group_services.dart';
import 'package:fit_notes/app/global/const/string.dart';
import 'package:fit_notes/app/global/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ExerciseController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final myTabs = [
    const Tab(
      text: 'Exercises',
    ),
    const Tab(
      text: 'Templates',
    )
  ];
  RxList<MusclesGroup> musclesGroupList = RxList([]);
  List<Exercise> exerciseList = [];
  RxList<Exercise> filteredExerciseList = RxList([]);
  Rx<String> selectedSort = Rx('');
  Rx<String?> selectedChip = Rx(null);

  Future<void> loadData() async {
    musclesGroupList.value = Get.find<AppController>().muscleGroup;
    exerciseList = Get.find<AppController>().exerciseList;
    filteredExerciseList.value = exerciseList;
    selectedSort.value = GetStorage().read(SELECTED_SORT) ?? ALPHABETICAL;
  }

  void onTextChanged(String text) {
    filteredExerciseList.value = exerciseList.where((element) {
      return element.name.toLowerCase().contains(text.toLowerCase());
    }).toList();
  }

  void onChipTap(String? selectedChip) {
    if (selectedChip == null) {
      filteredExerciseList.value = exerciseList;
    } else {
      filteredExerciseList.value = exerciseList.where((element) {
        return element.musclesGroup.title == selectedChip;
      }).toList();
    }
  }

  Future<void> onSort(String filter) async {
    await GetStorage().write(SELECTED_SORT, filter);
    selectedSort.value = GetStorage().read(SELECTED_SORT);
    if (filter == ALPHABETICAL) {
      filteredExerciseList.sort(
        (a, b) => a.name.compareTo(b.name),
      );
    } else if (filter == MOST_FREQUENT) {
      filteredExerciseList.sort(
        (a, b) {
          return (a.workoutCount ?? 0).compareTo(b.workoutCount ?? 0);
        },
      );
    } else if (filter == MOST_RECENT) {
      filteredExerciseList.sort(
        (a, b) {
          return (a.lastWorkout ?? DateTime.now())
              .compareTo(b.lastWorkout ?? DateTime.now());
        },
      );
    }
  }

  @override
  void onInit() {
    tabController =
        TabController(length: myTabs.length, vsync: this, initialIndex: 0);
    loadData();
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
