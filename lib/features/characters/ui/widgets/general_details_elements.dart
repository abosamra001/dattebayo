import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/themes/colors.dart';

class GeneralDetailsElements extends StatelessWidget {
  final String sex;
  final String clan;
  final String affiliation;
  const GeneralDetailsElements({
    super.key,
    required this.sex,
    required this.clan,
    required this.affiliation,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        _buildItem(sex, ColorManager.mainColor),
        _buildItem('$clan clan', ColorManager.skyBlue),
        _buildItem(affiliation, ColorManager.lightGreen),
      ],
    );
  }

  Widget _buildItem(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      margin: EdgeInsets.only(bottom: 8.h, right: 8.w),
      decoration: BoxDecoration(
        color: ColorManager.blackRussian,
        border: Border.all(color: color.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        text.toUpperCase(),
        style: AppTextStyles.font12MainOrangeBold.copyWith(color: color),
      ),
    );
  }
}
