import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/themes/colors.dart';

class FoldableItem extends StatelessWidget {
  final FaIconData leadingIcon;
  final String title;
  final List<Widget> children;
  const FoldableItem({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: ExpansionTile(
        backgroundColor: ColorManager.brown,
        collapsedBackgroundColor: ColorManager.brown,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: ColorManager.mainColor.withValues(alpha: 0.3),
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        leading: FaIcon(leadingIcon, color: ColorManager.mainColor, size: 20),
        title: Text(
          title.toUpperCase(),
          style: AppTextStyles.font14WhiteBrownBold,
        ),
        iconColor: ColorManager.mainColor,
        collapsedIconColor: ColorManager.blueGray,
        childrenPadding: EdgeInsets.all(16.r),
        tilePadding: EdgeInsets.symmetric(horizontal: 16.w),
        children: children,
      ),
    );
  }
}
