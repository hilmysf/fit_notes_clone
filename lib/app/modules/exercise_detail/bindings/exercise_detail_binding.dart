import 'package:get/get.dart';

import '../controllers/exercise_detail_controller.dart';

class ExerciseDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExerciseDetailController>(
      () => ExerciseDetailController(),
    );
  }
}
