import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/workout_controller.dart';

class WorkoutView extends GetView<WorkoutController> {
  const WorkoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WorkoutView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WorkoutView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
