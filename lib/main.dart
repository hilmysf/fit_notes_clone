import 'package:fit_notes/app/data/models/muscles_group.dart';
import 'package:fit_notes/app/global/bindings/app_binding.dart';
import 'package:fit_notes/app/global/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      designSize: const Size(360, 800),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.rightToLeft,
          darkTheme: ThemeData(
            appBarTheme: AppBarTheme(
                titleTextStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                backgroundColor: const Color(0xFF303841)),
            useMaterial3: true,
            fontFamily: 'Montserrat',
            colorScheme: const ColorScheme(
                brightness: Brightness.dark,
                background: Color(0xFF303841),
                primary: Colors.black,
                onPrimary: Colors.white,
                secondary: ColorsApp.primary,
                onSecondary: Colors.black,
                onBackground: Colors.black,
                error: Colors.red,
                onError: Colors.white,
                surface: Colors.white,
                onSurface: Colors.white),
          ),
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Montserrat',
            colorScheme: const ColorScheme(
                brightness: Brightness.dark,
                background: Color(0xFF303841),
                primary: Colors.black,
                onPrimary: Colors.white,
                secondary: ColorsApp.primary,
                onSecondary: Colors.black,
                onBackground: Colors.black,
                error: Colors.red,
                onError: Colors.white,
                surface: Colors.white,
                onSurface: Colors.white),
          ),
          builder: (context, widget) {
            ///Setting font does not change with system font size
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0,
              ),
              child: widget ??
                  const Center(
                    child: Text("No screen provided"),
                  ),
            );
          },
          initialBinding: AppBinding(),
        );
      },
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}
