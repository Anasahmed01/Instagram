import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/src/app/app.locator.dart';
import 'package:instagram/src/app/app.router.dart';
import 'package:instagram/src/utils/colors/app_colors.dart';
import 'package:stacked_services/stacked_services.dart';
import 'src/service/storage/storage_service.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageServices.init();
  await setupLocator();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        scaffoldBackgroundColor: AppColors.blackColor,
        appBarTheme: AppBarTheme(
            color: AppColors.blackColor,
            titleSpacing: 10,
            iconTheme: IconThemeData(color: AppColors.white)),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
