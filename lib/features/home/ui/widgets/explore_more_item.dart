import 'package:dattebayo/core/themes/app_text_styles.dart';
import 'package:dattebayo/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExploreMoreItem extends StatelessWidget {
  final String label;
  final FaIconData icon;
  final VoidCallback onTap;
  const ExploreMoreItem({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: ColorManager.mainColor.withValues(alpha: 0.2),
      highlightColor: ColorManager.mainColor.withValues(alpha: 0.2),
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 160.w,
        height: 116.h,
        alignment: .center,
        decoration: BoxDecoration(
          color: ColorManager.lightBrown.withValues(alpha: 0.4),
          border: Border.all(
            color: ColorManager.mainColor.withValues(alpha: 0.1),
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            CircleAvatar(
              radius: 28.r,
              backgroundColor: ColorManager.mainColor.withValues(alpha: 0.2),
              child: FaIcon(icon, color: ColorManager.mainColor, size: 28),
            ),
            Text(label, style: AppTextStyles.font14WhiteBold),
          ],
        ),
      ),
    );
  }
}
