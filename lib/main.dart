import 'package:dattebayo/core/di/dependency_injection.dart';
import 'package:dattebayo/core/helpers/constants.dart';
import 'package:dattebayo/core/helpers/prefs_service.dart';
import 'package:dattebayo/core/routing/app_router.dart';
import 'package:dattebayo/dattebayo_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await PrefsService.init();
  runApp(
    DattebayoApp(
      appRouter: AppRouter(),
      isFirstTime: PrefsService.getBool(Constants.isFirstTime) ?? true,
    ),
  );
}
