import 'package:fit_notes/app/data/models/muscles_group.dart';

class Exercise {
  //required
  MusclesGroup musclesGroup;
  String name;

  String? weightUnit;
  int? restTime;
  double? weightIncrementLb;
  double? weightIncrementKg;
  String? note;
  int? workoutCount;
  DateTime? lastWorkout;

  Exercise(
      {required this.musclesGroup,
      required this.name,
      this.weightIncrementKg,
      this.weightIncrementLb,
      this.weightUnit,
      this.note,
      this.restTime,
      this.workoutCount,
      this.lastWorkout});

  Map<String, dynamic> toJson() => {
        'musclesGroup': musclesGroup.toJson(),
        'name': name,
        'weightUnit': weightUnit,
        'restTime': restTime,
        'weightIncrementLb': weightIncrementLb,
        'weightIncrementKg': weightIncrementKg,
        'note': note,
        'workoutCount': workoutCount,
        'lastWorkout': lastWorkout?.toIso8601String()
      };

  factory Exercise.fromJson(Map<dynamic, dynamic> parsedJson) {
    return Exercise(
      musclesGroup: MusclesGroup.fromJson(parsedJson['musclesGroup']),
      name: parsedJson['name'],
      weightUnit: parsedJson['weightUnit'],
      restTime: parsedJson['restTime'],
      weightIncrementLb: parsedJson['weightIncrementLb'],
      weightIncrementKg: parsedJson['weightIncrementKg'],
      note: parsedJson['note'],
      workoutCount: parsedJson['workoutCount'],
      lastWorkout: parsedJson['lastWorkout'] != null
          ? DateTime.parse(parsedJson['lastWorkout'])
          : null,
    );
  }
}

class WeightUnit {
  String name;

  WeightUnit({required this.name});

  Map<String, dynamic> toJson() => {'name': name};

  factory WeightUnit.fromJson(Map<dynamic, dynamic> parsedJson) {
    return WeightUnit(name: parsedJson['name']);
  }
}
