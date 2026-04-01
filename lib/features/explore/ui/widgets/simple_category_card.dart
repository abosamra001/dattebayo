import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/helpers/spacer.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/themes/colors.dart';

class SimpleCategoryCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color color;
  final int index;
  final VoidCallback onTap;
  const SimpleCategoryCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.color,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 24.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          decoration: BoxDecoration(
            color: ColorManager.brown,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: color,
                blurRadius: 2,
                spreadRadius: 0.4,
                offset: index % 2 == 0
                    ? const Offset(-2, 2)
                    : const Offset(2, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.font20WhiteBrownBold,
                      maxLines: 2,
                      overflow: .ellipsis,
                    ),
                    verticalSpace(8),
                    Row(
                      crossAxisAlignment: .center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.users,
                          color: ColorManager.blueGray,
                          size: 12,
                        ),
                        horizontalSpace(8),
                        Text(
                          subTitle,
                          style: AppTextStyles.font14BlueGrayReqular,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              FaIcon(FontAwesomeIcons.caretRight, color: color),
            ],
          ),
        ),
      ),
    );
  }
}
