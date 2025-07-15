
import 'package:deplug/core/utils/go_router/routes_constant.dart';
import 'package:deplug/core/utils/go_router/routes_navigation.dart';
import 'package:deplug/modules/initial/view/connect_de_plug_device/connect_device_index.dart';
import 'package:deplug/modules/initial/view/connect_wallet/connect_wallet_index.dart';
import 'package:deplug/modules/initial/view/splash/splash_index.dart';
import 'package:deplug/modules/initial/view/onboarding/oboarding_pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        name: Routes.splash,
        path: Routes.splash,
        builder: (context, state) => const Splash(),
      ),
    
      GoRoute(
        name: Routes.onboardingPages,
        path: Routes.onboardingPages,
        builder: (context, state) => const OnboardingPages(),
      ),
      GoRoute(
        name: Routes.connectWalletIndex,
        path: Routes.connectWalletIndex,
        builder: (context, state) => const ConnectWalletIndex(referralCode: ''),
      ),
      
      GoRoute(
        name: Routes.connectDeviceIndex,
        path: Routes.connectDeviceIndex,
        builder: (context, state) => const ConnectDeviceIndex(),
      ),
  
     
      // GoRoute(
      //   name: 'invite',
      //   path: '/invite/:referralCode',
      //   pageBuilder: (context, state) {
      //     final code = state.pathParameters['referralCode']!;
      //     return Utility.fadeTransitionPage(
      //       ConnectWalletIndex(
      //         referralCode: code,
      //       ),
      //     );
      //   },
      // ),
    ],
    observers: [
      NavigationObserver(),
    ],
  );

  static GoRouter get router => _router;
}
