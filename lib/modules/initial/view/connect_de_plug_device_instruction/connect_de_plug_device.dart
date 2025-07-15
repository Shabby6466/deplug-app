import 'package:deplug/core/di/di.dart';
import 'package:deplug/core/services/l10n/gen_l10n/app_localizations.dart';
import 'package:deplug/core/services/wallet_adapter_service/phantom_wallet_service.dart';
import 'package:deplug/core/utils/go_router/routes_constant.dart';
import 'package:deplug/core/utils/go_router/routes_navigation.dart';
import 'package:deplug/core/utils/resource/r.dart';
import 'package:deplug/core/utils/utitily_methods/utils.dart';
import 'package:deplug/core/widgets/base_widget.dart';
import 'package:deplug/core/widgets/material_button.dart';
import 'package:deplug/modules/dashboard/blocs/home_bloc.dart';
import 'package:deplug/modules/initial/bloc/meta_mask_bloc.dart';
import 'package:deplug/modules/initial/view/widgets/connection_instructions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConnectDePlugDevice extends StatefulWidget {
  const ConnectDePlugDevice({super.key, required this.navigationData});

  final WalletNavigationData navigationData;

  @override
  State<ConnectDePlugDevice> createState() => _ConnectDePlugDeviceState();
}

class _ConnectDePlugDeviceState extends State<ConnectDePlugDevice> {
  bool _isValidateSuccess = false;
  bool _isReferralApplied = false;

  void _tryNavigate(String referralCode) {
    if (referralCode == '') {
      sl<Navigation>().push(path: Routes.connectDeviceIndex);
    } else if (_isValidateSuccess && _isReferralApplied) {
      sl<Navigation>().push(path: Routes.connectDeviceIndex);
    }
  }

  @override
  void initState() {
    final homeState = context.read<HomeBloc>().state;
    super.initState();
    context.read<MetamaskBloc>().add(ValidateAddressEvent(address: widget.navigationData.address));
    if (homeState.deepLinkCapturedReferralCode != '') {
      context.read<HomeBloc>().add(ApplyReferralCodeEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<MetamaskBloc, MetamaskState>(
          listener: (context, state) {
            var homeState = context.read<HomeBloc>().state;
            if (state is ValidateSuccessState) {
              _isValidateSuccess = true;
              _tryNavigate(homeState.deepLinkCapturedReferralCode);
            } else if (state is ValidateErrorState) {
              context.read<MetamaskBloc>().add(ValidateAddressEvent(address: widget.navigationData.address));
            }
          },
        ),
        BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is ApplyReferralCodeSuccess) {
              _isReferralApplied = true;
              _tryNavigate(state.deepLinkCapturedReferralCode);
            }
            if(state is ApplyReferralCodeFailed){
              Utility.showError(context, state.errMsg);
              if(state.errMsg!='Unauthorized') {
                context.read<HomeBloc>().add(ClearReferralCodeEvent());
              }
            }
          },
        ),
      ],
      child: Background(
        topGradient: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80.h),
              SvgPicture.asset(
                R.assets.graphics.svgIcons.connect,
              ),
              SizedBox(height: 19.h),
              Text(
                tr.letsConnect,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 48.sp,
                      fontWeight: FontWeight.w600,
                      color: R.palette.white,
                      letterSpacing: -.9,
                    ),
              ),
              SizedBox(height: 40.h),
              Text(
                tr.howToConnect,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: R.palette.white,
                    ),
              ),
              const ConnectionInstructions(),
              SizedBox(height: 117.h),
              SecondaryButton(
                title: widget.navigationData.address,
                onTap: () {},
                isShowIcon: true,
                height: 56.h,
                assetName: R.assets.graphics.svgIcons.circleCheck,
              ),
              SizedBox(height: 10.h),
              BlocConsumer<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return ReferreBtn(
                      title: state.deepLinkCapturedReferralCode,
                      onTap: () {},
                      isShowIcon: true,
                      height: 56.h,
                      assetName: R.assets.graphics.svgIcons.circleCheck,
                    );
                  },
                  listener: (ctx, state) {}),
              SizedBox(height: 32.h),
              BlocBuilder<MetamaskBloc, MetamaskState>(
                builder: (context, state) {
                  final homeState = context.read<HomeBloc>().state;
                  return MyButton(
                    loading: state.loading,
                    title: tr.startConnection,
                    onTap: () {
                      context.read<MetamaskBloc>().add(ValidateAddressEvent(address: widget.navigationData.address));
                      if (homeState.deepLinkCapturedReferralCode != '') {
                        context.read<HomeBloc>().add(ApplyReferralCodeEvent());
                      }
                    },
                    borderRadius: 100,
                    height: 56.h,
                    titleColor: R.palette.blackColor,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
