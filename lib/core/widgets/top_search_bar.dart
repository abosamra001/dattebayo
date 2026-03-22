import 'package:dattebayo/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/colors.dart';

class TopSearchBar extends StatelessWidget {
  final ValueChanged<String?> onSubmitted;
  final ValueChanged<String?> onChanged;
  final TextEditingController controller;
  final String? hintText;
  const TopSearchBar({
    super.key,
    required this.onSubmitted,
    required this.onChanged,
    required this.controller,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      controller: controller,
      textInputAction: .search,
      textStyle: WidgetStatePropertyAll(AppTextStyles.font12MainOrangeBold),
      leading: Icon(
        Icons.search,
        color: ColorManager.mainColor.withValues(alpha: 0.6),
      ),
      backgroundColor: WidgetStatePropertyAll(
        ColorManager.lightBrown.withValues(alpha: 0.5),
      ),

      hintText: hintText ?? 'Search Jutsu, Shinobi, or  Clans...',
      hintStyle: WidgetStatePropertyAll(AppTextStyles.font14BlueGrayReqular),
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16.w)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
    );
  }
}
