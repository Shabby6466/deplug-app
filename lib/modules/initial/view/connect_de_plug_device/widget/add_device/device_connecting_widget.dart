import 'package:deplug/core/services/l10n/gen_l10n/app_localizations.dart';
import 'package:deplug/core/utils/resource/r.dart';
import 'package:deplug/modules/initial/bloc/device_connection_bloc.dart';
import 'package:deplug/modules/initial/view/connect_de_plug_device/connect_device_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeviceConnectingWidget extends StatelessWidget {
  const DeviceConnectingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context);
    return Column(
      children: [
        SizedBox(height: 280.h),
        SvgPicture.asset(
          R.assets.graphics.svgIcons.deplugWhite,
          height: 75.r,
        ),
        SizedBox(height: 28.h),
        GestureDetector(
          onTap: () {
            context.read<ConnectDeviceBloc>().add(ChangeWidgetStepEvent(deviceConnectionEnum: DeviceConnectionEnum.wifiName));
          },
          child: Text(
            tr.connecting,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: R.palette.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                ),
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          tr.keepDeviceOn,
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
