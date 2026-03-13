import 'package:dattebayo/core/routing/app_router.dart';
import 'package:dattebayo/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DattebayoApp extends StatelessWidget {
  final AppRouter appRouter;
  const DattebayoApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.onboarding,
          onGenerateRoute: appRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
