import 'package:deplug/core/utils/go_router/routes_constant.dart';
import 'package:deplug/modules/initial/bloc/splash_bloc.dart';
import 'package:deplug/modules/initial/view/widgets/onboarding_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:deplug/core/services/l10n/gen_l10n/app_localizations.dart';
import 'package:deplug/core/utils/resource/r.dart';
import 'package:deplug/core/widgets/material_button.dart';
import 'package:deplug/core/di/di.dart';
import 'package:deplug/core/utils/go_router/routes_navigation.dart';
import 'package:deplug/modules/initial/view/widgets/dots_indicator.dart';
import 'package:deplug/modules/initial/view/widgets/onboarding_background.dart';

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({super.key});

  @override
  State<OnboardingPages> createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late List<Map<String, String>> slides;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var localization = AppLocalizations.of(context);
    slides = [
      {
        'title': localization.decentralized_energy,
        'description': localization.lorem_ipsum,
      },
      {
        'title': localization.decentralized_energy,
        'description': localization.lorem_ipsum,
      },
      {
        'title': localization.decentralized_energy,
        'description': localization.lorem_ipsum,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is OnboardingUpdatedState) {
          sl<Navigation>().go(Routes.connectWalletIndex);
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: const Key('onboarding'),
          backgroundColor: R.palette.blackColor,
          body: Stack(
            children: [
              const OnboardingBackground(),
              Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: slides.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return OnboardingSlide(
                          title: slides[index]['title']!,
                          description: slides[index]['description']!,
                        );
                      },
                    ),
                  ),
                  DotsIndicator(
                    currentPage: _currentPage,
                    pageCount: slides.length,
                  ),
                  SizedBox(height: 56.h),
                  MyButton(
                    horizontalMargin: 24,
                    bottomMargin: 29,
                    title: _currentPage == slides.length - 1 ? localization.getStarted : localization.next,
                    onTap: () => navigateToNextPage(),
                    borderRadius: 0,
                    titleColor: R.palette.blackColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 72.h),
                    child: GestureDetector(
                      onTap: () {
                        context.read<SplashBloc>().add(UpdateOnboardingEvent());
                      },
                      child: Text(
                        localization.skip,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: R.palette.disabledbtnColor,
                              height: 19.09.sp / 16.sp,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void navigateToNextPage() {
    if (_currentPage == slides.length - 1) {
      // sl<Navigation>().go(Routes.connectWalletIndex);
      context.read<SplashBloc>().add(UpdateOnboardingEvent());
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
