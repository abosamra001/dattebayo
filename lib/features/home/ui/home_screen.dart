import 'package:dattebayo/core/helpers/spacer.dart';
import 'package:dattebayo/core/widgets/top_search_bar.dart';
import 'package:dattebayo/features/home/ui/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/explore_more_cards.dart';
import 'widgets/featured_characters.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            children: [
              TopSearchBar(
                controller: TextEditingController(),
                onSubmitted: (String? value) {},
                onChanged: (String? value) {},
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      verticalSpace(30),
                      const FeaturedCharacters(),
                      verticalSpace(30),
                      const ExploreMoreCards(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
