import 'package:get/get.dart';

import '../controllers/body_controller.dart';

class BodyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BodyController>(
      () => BodyController(),
    );
  }
}
