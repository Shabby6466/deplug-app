import 'package:deplug/core/services/l10n/gen_l10n/app_localizations.dart';
import 'package:deplug/core/utils/resource/r.dart';
import 'package:deplug/core/widgets/material_button.dart';
import 'package:deplug/modules/initial/bloc/device_connection_bloc.dart';
import 'package:deplug/modules/initial/view/connect_de_plug_device/widget/add_device_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeviceConnectWidget extends StatelessWidget {
  const DeviceConnectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context);
    return Column(
      children: [
        SizedBox(height: 110.h),
        SizedBox(
          height: 380.r,
          width: 282.r,
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
              Positioned(
                left: 100.r,
                top: 100.r,
                child: SvgPicture.asset(
                  R.assets.graphics.svgIcons.deviceIcon,
                  width: 32.r,
                  height: 32.r,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 109.h),
        Container(
          height: 56.h,
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          decoration: BoxDecoration(
              color: R.palette.secondaryButton, borderRadius: BorderRadius.circular(100.r)),
          child: Row(
            children: [
              SvgPicture.asset(
                R.assets.graphics.svgIcons.deplugWhite,
              ),
              SizedBox(width: 10.w),
              Text(
                '#4y49202y2',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: R.palette.white,
                    ),
              )
            ],
          ),
        ),
        SizedBox(height: 32.h),
        MyButton(
          title: tr.connect,
          onTap: () {
            const uniqueId = '4y49202y2';
            if (uniqueId.isNotEmpty) {
              context.read<ConnectDeviceBloc>().add(UpdateUniqueIdEvent(uniqueId: uniqueId));
            }
            context.read<ConnectDeviceBloc>().add(
                ChangeAddDeviceScreenEvent(addDeviceScreens: AddDeviceScreens.deviceConnecting));
          },
          borderRadius: 100.r,
          height: 56.h,
          titleColor: R.palette.blackColor,
        )
      ],
    );
  }
}
