import 'package:dattebayo/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/helpers/spacer.dart';
import '../../../../core/themes/colors.dart';
import '../widgets/details_card_image.dart';
import '../widgets/foldable_item.dart';
import '../widgets/general_details_elements.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: Container(
            margin: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: ColorManager.lightBrown,
              shape: BoxShape.circle,
            ),
            child: const BackButton(color: ColorManager.mainColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              const DetailsCardImage(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    const GeneralDetailsElements(
                      sex: 'Male',
                      clan: 'uzumaki',
                      affiliation: 'Konoha',
                    ),
                    verticalSpace(24),
                    FoldableItem(
                      leadingIcon: FontAwesomeIcons.userNinja,
                      title: 'Personal Details',
                      children: [
                        _buildPersonalDetailsItem('Birthdate', 'Oct 10'),
                        _buildPersonalDetailsItem('age', '32'),
                        _buildPersonalDetailsItem('height', '180 cm'),
                        _buildPersonalDetailsItem('weight', '66 kg'),
                        _buildPersonalDetailsItem('blood type', 'B'),
                      ],
                    ),
                    const FoldableItem(
                      leadingIcon: FontAwesomeIcons.usersViewfinder,
                      title: 'Family',
                      children: [],
                    ),
                    const FoldableItem(
                      leadingIcon: FontAwesomeIcons.handHoldingHand,
                      title: 'Teams',
                      children: [],
                    ),
                    const FoldableItem(
                      leadingIcon: FontAwesomeIcons.quoteLeft,
                      title: 'Titles',
                      children: [],
                    ),
                    const FoldableItem(
                      leadingIcon: FontAwesomeIcons.hurricane,
                      title: 'kekkei genkai',
                      children: [],
                    ),
                    const FoldableItem(
                      leadingIcon: FontAwesomeIcons.hamsa,
                      title: 'kekkei Mora',
                      children: [],
                    ),
                    const FoldableItem(
                      leadingIcon: FontAwesomeIcons.fingerprint,
                      title: 'unique traits',
                      children: [],
                    ),
                    verticalSpace(32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPersonalDetailsItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: Row(
        children: [
          Text(label.toUpperCase(), style: AppTextStyles.font12BlueGrayBold),
          const Spacer(),
          Text(value, style: AppTextStyles.font16WhiteBrownMedium),
        ],
      ),
    );
  }
}
