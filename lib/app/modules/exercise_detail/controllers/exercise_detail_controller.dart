import 'package:fit_notes/app/data/models/exercise_model.dart';
import 'package:get/get.dart';

class ExerciseDetailController extends GetxController {
  ExerciseDetailArgs? args;
  Rx<Exercise?> exercise = Rx(null);

  @override
  void onInit() {
    if (Get.arguments != null) {
      args = Get.arguments;
      exercise.value = args!.exercise;
    }
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

class ExerciseDetailArgs {
  Exercise? exercise;

  ExerciseDetailArgs({this.exercise});
}
