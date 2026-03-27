import 'package:dattebayo/core/networking/cubit/network_cubit.dart';
import 'package:dattebayo/core/themes/app_text_styles.dart';
import 'package:dattebayo/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../networking/cubit/network_state.dart';

class NetworkWrapper extends StatefulWidget {
  final Widget child;
  const NetworkWrapper({super.key, required this.child});

  @override
  State<NetworkWrapper> createState() => _NetworkWrapperState();
}

class _NetworkWrapperState extends State<NetworkWrapper> {
  bool _internetHasCorrupted = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkCubit, NetworkState>(
      listener: (context, state) {
        state.maybeWhen(
          disConnected: () {
            ScaffoldMessenger.of(context).showSnackBar(
              _buildSnackBar(
                text: 'You are currently offline.',
                hasInternet: false,
              ),
            );
            _internetHasCorrupted = true;
          },
          connected: () {
            if (!_internetHasCorrupted) return;

            ScaffoldMessenger.of(context).hideCurrentSnackBar();

            ScaffoldMessenger.of(context).showSnackBar(
              _buildSnackBar(
                text: 'Your internet connection was restored.',
                hasInternet: true,
              ),
            );
            _internetHasCorrupted = false;
          },
          orElse: () {},
        );
      },
      child: widget.child,
    );
  }

  SnackBar _buildSnackBar({required String text, required bool hasInternet}) {
    return SnackBar(
      content: ListTile(
        leading: FaIcon(
          FontAwesomeIcons.wifi,
          color: hasInternet ? ColorManager.lightGreen : ColorManager.blueGray,
        ),
        title: Text(text, style: AppTextStyles.font12WhiteBrownReqular),
        contentPadding: .zero,
        minTileHeight: 10,
        minVerticalPadding: 0,
      ),
      showCloseIcon: true,
      closeIconColor: ColorManager.mainColor,
      duration: hasInternet
          ? const Duration(milliseconds: 4000)
          : const Duration(days: 1),
      backgroundColor: ColorManager.lightBrown,
      shape: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.mainColor.withValues(alpha: 0.5),
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      behavior: .floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100,
        left: 16,
        right: 16,
      ),
    );
  }
}
