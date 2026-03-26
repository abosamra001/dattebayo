import 'package:dattebayo/features/characters/ui/screens/character_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/characters/logic/characters_cubit.dart';
import '../../features/characters/ui/screens/all_characters_screen.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<CharactersCubit>(
            create: (context) =>
                getIt<CharactersCubit>()..getAllCharacters(limit: 5),
            child: const HomeScreen(),
          ),
        );
      case Routes.charactersScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<CharactersCubit>(
            create: (context) => getIt<CharactersCubit>()..getAllCharacters(),
            child: const AllCharactersScreen(),
          ),
        );
      case Routes.characterDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => const CharacterDetailsScreen(),
        );
      default:
        return null;
    }
  }
}
