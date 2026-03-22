import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/helpers/audio_manager.dart';
import '../../../core/helpers/spacer.dart';
import '../../../core/themes/app_text_styles.dart';
import '../../../core/themes/colors.dart';
import 'widgets/explore_more_cards.dart';
import 'widgets/featured_characters.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome,  Shinobi ﾒ',
          style: AppTextStyles.font20MainOrangeBold.copyWith(
            fontFamily: 'Ninja',
          ),
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
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                const FeaturedCharacters(),
                verticalSpace(30),
                const ExploreMoreCards(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
