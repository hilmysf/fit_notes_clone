import 'dart:async';
import 'dart:convert';

import 'package:fit_notes/app/data/models/exercise_model.dart';
import 'package:fit_notes/app/data/models/muscles_group.dart';
import 'package:fit_notes/app/data/services/exercise_services.dart';
import 'package:fit_notes/app/data/services/muscles_group_services.dart';
import 'package:fit_notes/app/global/const/string.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {
  final RxList<MusclesGroup> _muscleGroup = RxList<MusclesGroup>([]);

  List<MusclesGroup> get muscleGroup => _muscleGroup;

  set muscleGroup(List<MusclesGroup> value) {
    _muscleGroup.value = value;
  }

  final RxList<Exercise> _exerciseList = RxList<Exercise>([]);

  List<Exercise> get exerciseList => _exerciseList;

  set exerciseList(List<Exercise> value) {
    _exerciseList.value = value;
  }

  Function? exerciseSubscription;
  final box = GetStorage();

  void listenExercise() {
    exerciseSubscription = box.listen(() async {
      exerciseList = await ExerciseServices.getExercise();
    });
  }

  Future<void> loadGetStorage() async {
    await MuscleGroupServices.generateMusclesGroup();
    await ExerciseServices.generateExercise();
    muscleGroup = await MuscleGroupServices.getMusclesGroup();
    exerciseList = await ExerciseServices.getExercise();
  }

  @override
  void onInit() {
    loadGetStorage();
    listenExercise();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
