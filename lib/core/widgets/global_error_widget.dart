import 'package:flutter/material.dart';

import '../helpers/spacer.dart';
import '../themes/app_text_styles.dart';

class GlobalErrorWidget extends StatelessWidget {
  final String error;
  final double? imageWidth;
  final double? imageheight;
  const GlobalErrorWidget({
    super.key,
    required this.error,
    this.imageWidth = 240,
    this.imageheight = 280,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          Image.asset(
            'assets/images/png/error_3.png',
            width: imageWidth,
            height: imageheight,
          ),
          verticalSpace(8),
          Text(
            error,
            style: AppTextStyles.font10WhiteBold,
            overflow: .ellipsis,
          ),
        ],
      ),
    );
  }
}
