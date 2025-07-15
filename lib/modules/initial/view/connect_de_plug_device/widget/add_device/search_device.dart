import 'package:deplug/core/services/l10n/gen_l10n/app_localizations.dart';
import 'package:deplug/core/utils/resource/r.dart';
import 'package:deplug/core/widgets/my_lottie.dart';
import 'package:deplug/modules/initial/bloc/device_connection_bloc.dart';
import 'package:deplug/modules/initial/view/connect_de_plug_device/widget/add_device_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchDevice extends StatelessWidget {
  const SearchDevice({super.key});

  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context);
    return Column(
      children: [
        SizedBox(height: 110.h),
        SizedBox(
          child: Stack(
            children: [
              Positioned(
                top: 44.h,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  R.assets.graphics.svgIcons.deviceConnectContainer,
                  height: 282.r,
                ),
              ),
              MyLottie(
                asset: R.assets.graphics.lottieAssets.radarAnim,
                height: 400.r,
                width: double.maxFinite,
                fit: BoxFit.fill,
              )
            ],
          ),
        ),
        SizedBox(height: 153.h),
        GestureDetector(
          onTap: () {
            context.read<ConnectDeviceBloc>().add(ChangeAddDeviceScreenEvent(addDeviceScreens: AddDeviceScreens.deviceFound));
          },
          child: Text(
            tr.holdDeviceButton,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: R.palette.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          tr.holdDeviceButtonDesc,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: R.palette.disabledColor,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                letterSpacing: 0,
                height: 18.sp / 12.sp,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
