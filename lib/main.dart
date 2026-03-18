import 'package:dattebayo/core/di/dependency_injection.dart';
import 'package:dattebayo/core/routing/app_router.dart';
import 'package:dattebayo/dattebayo_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  runApp(DattebayoApp(appRouter: AppRouter()));
}
