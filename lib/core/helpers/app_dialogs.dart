import 'package:dattebayo/core/helpers/extensions.dart';
import 'package:dattebayo/core/themes/app_text_styles.dart';
import 'package:dattebayo/core/themes/colors.dart';
import 'package:dattebayo/features/characters/logic/characters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDialogs {
  static void showErrorDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Image.asset('assets/images/png/error.png'),
        content: Text(
          error,
          style: AppTextStyles.font14WhiteBrownBold,
          textAlign: .center,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              context.pop();
            },
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(ColorManager.lightBrown),
              foregroundColor: WidgetStatePropertyAll(ColorManager.mainColor),
            ),
            child: const Text('Ok'),
          ),
          ElevatedButton(
            onPressed: () {
              context.pop();
              // context.read<CharactersCubit>().searchCharactersByName(); //todo:
            },
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(ColorManager.lightBrown),
              foregroundColor: WidgetStatePropertyAll(ColorManager.mainColor),
            ),
            child: const Text('Refresh'),
          ),
        ],
        actionsAlignment: .center,
        backgroundColor: ColorManager.brown,
      ),
    );
  }
}
