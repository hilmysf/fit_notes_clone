import 'dart:convert';

import 'package:fit_notes/app/data/models/muscles_group.dart';
import 'package:fit_notes/app/global/const/string.dart';
import 'package:get_storage/get_storage.dart';

class MuscleGroupServices {
  MuscleGroupServices._();

  static final box = GetStorage();

  static Future<void> generateMusclesGroup() async {
    try {
      if (box.read(MUSCLES_GROUP) == null) {
        List<String> convertedList = [];
        final musclesGroup = [
          MusclesGroup(title: ABS, color: '0xFFFF0000'),
          MusclesGroup(title: BACK, color: '0xFF0000FF'),
          MusclesGroup(title: BICEPS, color: '0xFF008000'),
          MusclesGroup(title: CARDIO, color: '0xFFFFFF00'),
          MusclesGroup(title: CHEST, color: '0xFF9F2B68'),
          MusclesGroup(title: LEGS, color: '0xFFFFC0CB'),
          MusclesGroup(title: SHOULDERS, color: '0xFFFFA500'),
          MusclesGroup(title: TRICEPS, color: '0xFF87CEEB'),
        ];
        for (var element in musclesGroup) {
          convertedList.add(jsonEncode(element.toJson()));
        }
        box.write(MUSCLES_GROUP, convertedList);
      }
    } catch (e, s) {
      print('$e $s');
    }
  }

  static Future<List<MusclesGroup>> getMusclesGroup() async {
    List<MusclesGroup> musclesGroupList = [];
    List<String> result = await box.read(MUSCLES_GROUP).cast<String>();
    for (var element in result) {
      musclesGroupList.add(MusclesGroup.fromJson(json.decode(element)));
    }
    return musclesGroupList;
  }

  static Future<MusclesGroup> getMusclesGroupByName(String name) async {
    List<MusclesGroup> musclesGroupList = [];
    List<String> result = await box.read(MUSCLES_GROUP).cast<String>();
    for (var element in result) {
      musclesGroupList.add(MusclesGroup.fromJson(json.decode(element)));
    }
    return musclesGroupList
        .where((element) => element.title == name)
        .toList()[0];
  }
}
