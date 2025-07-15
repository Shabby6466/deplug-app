import 'package:deplug/core/di/di.dart';
import 'package:deplug/core/services/l10n/gen_l10n/app_localizations.dart';
import 'package:deplug/core/services/wallet_adapter_service/meta_mask_service.dart';
import 'package:deplug/core/utils/go_router/routes_constant.dart';
import 'package:deplug/core/utils/go_router/routes_navigation.dart';
import 'package:deplug/core/utils/resource/r.dart';
import 'package:deplug/core/widgets/base_widget.dart';
import 'package:deplug/core/widgets/material_button.dart';
import 'package:deplug/modules/dashboard/blocs/home_bloc.dart';
import 'package:deplug/modules/initial/bloc/meta_mask_bloc.dart';
import 'package:deplug/modules/initial/bloc/phantom_wallet_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reown_appkit/reown_appkit.dart';

class ConnectWalletIndex extends StatefulWidget {
  final String referralCode;

  const ConnectWalletIndex({super.key, required this.referralCode});

  @override
  State<ConnectWalletIndex> createState() => _ConnectWalletIndexState();
}

class _ConnectWalletIndexState extends State<ConnectWalletIndex> {
  final includedWalletIds = <String>{
    'c57ca95b47569778a828d19178114f4db188b89b763c899ba0be274e97267d96',
  };
  final excludedWalletIds = <String>{
    'fd20dc426fb37566d803205b19bbc1d4096b248ac04548e3cfb6b3a38bd033aa',
  };

  @override
  void initState() {
    debugPrint('deeplink capture link -> ${widget.referralCode}');
    context.read<PhantomWalletBloc>().add(RestoreSessionEvent());
    context.read<HomeBloc>().add(CaptureDeepLinkReferralCode(
          deepLinkCode: widget.referralCode,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<MetamaskBloc, MetamaskState>(listener: (context, state) async {
          final metaMaskService = sl<MetaMaskService>();

          await metaMaskService.init(
            context,
            projectId: '9201308b7ab0dd7bf5a78831a6b8c369',
            metadata: PairingMetadata(
              name: 'Deplug',
              description: 'Deplug is a decentralized energy management application',
              url: 'https://deplug.io/',
              icons: [R.assets.graphics.pngIcons.AppIcon],
              redirect: const Redirect(
                native: 'deplug://',
                universal: 'https://deplug.io/app',
                linkMode: false,
              ),
            ),
          );
        }),
        BlocListener<PhantomWalletBloc, PhantomWalletState>(
          listener: (context, state) {
            if (state.connectionStatus == WalletConnectionStatus.failed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.errMsg}')),
              );
            }
          },
        ),
      ],
      child: Background(
        topGradient: true,
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.w),
            child: Column(
              children: [
                SizedBox(height: 56.h),
                Center(
                  child: SvgPicture.asset(
                    R.assets.graphics.svgIcons.deplugGreenLogo,
                    height: 24.h,
                  ),
                ),
                SizedBox(height: 140.h),
                Center(
                  child: Text(
                    tr.connectYourWallet,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 28.sp,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 39.h),
                BlocBuilder<MetamaskBloc, MetamaskState>(
                  builder: (context, state) {
                    return SecondaryButton(
                      title: tr.metaMask,
                      onTap: () {
                        context.read<MetamaskBloc>().add(ConnectMetamaskEvent(context));
                      },
                      isShowIcon: true,
                      loading: state.loading,
                      assetName: R.assets.graphics.svgIcons.metamaskIcon,
                    );
                  },
                ),
                SizedBox(height: 24.h),
                BlocBuilder<PhantomWalletBloc, PhantomWalletState>(
                  builder: (context, state) {
                    if (state.loading) {
                      return const CircularProgressIndicator();
                    } else if (state.connectionStatus == WalletConnectionStatus.connected) {
                      return Text(
                        'Connected',
                        style: Theme.of(context).textTheme.displaySmall,
                      );
                    } else if (state.connectionStatus == WalletConnectionStatus.failed) {
                      return Text(
                        'Error: ${state.errMsg}',
                        style: Theme.of(context).textTheme.displaySmall,
                      );
                    }
                    return SecondaryButton(
                      title: tr.phantom,
                      onTap: () {
                        context.read<PhantomWalletBloc>().add(ConnectPhantomWalletEvent());
                      },
                      loading: state.loading,
                      isShowIcon: true,
                      assetName: R.assets.graphics.svgIcons.phantomIcon,
                    );
                  },
                ),
                SizedBox(height: 65.h),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1.h,
                        decoration: BoxDecoration(color: R.palette.disabledColor),
                      ),
                    ),
                    SizedBox(width: 9.w),
                    Text(
                      tr.deplugDevices,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                    ),
                    SizedBox(width: 9.w),
                    Expanded(
                      child: Container(
                        height: 1.h,
                        decoration: BoxDecoration(color: R.palette.disabledColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 39.h),
                MyButton(
                  title: tr.buyNow,
                  titleColor: R.palette.blackColor,
                  borderRadius: 100.r,
                  height: 56,
                  onTap: () {
                    // context.read<MetamaskBloc>().add(ValidateAddressEvent(address: '7pvnuNnZem7eqY9vzPRN6exRjoX4iRVtX4VRB4qMqqP5'))
                    // sl<Navigation>().push(path: Routes.connectDePlugDevice);
                  },
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            sl<Navigation>().push(path: Routes.connectDePlugDevice);
                          },
                        text: '${tr.iAgreeToDeplug} ',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: R.palette.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              height: 16.sp / 12.sp,
                            ),
                        children: [
                          TextSpan(
                            text: tr.privacyPolicy,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  color: R.palette.secText,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  decorationColor: R.palette.secText,
                                  height: 16.sp / 12.sp,
                                ),
                          ),
                          TextSpan(
                            text: ' ${tr.and} ',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  color: R.palette.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 16.sp / 12.sp,
                                ),
                          ),
                          TextSpan(
                            text: tr.termsOfService,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  color: R.palette.secText,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  decorationColor: R.palette.secText,
                                  height: 16.sp / 12.sp,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 46.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum WalletConnectionStatus {
  disconnected,
  connecting,
  connected,
  failed,
}
