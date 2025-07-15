import 'dart:math';

import 'package:deplug/core/services/l10n/gen_l10n/app_localizations.dart';
import 'package:deplug/core/utils/resource/r.dart';
import 'package:deplug/core/widgets/my_lottie.dart';
import 'package:deplug/modules/initial/bloc/device_connection_bloc.dart';
import 'package:deplug/modules/initial/view/connect_de_plug_device/widget/add_device_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeviceFoundWidget extends StatefulWidget {
  const DeviceFoundWidget({super.key});

  @override
  State<DeviceFoundWidget> createState() => _DeviceFoundWidgetState();
}

class _DeviceFoundWidgetState extends State<DeviceFoundWidget> {
  List<Widget> devicesWidgets = [];

  @override
  void initState() {
    devicesWidgets.add(_randomizePosition());
    super.initState();
  }

  Widget _randomizePosition() {
    double left = 0;
    double top = 0;
    final random = Random();
    setState(() {
      left = random.nextDouble() * (282 - 50); // Assuming SVG size is 50x50
      top = random.nextDouble() * (282 - 50);
    });
    return Positioned(
      left: left,
      top: top,
      child: SvgPicture.asset(
        R.assets.graphics.svgIcons.deviceIcon,
        width: 32.r,
        height: 32.r,
      ),
    );
  }

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
              GestureDetector(
                onTap: () {
                  devicesWidgets.add(_randomizePosition());
                },
                child: MyLottie(
                  asset: R.assets.graphics.lottieAssets.radarAnim,
                  height: 400.r,
                  width: double.maxFinite,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 40.h,
                left: 50.r,
                right: 50.r,
                child: SizedBox(
                  height: 282.r,
                  width: 282.r,
                  child: Stack(
                    children: devicesWidgets,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 153.h),
        GestureDetector(
          onTap: () {
            context.read<ConnectDeviceBloc>().add(ChangeAddDeviceScreenEvent(addDeviceScreens: AddDeviceScreens.deviceConnect));
          },
          child: Text(
            tr.selectDeviceToConnect,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: R.palette.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                ),
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          tr.selectDeviceToConnectDesc,
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
