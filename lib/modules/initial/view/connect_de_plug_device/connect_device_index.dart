import 'package:deplug/core/di/di.dart';
import 'package:deplug/core/services/l10n/gen_l10n/app_localizations.dart';
import 'package:deplug/core/utils/go_router/routes_navigation.dart';
import 'package:deplug/core/utils/resource/r.dart';
import 'package:deplug/core/widgets/base_widget.dart';
import 'package:deplug/modules/initial/bloc/device_connection_bloc.dart';
import 'package:deplug/modules/initial/view/connect_de_plug_device/widget/add_device_widget.dart';
import 'package:deplug/modules/initial/view/connect_de_plug_device/widget/rename_device_widget.dart';
import 'package:deplug/modules/initial/view/connect_de_plug_device/widget/wifi_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConnectDeviceIndex extends StatefulWidget {
  const ConnectDeviceIndex({super.key});

  @override
  State<ConnectDeviceIndex> createState() => _ConnectDeviceIndexState();
}

class _ConnectDeviceIndexState extends State<ConnectDeviceIndex> {
  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context);

    return BlocConsumer<ConnectDeviceBloc, ConnectDeviceState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var stepIndex = getStepIndex(state.currentWidgetStep);
        return Background(
          topGradient: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 60.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        sl<Navigation>().popFromRoute();
                      },
                      child: Container(
                        height: 36.r,
                        alignment: Alignment.center,
                        width: 36.r,
                        padding: EdgeInsets.only(left: 6.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: R.palette.secondaryButton,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: R.palette.white,
                          size: 20.r,
                        ),
                      ),
                    ),
                    Text(
                      tr.addADevice,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: R.palette.white,
                          ),
                    ),
                    Text(
                      '${getIndex(state.currentWidgetStep)}/3',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: R.palette.white,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                Row(
                  spacing: 14.w,
                  children: DeviceConnectionEnum.values
                      .asMap()
                      .values
                      .map(
                        (v) => Expanded(
                          child: Container(
                            height: 10.h,
                            decoration: BoxDecoration(
                              color: stepIndex >= v.index ? R.palette.primary : R.palette.secondaryButton,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                getStepWidget(state.currentWidgetStep),
              ],
            ),
          ),
        );
      },
    );
  }

  void nextStep(currentStep) {
    setState(() {
      switch (currentStep) {
        case DeviceConnectionEnum.addDevice:
          currentStep = DeviceConnectionEnum.wifiName;
          break;
        case DeviceConnectionEnum.wifiName:
          currentStep = DeviceConnectionEnum.renameDevice;
          break;
        case DeviceConnectionEnum.renameDevice:
          // Optional: Reset or perform other actions
          break;
      }
    });
  }

  int getStepIndex(DeviceConnectionEnum step) {
    switch (step) {
      case DeviceConnectionEnum.addDevice:
        return 0;
      case DeviceConnectionEnum.wifiName:
        return 1;
      case DeviceConnectionEnum.renameDevice:
        return 2;
    }
  }

  Widget getStepWidget(DeviceConnectionEnum currentStep) {
    switch (currentStep) {
      case DeviceConnectionEnum.addDevice:
        return const AddDeviceWidget();
      case DeviceConnectionEnum.renameDevice:
        return const RenameDeviceWidget();
      case DeviceConnectionEnum.wifiName:
        return const WifiNameWidget();
    }
  }

  int getIndex(DeviceConnectionEnum currentWidgetStep) {
    switch (currentWidgetStep) {
      case DeviceConnectionEnum.addDevice:
        return 1;
      case DeviceConnectionEnum.wifiName:
        return 2;
      case DeviceConnectionEnum.renameDevice:
        return 3;
    }
  }
}

enum DeviceConnectionEnum { addDevice, wifiName, renameDevice }
