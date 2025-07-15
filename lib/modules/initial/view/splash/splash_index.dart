import 'package:deplug/core/di/di.dart';
import 'package:deplug/core/services/wallet_adapter_service/phantom_wallet_service.dart';
import 'package:deplug/core/utils/go_router/routes_constant.dart';
import 'package:deplug/core/utils/go_router/routes_navigation.dart';
import 'package:deplug/core/utils/resource/r.dart';
import 'package:deplug/core/widgets/base_widget.dart';
import 'package:deplug/modules/dashboard/blocs/home_bloc.dart';
import 'package:deplug/modules/initial/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(GetOnboardingEvent());
    sl<PhantomWalletService>().handleDeepLinks();
  }

  void handleState(SplashState state) {
    if (!fromDeepLink) {
      if (state is TokenFoundState) {
        // Future.delayed(const Duration(seconds: 3), () {
        //   context.read<CheckInBloc>().add(
        //     GetAttendanceEvent(
        //       month: DateTime.now().month,
        //       year: DateTime.now().year,
        //     ),
        //   );
        // });
      }

      if (state is TokenNotFoundState) {
        Future.delayed(const Duration(seconds: 3), () {
          sl<Navigation>().go(Routes.connectWalletIndex);
        });
      }

      if (state is SkipOnboardingState) {
        context.read<SplashBloc>().add(GetTokenEvent());
      }

      if (state is ShowOnboardingState) {
        Future.delayed(const Duration(seconds: 3), () {
          sl<Navigation>().go(Routes.onboardingPages);
        });
      }

      // if (state is GetAttendanceSuccessState) {
      //   final today = DateTime.now();
      //   var checkInState = context.read<CheckInBloc>().state;
      //   final attendanceToday = checkInState.attendanceOutput.data.any(
      //         (entry) => DateUtils.isSameDay(DateTime.parse(entry.date), today),
      //   );

        // Future.delayed(const Duration(seconds: 1), () {
        //   if (attendanceToday) {
            sl<Navigation>().go(Routes.bottomTab);
        //   } else {
        //     sl<Navigation>().go(Routes.checkIn);
        //   }
        // });

        // Also trigger home bloc stats
        context.read<HomeBloc>().add(PhantomHuntStatsEvent());
        context.read<HomeBloc>().add(GreenTeamStatsEvent());
        context.read<HomeBloc>().add(GetDailyPledgeStatsEvent());
      }
    }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) => handleState(state),
      builder: (context, state) {
        return Background(
          key: const Key('Background'),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 59.h),
                SvgPicture.asset(
                  R.assets.graphics.svgIcons.starredLogo,
                  height: 590.h,
                  width: 289.w,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
