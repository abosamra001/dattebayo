import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacer.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/themes/colors.dart';
import '../../data/models/character_response_model.dart';
import '../widgets/details_card_image.dart';
import '../widgets/foldable_item.dart';
import '../widgets/general_details_elements.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final CharacterModel character;
  const CharacterDetailsScreen({super.key, required this.character});

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
              DetailsCardImage(
                name: character.name ?? 'Ninja',
                occupation:
                    character.personal?.occupation?.firstOrNull ?? 'Shinopi',
                image: character.images?.firstOrNull ?? '',
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    // sex , clan , village
                    GeneralDetailsElements(
                      items: [
                        _parseSex(character.personal!.sex),
                        '${character.personal?.clan?.firstOrNull ?? 'No'} Clan',
                        character.personal?.affiliation?.firstOrNull ??
                            'Unknown',
                      ],
                    ),
                    verticalSpace(24),
                    // personal details
                    FoldableItem(
                      leadingIcon: FontAwesomeIcons.userNinja,
                      title: 'Personal Details',
                      children: [
                        _buildPersonalDetailsItem(
                          'Birthdate',
                          character.personal?.birthdate ?? 'Unknown',
                        ),
                        const Divider(
                          thickness: 0.1,
                          color: ColorManager.blueGray,
                        ),
                        _buildPersonalDetailsItem(
                          'age',
                          _parseMap(character.personal?.age),
                        ),
                        const Divider(
                          thickness: 0.1,
                          color: ColorManager.blueGray,
                        ),
                        _buildPersonalDetailsItem(
                          'height',
                          _parseMap(character.personal?.height),
                        ),
                        const Divider(
                          thickness: 0.1,
                          color: ColorManager.blueGray,
                        ),
                        _buildPersonalDetailsItem(
                          'weight',
                          _parseMap(character.personal?.weight),
                        ),
                        const Divider(
                          thickness: 0.1,
                          color: ColorManager.blueGray,
                        ),
                        _buildPersonalDetailsItem(
                          'blood type',
                          character.personal?.bloodType ?? 'Unknown',
                        ),
                      ],
                    ),
                    if (!character.family.isNullOrEmpty)
                      FoldableItem(
                        leadingIcon: FontAwesomeIcons.usersViewfinder,
                        title: 'Family',
                        children:
                            character.family?.entries
                                .map((e) => _buildFamilyItem(e.key, e.value))
                                .toList() ??
                            [],
                      ),
                    if (character.personal != null &&
                        !character.personal!.team.isNullOrEmpty)
                      FoldableItem(
                        leadingIcon: FontAwesomeIcons.handHoldingHand,
                        title: 'Teams',
                        children: [
                          GeneralDetailsElements(
                            items: character.personal?.team ?? [],
                          ),
                        ],
                      ),
                    if (character.personal != null &&
                        !character.personal!.titles.isNullOrEmpty)
                      FoldableItem(
                        leadingIcon: FontAwesomeIcons.quoteLeft,
                        title: 'Titles',
                        children: [
                          GeneralDetailsElements(
                            items:
                                character.personal?.titles
                                    ?.map((e) => _parseTitle(e))
                                    .toList() ??
                                [],
                          ),
                        ],
                      ),
                    if (character.personal != null &&
                        !character.personal!.kekkeiGenkai.isNullOrEmpty)
                      FoldableItem(
                        leadingIcon: FontAwesomeIcons.hurricane,
                        title: 'kekkei genkai',
                        children: [
                          GeneralDetailsElements(
                            items:
                                character.personal?.kekkeiGenkai
                                    ?.map((e) => _parseTitle(e))
                                    .toList() ??
                                [],
                          ),
                        ],
                      ),
                    if (character.personal != null &&
                        !character.personal!.kekkeiMora.isNullOrEmpty)
                      FoldableItem(
                        leadingIcon: FontAwesomeIcons.hamsa,
                        title: 'kekkei Mora',
                        children: [
                          GeneralDetailsElements(
                            items:
                                character.personal?.kekkeiMora
                                    ?.map((e) => _parseTitle(e))
                                    .toList() ??
                                [],
                          ),
                        ],
                      ),
                    if (character.personal != null &&
                        !character.personal!.uniqueTraits.isNullOrEmpty)
                      FoldableItem(
                        leadingIcon: FontAwesomeIcons.fingerprint,
                        title: 'unique traits',
                        children: [
                          GeneralDetailsElements(
                            items:
                                character.personal?.uniqueTraits
                                    ?.map((e) => _parseTitle(e))
                                    .toList() ??
                                [],
                          ),
                        ],
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
          Text(
            value,
            style: AppTextStyles.font16WhiteBrownMedium,
            textAlign: .start,
          ),
        ],
      ),
    );
  }

  Widget _buildFamilyItem(String key, String value) {
    return ListTile(
      contentPadding: .zero,
      leading: CircleAvatar(
        radius: 18.r,
        backgroundColor: ColorManager.lightBrown,
        foregroundColor: ColorManager.mainColor,
        child: const FaIcon(FontAwesomeIcons.heart, size: 18),
      ),
      title: Text(key.toUpperCase(), style: AppTextStyles.font12BlueGrayBold),
      subtitle: Text(value, style: AppTextStyles.font16WhiteBrownMedium),
    );
  }

  String _parseSex(String? sex) {
    if (sex.isNullOrEmpty || sex!.length > 6) return 'Undefined';
    return sex;
  }

  String _parseMap(Map<String, String>? age) {
    return age?.entries.map((e) => '${e.key} : ${e.value}').join('\n') ??
        'Unknown';
  }

  String _parseTitle(String title) {
    final cleaned = title.contains('(')
        ? title.substring(0, title.indexOf('(')).trim()
        : title.trim();
    final spaced = cleaned.replaceAllMapped(
      RegExp(
        r'(?<=[a-z])(?=[A-Z])',
      ), // reqular expression indecates for every Capital char after a Small char
      (_) => ' ',
    );

    return spaced.isNullOrEmpty
        ? spaced
        : spaced[0].toUpperCase() + spaced.substring(1);
  }
}
