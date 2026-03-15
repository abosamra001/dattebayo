import 'package:dattebayo/core/helpers/spacer.dart';
import 'package:dattebayo/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CharacterItem extends StatefulWidget {
  final String image;
  final String name;
  final String occupation;
  final String team;
  final VoidCallback onTap;
  const CharacterItem({
    super.key,
    required this.image,
    required this.name,
    required this.occupation,
    required this.team,
    required this.onTap,
  });

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
      onTap: widget.onTap,
      onTapDown: (_) => _handleTap(true),
      onTapUp: (_) => _handleTap(false),
      onTapCancel: () => _handleTap(false),
      child: Stack(
        alignment: .bottomStart,
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.05),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12.r),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withValues(alpha: 0.75),
                  Colors.transparent,
                ],
                begin: .bottomCenter,
                end: .center,
                stops: const [0, 0.8],
              ),
            ),
            child: AnimatedScale(
              scale: isHovering ? 1.08 : 1,
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              child: Image.asset(widget.image, fit: .cover),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              children: [
                Text(widget.team, style: AppTextStyles.font12MainOrangeBold),
                verticalSpace(2),
                Text(
                  widget.name,
                  style: AppTextStyles.font20WhiteBold.copyWith(
                    fontFamily: 'Ninja',
                  ),
                ),
                verticalSpace(2),
                Text(
                  widget.occupation,
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
