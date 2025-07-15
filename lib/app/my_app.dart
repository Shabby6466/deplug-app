import 'package:deplug/core/di/di.dart';
import 'package:deplug/core/services/l10n/gen_l10n/app_localizations.dart';
import 'package:deplug/core/utils/go_router/app_routes.dart';
import 'package:deplug/core/utils/resource/r.dart';
import 'package:deplug/modules/bottom_tab/bloc/bottom_ta_bloc.dart';
import 'package:deplug/modules/dashboard/blocs/home_bloc.dart';
import 'package:deplug/modules/home/bloc/check_in_bloc.dart';
import 'package:deplug/modules/home/usecase/check_in_use_case.dart';
import 'package:deplug/modules/home/usecase/device_total_sold_use_case.dart';
import 'package:deplug/modules/home/usecase/get_attendance_use_case.dart';
import 'package:deplug/modules/initial/bloc/device_connection_bloc.dart';
import 'package:deplug/modules/initial/bloc/meta_mask_bloc.dart';
import 'package:deplug/modules/initial/bloc/phantom_wallet_bloc.dart';
import 'package:deplug/modules/initial/bloc/splash_bloc.dart';
import 'package:deplug/modules/initial/usecase/auth/delete_token_usecase.dart';
import 'package:deplug/modules/initial/usecase/auth/get_token_use_case.dart';
import 'package:deplug/modules/initial/usecase/auth/set_token_use_case.dart';
import 'package:deplug/modules/initial/usecase/auth/validate_address_use_case.dart';
import 'package:deplug/modules/initial/usecase/device/device_power_use_case.dart';
import 'package:deplug/modules/initial/usecase/device/get_all_devices_use_case.dart';
import 'package:deplug/modules/initial/usecase/wallet/connect_meta_mask_usecase.dart';
import 'package:deplug/modules/initial/usecase/wallet/connect_phantom_wallet_usecase.dart';
import 'package:deplug/modules/initial/usecase/wallet/get_phantom_wallet_address_usecase.dart';
import 'package:deplug/modules/initial/usecase/wallet/is_phantom_wallet_connected_usecase.dart';
import 'package:deplug/modules/initial/utils/usecase/get_onboarding_state_use_case.dart';
import 'package:deplug/modules/initial/utils/usecase/update_onboarding_use_case.dart';
import 'package:deplug/modules/missions/usecases/apply_referral_code_usecase.dart';
import 'package:deplug/modules/missions/usecases/get_daily_pledge_stats_usecase.dart';
import 'package:deplug/modules/missions/usecases/get_green_team_stats_usecase.dart';
import 'package:deplug/modules/missions/usecases/get_referral_code_usecase.dart';
import 'package:deplug/modules/missions/usecases/get_total_phantom_watts_usecase.dart';
import 'package:deplug/modules/missions/usecases/submit_phantom_hunt_usecase.dart';
import 'package:deplug/modules/mydevices/usecase/get_device_detail_use_case.dart';
import 'package:deplug/modules/mydevices/usecase/update_device_time_use_case.dart';
import 'package:deplug/modules/mydevices/usecases/add_new_device_usecase.dart';
import 'package:deplug/modules/mydevices/usecases/electric_data_usage_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // setUpNotifications(widget.remoteNotificationsService);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: R.palette.blackColor,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CheckInBloc>(
          create: (context) => CheckInBloc(
            checkInUseCase: sl<CheckInUseCase>(),
            getAttendanceUseCase: sl<GetAttendanceUseCase>(),
          ),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(
            electricDataUsage: sl<ElectricDataUsage>(),
            deviceTotalSoldUseCase: sl<DeviceTotalSoldUseCase>(),
            getAllDevicesUseCase: sl<GetAllDevicesUseCase>(),
            devicePowerUseCase: sl<DevicePowerUseCase>(),
            getDeviceDetailUseCase: sl<GetDeviceDetailUseCase>(),
            updateTimingUseCase: sl<UpdateTimingUseCase>(),
            submitPhantomHuntUsecase: sl<SubmitPhantomHuntUsecase>(),
            getTotalPhantomWattsUseCase: sl<GetTotalPhantomWattsUseCase>(),
            getReferralCodeUseCase: sl<GetReferralCodeUseCase>(),
            getGreenTeamStatsUseCase: sl<GetGreenTeamStatsUseCase>(),
            applyReferralCodeUseCase: sl<ApplyReferralCodeUseCase>(),
            getDailyPledgeUseCase: sl<GetDailyPledgeStatsUseCase>(),
          ),
        ),
        BlocProvider<SplashBloc>(
          create: (context) => SplashBloc(
            getOnBoardingStateUseCase: sl<GetOnBoardingStateUseCase>(),
            updateOnboardingUseCase: sl<UpdateOnboardingUseCase>(),
            getTokenUseCase: sl<GetTokenUseCase>(),
            deleteTokenUseCase: sl<DeleteTokenUseCase>(),
          ),
        ),
        BlocProvider<BottomTabBloc>(
          create: (context) => BottomTabBloc(),
        ),
        BlocProvider<ConnectDeviceBloc>(
          create: (context) => ConnectDeviceBloc(
            addNewDeviceUsecase: sl<AddNewDeviceUsecase>(),
          ),
        ),
        BlocProvider<MetamaskBloc>(
          create: (context) => MetamaskBloc(
            connectMetamaskUsecase: sl<ConnectMetamaskUsecase>(),
            validateAddressUseCase: sl<ValidateAddressUseCase>(),
            saveTokenUseCase: sl<SaveTokenUseCase>(),
          ),
        ),
        BlocProvider<PhantomWalletBloc>(
          create: (context) => PhantomWalletBloc(
            secureStorage: sl<FlutterSecureStorage>(),
            connectPhantomWalletUsecase: sl<ConnectPhantomWalletUsecase>(),
            getPhantomWalletAddressUsecase: sl<GetPhantomWalletAddressUsecase>(),
            isPhantomWalletConnectedUsecase: sl<IsPhantomWalletConnectedUsecase>(),
          ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        useInheritedMediaQuery: true,
        builder: (context, __) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationProvider: AppRouter.router.routeInformationProvider,
          routeInformationParser: AppRouter.router.routeInformationParser,
          routerDelegate: AppRouter.router.routerDelegate,
          title: 'DePlug',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ko'),
          ],
          locale: const Locale('en'),
          theme: AppTheme().lightTheme(),
          themeMode: ThemeMode.light,
          darkTheme: AppTheme().lightTheme(),
        ),
      ),
    );
  }
}
