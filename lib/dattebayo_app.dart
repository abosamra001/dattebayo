import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/routing/app_router.dart';
import '../core/networking/cubit/network_cubit.dart';
import '../core/routing/routes.dart';
import '../core/widgets/network_wrapper.dart';
import '../core/themes/colors.dart';

class DattebayoApp extends StatelessWidget {
  final AppRouter appRouter;
  final bool isFirstTime;
  const DattebayoApp({
    super.key,
    required this.appRouter,
    required this.isFirstTime,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      ensureScreenSize: true,
      child: BlocProvider<NetworkCubit>(
        create: (context) => NetworkCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: isFirstTime ? Routes.onboarding : Routes.home,
          onGenerateRoute: appRouter.onGenerateRoute,
          builder: (context, child) => NetworkWrapper(child: child!),
          theme: ThemeData(
            brightness: .dark,
            appBarTheme: const AppBarTheme(
              backgroundColor: ColorManager.backgroundColor,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
              ),
            ),
            scaffoldBackgroundColor: ColorManager.backgroundColor,
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              },
            ),
          ),
        ),
      ),
    );
  }
}
