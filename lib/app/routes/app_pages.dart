import 'package:get/get.dart';

import '../modules/body/bindings/body_binding.dart';
import '../modules/body/views/body_view.dart';
import '../modules/calendar/bindings/calendar_binding.dart';
import '../modules/calendar/views/calendar_view.dart';
import '../modules/charts/bindings/charts_binding.dart';
import '../modules/charts/views/charts_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/exercise/bindings/exercise_binding.dart';
import '../modules/exercise/views/exercise_view.dart';
import '../modules/exercise_detail/bindings/exercise_detail_binding.dart';
import '../modules/exercise_detail/views/exercise_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/workout/bindings/workout_binding.dart';
import '../modules/workout/views/workout_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BODY,
      page: () => const BodyView(),
      binding: BodyBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.CALENDAR,
      page: () => const CalendarView(),
      binding: CalendarBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.EXERCISE,
      page: () => const ExerciseView(),
      binding: ExerciseBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.CHARTS,
      page: () => const ChartsView(),
      binding: ChartsBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.EXERCISE_DETAIL,
      page: () => const ExerciseDetailView(),
      binding: ExerciseDetailBinding(),
    ),
    GetPage(
      name: _Paths.WORKOUT,
      page: () => const WorkoutView(),
      binding: WorkoutBinding(),
    ),
  ];
}
