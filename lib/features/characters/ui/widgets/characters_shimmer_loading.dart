import 'package:dattebayo/core/widgets/container_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CharactersShimmerLoading extends StatelessWidget {
  const CharactersShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      height: 270.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .start,
        children: [
          Stack(
            alignment: .topEnd,
            children: [
              // photo
              ContainerShimmerLoading(width: 170.w, height: 192.h),
              // occupation
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ContainerShimmerLoading(
                  width: 60.w,
                  height: 30.h,
                  borderRadius: 4,
                ),
              ),
            ],
          ),
          // name and place
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  ContainerShimmerLoading(width: 120, height: 20),
                  Spacer(),
                  ContainerShimmerLoading(width: 100, height: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
