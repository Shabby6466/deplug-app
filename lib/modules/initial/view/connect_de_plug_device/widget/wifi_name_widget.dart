import 'package:deplug/core/services/l10n/gen_l10n/app_localizations.dart';
import 'package:deplug/core/utils/resource/r.dart';
import 'package:deplug/core/widgets/custom_text_form_fiels.dart';
import 'package:deplug/core/widgets/material_button.dart';
import 'package:deplug/modules/initial/bloc/device_connection_bloc.dart';
import 'package:deplug/modules/initial/view/connect_de_plug_device/connect_device_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WifiNameWidget extends StatelessWidget {
  const WifiNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context);
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 56.h),
          Text(
            tr.connectWifi,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: R.palette.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 36.sp,
                ),
          ),
          SizedBox(height: 12.h),
          Text(
            tr.connectWifiDesc,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: R.palette.disabledColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  letterSpacing: -.5,
                  height: 24.sp / 16.sp,
                ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 40.h),
          CustomTextField(
            textEditingController: TextEditingController(),
            hintText: tr.enterWifiPassword,
            validator: (v) {
              return null;
            },
            suffixIcon: GestureDetector(
              onTap: () {},
              child: Icon(
                CupertinoIcons.eye_slash,
                size: 24.r,
                color: R.palette.white,
              ),
            ),
          ),
          SizedBox(height: 30.h),
          MyButton(
            title: tr.connectWifi,
            onTap: () {
              context.read<ConnectDeviceBloc>().add(ChangeWidgetStepEvent(deviceConnectionEnum: DeviceConnectionEnum.renameDevice));
            },
            borderRadius: 100.r,
            height: 56.h,
            titleColor: R.palette.blackColor,
          )
        ],
      ),
    );
  }
}
