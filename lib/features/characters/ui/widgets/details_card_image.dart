import 'package:cached_network_image/cached_network_image.dart';
import 'package:dattebayo/core/helpers/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacer.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/widgets/uzumaki_loading_indicator.dart';

class DetailsCardImage extends StatefulWidget {
  final List<String> images;
  final String occupation;
  final String name;
  const DetailsCardImage({
    super.key,
    required this.images,
    required this.occupation,
    required this.name,
  });

  @override
  State<DetailsCardImage> createState() => _DetailsCardImageState();
}

class _DetailsCardImageState extends State<DetailsCardImage> {
  int _imageIndex = 1;
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
          child: widget.images.isEmpty
              ? _buildErrorWidget()
              : PageView.builder(
                  itemCount: widget.images.length,
                  onPageChanged: (value) {
                    setState(() {
                      _imageIndex = value + 1;
                    });
                  },
                  itemBuilder: (context, index) => CachedNetworkImage(
                    imageUrl: widget.images[index],
                    fit: .cover,
                    placeholder: (context, url) =>
                        const Center(child: UzumakiLoadingIndicator()),
                    errorWidget: (context, url, error) {
                      Logger.printG(error.toString());
                      return _buildErrorWidget();
                    },
                  ),
                ),
        ),
        Positioned(
          top: 20,
          right: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 4.h),
            decoration: BoxDecoration(
              color: ColorManager.lightBrown,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text('$_imageIndex  /  ${widget.images.length}'),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: .start,
            mainAxisSize: .min,
            children: [
              Text(
                widget.occupation.toUpperCase(),
                style: AppTextStyles.font14MainOrangeSemiBold,
                overflow: .ellipsis,
              ),
              verticalSpace(2),
              Text(
                widget.name,
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

  Widget _buildErrorWidget() {
    return Column(
      mainAxisAlignment: .center,
      children: [
        Image.asset('assets/images/png/error_2.png', width: 180, height: 180),
        Text('No Photo Found ', style: AppTextStyles.font14BlueGrayReqular),
      ],
    );
  }
}
