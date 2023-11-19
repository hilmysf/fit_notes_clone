import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/exercise_detail_controller.dart';

class ExerciseDetailView extends GetView<ExerciseDetailController> {
  const ExerciseDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExerciseDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ExerciseDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
