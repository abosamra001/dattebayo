import 'package:cached_network_image/cached_network_image.dart';
import 'package:dattebayo/core/helpers/spacer.dart';
import 'package:dattebayo/core/themes/app_text_styles.dart';
import 'package:dattebayo/core/themes/colors.dart';
import 'package:dattebayo/core/widgets/uzumaki_loading_indicator.dart';
import 'package:dattebayo/features/characters/data/models/character_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CharacterItem extends StatefulWidget {
  final CharacterModel characterModel;
  const CharacterItem({super.key, required this.characterModel});

  @override
  State<CharacterItem> createState() => _CharacterItemState();
}

class _CharacterItemState extends State<CharacterItem> {
  bool isHovering = false;
  void _handleTap(bool isPressed) {
    setState(() {
      isHovering = isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      onTapDown: (_) => _handleTap(true),
      onTapUp: (_) => _handleTap(false),
      onTapCancel: () => _handleTap(false),
      child: Stack(
        alignment: .bottomStart,
        children: [
          Container(
            width: 280.w,
            height: 378.h,
            // padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(color: ColorManager.mainColor, width: 1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            clipBehavior: .antiAlias,
            foregroundDecoration: BoxDecoration(
              border: Border.all(color: ColorManager.mainColor, width: 1),
              borderRadius: BorderRadius.circular(12.r),
              gradient: const LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: .bottomCenter,
                end: .center,
                stops: [0, 0.9],
              ),
            ),
            child: AnimatedScale(
              scale: isHovering ? 1.08 : 1,
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              child: CachedNetworkImage(
                imageUrl: widget.characterModel.images?.firstOrNull ?? '',
                fit: .cover,
                placeholder: (context, url) =>
                    const Center(child: UzumakiLoadingIndicator()),
                errorWidget: (context, url, error) {
                  return Column(
                    mainAxisAlignment: .center,
                    children: [
                      const FaIcon(FontAwesomeIcons.exclamation, size: 36),
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
          ),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              children: [
                Text(
                  widget.characterModel.personal?.team?.firstOrNull ??
                      'No Team',
                  style: AppTextStyles.font12MainOrangeBold,
                ),
                verticalSpace(2),
                Text(
                  widget.characterModel.name ?? 'Ninja',
                  style: AppTextStyles.font20WhiteBold.copyWith(
                    fontFamily: 'Ninja',
                  ),
                ),
                verticalSpace(2),
                Text(
                  widget.characterModel.personal?.occupation?.firstOrNull ??
                      'Genin',
                  style: AppTextStyles.font14BlueGrayReqular,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
