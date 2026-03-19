import 'package:dattebayo/core/helpers/spacer.dart';
import 'package:dattebayo/core/themes/colors.dart';
import 'package:dattebayo/core/widgets/container_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedShimmerLoading extends StatelessWidget {
  const FeaturedShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: .bottomStart,
      children: [
        ContainerShimmerLoading(width: 280.w, height: 378.h),
        Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisAlignment: .end,
            crossAxisAlignment: .start,
            children: [
              const ContainerShimmerLoading(
                width: 100,
                height: 15,
                baseColor: ColorManager.backgroundColor,
              ),
              verticalSpace(4),
              const ContainerShimmerLoading(
                width: 140,
                height: 20,
                baseColor: ColorManager.backgroundColor,
              ),
              verticalSpace(4),
              const ContainerShimmerLoading(
                width: 110,
                height: 15,
                baseColor: ColorManager.backgroundColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
