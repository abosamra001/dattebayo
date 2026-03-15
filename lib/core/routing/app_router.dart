import 'package:dattebayo/core/routing/routes.dart';
import 'package:dattebayo/features/characters/ui/screens/all_characters_screen.dart';
import 'package:dattebayo/features/home/ui/home_screen.dart';
import 'package:dattebayo/features/onboarding/ui/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.charactersScreen:
        return MaterialPageRoute(
          builder: (context) => const AllCharactersScreen(),
        );
      default:
        return null;
    }
  }
}
