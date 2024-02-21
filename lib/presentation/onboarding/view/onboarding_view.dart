import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mandoob/app/app_prefs.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:mandoob/presentation/onboarding/manger/on_boarding_cubit.dart';
import 'package:mandoob/presentation/resources/color_manager.dart';
import 'package:mandoob/presentation/resources/routes_manager.dart';
import 'package:mandoob/presentation/resources/styles_manager.dart';
import 'package:mandoob/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../domain/model/on_boarding/on_boarding_model.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});


  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind(){
    _appPreferences.setOnBoardingViewed();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {
          if (state is OnBoardingLastViewedState) {
            Navigator.pushReplacementNamed(context, Routes.loginRoute);
          }
        },
        builder: (context, state) {
          if (state is OnBoardingLoaded) {
            return _getContentWidget(context, state);
          }
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }

  Widget _getContentWidget(BuildContext context, OnBoardingLoaded state) {
    final cubit = context.read<OnBoardingCubit>();
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorManager.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: AppSize.s10.h,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: AppPadding.p2.h,
                      left: AppPadding.p2.h,
                      top: AppPadding.p2.h,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.loginRoute,
                          );
                        },
                        child: Text(
                          LocaleKeys.skip.tr(),
                          style: getRegularSegoeStyle(
                            color: ColorManager.darkGrey2,
                            fontSize: AppSize.s16.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSize.s82.h,
                  child: PageView.builder(
                    itemCount: state.numOfSlides,
                    controller: cubit.pageController,
                    onPageChanged: (index) => cubit.onPageChanged(index),
                    itemBuilder: (context, index) => OnBoardingPage(
                      state.sliderObject,
                      state.currentIndex,
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s2.h),
                SmoothPageIndicator(
                  controller: cubit.pageController,
                  count: state.numOfSlides,
                  effect: ExpandingDotsEffect(
                    dotHeight: AppSize.s10,
                    dotWidth: AppSize.s18,
                    activeDotColor: ColorManager.blueAccent,
                    dotColor: ColorManager.lightGrey,
                  ),
                ),
                SizedBox(height: AppSize.s4.h),
                Padding(
                  padding: EdgeInsets.all(AppPadding.p3.pt),
                  child: state.currentIndex == 0
                      ? SizedBox(
                          width: AppSize.s80.w,
                          height: AppSize.s6.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorManager.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s2.h),
                              ),
                            ),
                            onPressed: () {
                              if (state.currentIndex == state.numOfSlides - 1) {
                                Navigator.pushReplacementNamed(
                                    context, Routes.loginRoute);
                              } else {
                                cubit.goNext();
                              }
                            },
                            child: Text(
                              LocaleKeys.start.tr(),
                              style: getBoldOxygenStyle(
                                color: ColorManager.white,
                                fontSize: AppSize.s18.sp,
                              ),
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (state.currentIndex != 0)
                              SizedBox(
                                width: AppSize.s40.w,
                                height: AppSize.s6.h,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorManager.blueAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(AppSize.s1_5.h),
                                    ),
                                  ),
                                  onPressed: () => cubit.goPrevious(),
                                  child: Row(
                                    children: [
                                      Expanded(child: Icon(Icons.arrow_back_ios,color: ColorManager.white,)),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          LocaleKeys.previous.tr(),
                                          style: getBoldOxygenStyle(
                                            color: ColorManager.white,
                                            fontSize: AppSize.s18.sp,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            SizedBox(
                              width: AppSize.s40.w,
                              height: AppSize.s6.h,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorManager.blueAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(AppSize.s1_5.h),
                                  ),
                                ),
                                onPressed: () {
                                  if (state.currentIndex ==
                                      state.numOfSlides - 1) {
                                    Navigator.pushReplacementNamed(
                                        context, Routes.loginRoute);
                                  } else {
                                    cubit.goNext();
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        state.currentIndex == state.numOfSlides - 1
                                            ? LocaleKeys.start.tr()
                                            : LocaleKeys.next.tr(),
                                        style: getBoldOxygenStyle(
                                          color: ColorManager.white,
                                          fontSize: AppSize.s18.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                     Expanded(child: Icon(Icons.arrow_forward_ios,color: ColorManager.white,)),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject sliderObject;
  final int currentIndex;

  const OnBoardingPage(this.sliderObject, this.currentIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(sliderObject.image),
        Text(
          sliderObject.title,
          style: getRegularSegoeStyle(
            color: ColorManager.black,
            fontSize: AppSize.s20.sp,
          ),
        ),
        Text(
          sliderObject.subTitle,
          textAlign: TextAlign.center,
          style: getRegularSegoeStyle(
            color: ColorManager.warmGrey,
            fontSize: AppSize.s16.sp,
          ),
        ),
      ],
    );
  }
}
