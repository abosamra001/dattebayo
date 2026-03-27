import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacer.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/widgets/uzumaki_loading_indicator.dart';

class DetailsCardImage extends StatelessWidget {
  final String image;
  final String occupation;
  final String name;
  const DetailsCardImage({
    super.key,
    required this.image,
    required this.occupation,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: .bottomStart,
      children: [
        Container(
          width: double.infinity,
          height: 487.h,
          foregroundDecoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [ColorManager.backgroundColor, Colors.transparent],
              begin: .bottomCenter,
              end: .topCenter,
              stops: [0.04, 0.6],
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: .cover,
            placeholder: (context, url) =>
                const Center(child: UzumakiLoadingIndicator()),
            errorWidget: (context, url, error) {
              return Column(
                mainAxisAlignment: .center,
                children: [
                  Image.asset('assets/images/png/error_2.png'),
                  verticalSpace(16),
                  Text(
                    'No Photo Found',
                    style: AppTextStyles.font14BlueGrayReqular,
                  ),
                ],
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: .start,
            mainAxisSize: .min,
            children: [
              Text(
                occupation.toUpperCase(),
                style: AppTextStyles.font14MainOrangeSemiBold,
                overflow: .ellipsis,
              ),
              verticalSpace(2),
              Text(
                name,
                style: AppTextStyles.font36WhiteExtraBold.copyWith(
                  fontFamily: 'Ninja',
                ),
                overflow: .ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
