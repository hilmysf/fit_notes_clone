import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/body_controller.dart';

class BodyView extends GetView<BodyController> {
  const BodyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BodyView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BodyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
