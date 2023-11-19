import 'dart:convert';

import 'package:fit_notes/app/data/models/exercise_data.dart';
import 'package:fit_notes/app/data/models/exercise_model.dart';
import 'package:fit_notes/app/global/const/string.dart';
import 'package:get_storage/get_storage.dart';

class ExerciseServices {
  ExerciseServices._();

  static final box = GetStorage();

  static Future<void> generateExercise() async {
    try {
      if (box.read(EXERCISE) == null) {
        List<String> convertedList = [];
        List<Exercise> exerciseList =
            await ExerciseDummy.generateExerciseData();
        convertedList = encodeJson(exerciseList);
        box.write(EXERCISE, convertedList);
      }
    } catch (e, s) {
      print('$e $s');
    }
  }

  static Future<List<Exercise>> getExercise() async {
    List<Exercise> exerciseList = [];
    List<String> result = await box.read(EXERCISE).cast<String>();
    exerciseList = decodeJson(result);
    return exerciseList;
  }

  static Future<void> addExercise(Exercise exercise) async {
    List<Exercise> exerciseList = [];
    List<String> result = await box.read(EXERCISE).cast<String>();
    exerciseList = decodeJson(result);
    exerciseList.add(exercise);
    box.write(EXERCISE, encodeJson(exerciseList));
  }

  static List<String> encodeJson(List<Exercise> exerciseList) {
    List<String> convertedList = [];
    for (var value in exerciseList) {
      convertedList.add(jsonEncode(value.toJson()));
    }
    return convertedList;
  }

  static List<Exercise> decodeJson(List<String> stringList) {
    List<Exercise> exerciseList = [];
    for (var element in stringList) {
      final exercise = Exercise.fromJson(jsonDecode(element));
      exerciseList.add(exercise);
    }
    return exerciseList;
  }
}
