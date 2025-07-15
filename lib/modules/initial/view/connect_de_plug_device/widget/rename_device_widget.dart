import 'package:deplug/core/di/di.dart';
import 'package:deplug/core/services/l10n/gen_l10n/app_localizations.dart';
import 'package:deplug/core/utils/go_router/routes_constant.dart';
import 'package:deplug/core/utils/go_router/routes_navigation.dart';
import 'package:deplug/core/utils/resource/r.dart';
import 'package:deplug/core/widgets/custom_text_form_fiels.dart';
import 'package:deplug/core/widgets/material_button.dart';
import 'package:deplug/modules/initial/bloc/device_connection_bloc.dart';
import 'package:deplug/modules/initial/bloc/meta_mask_bloc.dart';
import 'package:deplug/modules/initial/usecase/auth/set_token_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RenameDeviceWidget extends StatefulWidget {
  const RenameDeviceWidget({super.key});

  @override
  State<RenameDeviceWidget> createState() => _RenameDeviceWidgetState();
}

class _RenameDeviceWidgetState extends State<RenameDeviceWidget> {
  final SaveTokenUseCase saveTokenUseCase = sl<SaveTokenUseCase>();
  final TextEditingController _renameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context);
    return BlocConsumer<ConnectDeviceBloc, ConnectDeviceState>(listener: (context, state) {
      if (state is AddDeviceSuccessState) {
        sl<Navigation>().push(path: Routes.bottomTab);
      }
    }, builder: (context, state) {
      return SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 56.h),
            Text(
              tr.renameDevice,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: R.palette.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 36.sp,
                  ),
            ),
            SizedBox(height: 12.h),
            Text(
              tr.renameDeviceDesc,
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
              textEditingController: _renameTextController,
              hintText: tr.enterDeviceName,
              onChanged: (v) {
                context.read<ConnectDeviceBloc>().add(UpdateDeviceNameEvent(deviceName: v));
              },
              validator: (v) {
                return null;
              },
            ),
            SizedBox(height: 30.h),
            BlocBuilder<ConnectDeviceBloc, ConnectDeviceState>(
              builder: (context, state) {
                return MyButton(
                  disableButton: state.deviceName.isEmpty,
                  title: tr.saveChanges,
                  loading: state.loading,
                  onTap: () async {
                    if (state.deviceName.isNotEmpty && state.uniqueId!.isNotEmpty) {
                      final metamaskState = context.read<MetamaskBloc>().state;
                      final token = metamaskState.token;
                      await saveTokenUseCase.call(token);
                      context.read<ConnectDeviceBloc>().add(AddDeviceEvent(
                            deviceName: state.deviceName,
                            deviceUniqueId: state.uniqueId ?? '',
                          ));
                    }
                  },
                  borderRadius: 100.r,
                  height: 56.h,
                  titleColor: R.palette.blackColor,
                );
              },
            )
          ],
        ),
      );
    });
  }
}
