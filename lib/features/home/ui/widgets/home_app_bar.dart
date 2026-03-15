import 'package:dattebayo/core/helpers/audio_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/themes/colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Welcome,  Shinobi ﾒ',
        style: AppTextStyles.font20MainOrangeBold.copyWith(fontFamily: 'Ninja'),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            AudioManager.i.play('assets/audios/dattebayo_sound.mp3');
          },
          child: const CircleAvatar(
            radius: 24,
            backgroundColor: ColorManager.lightBrown,
            child: FaIcon(
              FontAwesomeIcons.spiral,
              color: ColorManager.mainColor,
            ),
          ),
        ),
      ],
      actionsPadding: EdgeInsets.symmetric(horizontal: 16.w),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
