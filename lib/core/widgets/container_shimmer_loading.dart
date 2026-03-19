import 'package:dattebayo/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ContainerShimmerLoading extends StatelessWidget {
  final Color baseColor;
  final Color highlightingColor;
  final double width;
  final double height;
  final double borderRadius;
  const ContainerShimmerLoading({
    super.key,
    this.baseColor = ColorManager.lightBrown,
    this.highlightingColor = ColorManager.mainColor,
    required this.width,
    required this.height,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightingColor.withValues(alpha: 0.3),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: highlightingColor.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
      ),
    );
  }
}
