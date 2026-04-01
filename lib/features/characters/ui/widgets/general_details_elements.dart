import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/themes/colors.dart';

class GeneralDetailsElements extends StatefulWidget {
  final List<String> items;

  const GeneralDetailsElements({super.key, required this.items});

  @override
  State<GeneralDetailsElements> createState() => _GeneralDetailsElementsState();
}

class _GeneralDetailsElementsState extends State<GeneralDetailsElements> {
  final List<Color> colors = [
    ColorManager.mainColor,
    ColorManager.mainFontColor,
    ColorManager.lightGreen,
    ColorManager.skyBlue,
    Colors.deepPurple,
  ];

  int i = 0;

  @override
  void dispose() {
    i = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [...widget.items.map((e) => _buildItem(e, colors[(i++) % 5]))],
    );
  }

  Widget _buildItem(String? text, Color color) {
    return text.isNullOrEmpty
        ? const SizedBox.shrink()
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
            margin: EdgeInsets.only(bottom: 8.h, right: 8.w),
            decoration: BoxDecoration(
              color: ColorManager.blackRussian,
              border: Border.all(color: color.withValues(alpha: 0.3)),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              text!,
              style: AppTextStyles.font12MainOrangeBold.copyWith(color: color),
            ),
          );
  }
}
