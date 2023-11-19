import 'package:fit_notes/app/data/models/exercise_model.dart';
import 'package:fit_notes/app/data/models/muscles_group.dart';
import 'package:fit_notes/app/data/services/muscles_group_services.dart';
import 'package:fit_notes/app/global/const/string.dart';

class ExerciseDummy {
  ExerciseDummy._();

  static Future<List<Exercise>> generateExerciseData() async {
    final musclesGroup = await MuscleGroupServices.getMusclesGroup();
    final absGroup =
        musclesGroup.where((element) => element.title == ABS).toList()[0];
    final backGroup =
        musclesGroup.where((element) => element.title == BACK).toList()[0];
    final bicepsGroup =
        musclesGroup.where((element) => element.title == BICEPS).toList()[0];
    final cardioGroup =
        musclesGroup.where((element) => element.title == CARDIO).toList()[0];
    final chestGroup =
        musclesGroup.where((element) => element.title == CHEST).toList()[0];
    final legsGroup =
        musclesGroup.where((element) => element.title == LEGS).toList()[0];
    final shoulderGroup =
        musclesGroup.where((element) => element.title == SHOULDERS).toList()[0];
    final tricepsGroup =
        musclesGroup.where((element) => element.title == TRICEPS).toList()[0];
    final exerciseDataList = [
      //Abs
      Exercise(musclesGroup: absGroup, name: 'Crunch'),
      //Back
      Exercise(musclesGroup: backGroup, name: 'Lat Pulldown'),
      //BICEPS
      Exercise(musclesGroup: bicepsGroup, name: 'Machine Curl'),
      //CARDIO
      Exercise(musclesGroup: cardioGroup, name: 'Box Jumps'),
      //CHEST
      Exercise(musclesGroup: chestGroup, name: 'Cable Crossover'),
      //LEGS
      Exercise(musclesGroup: legsGroup, name: 'Barbell Lunge'),
      //SHOULDERS
      Exercise(musclesGroup: shoulderGroup, name: 'Overhead Press'),
      //TRICEPS
      Exercise(musclesGroup: tricepsGroup, name: 'Cable Overhead'),
    ];
    return exerciseDataList;
  }
}
