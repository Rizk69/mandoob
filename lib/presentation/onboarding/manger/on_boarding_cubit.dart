import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mandoob/domain/model/on_boarding/on_boarding_model.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:mandoob/presentation/resources/assets_manager.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  final PageController pageController = PageController();
  int currentIndex = 0;
  final List<SliderObject> sliderData = [
    SliderObject(
      LocaleKeys.onBoardingTitle1.tr() + LocaleKeys.mozakrety.tr(),
      LocaleKeys.onBoardingBody1.tr(),
      ImageAssets.onboard1,
    ),
    SliderObject(
      LocaleKeys.onBoardingTitle2.tr(),
      LocaleKeys.onBoardingBody2.tr(),
      ImageAssets.onboard2,
    ),
    SliderObject(
      LocaleKeys.onBoardingTitle3.tr(),
      LocaleKeys.onBoardingBody3.tr(),
      ImageAssets.onboard3,
    ),
    SliderObject(
      LocaleKeys.onBoardingTitle4.tr(),
      LocaleKeys.onBoardingBody4.tr(),
      ImageAssets.onboard4,
    ),
  ];

  OnBoardingCubit() : super(OnBoardingInitial()) {
    emit(OnBoardingLoaded(
      sliderObject: sliderData[currentIndex],
      numOfSlides: sliderData.length,
      currentIndex: currentIndex,
    ));
  }

  void onPageChanged(int index) {
    currentIndex = index;
    emit(OnBoardingLoaded(
      sliderObject: sliderData[currentIndex],
      numOfSlides: sliderData.length,
      currentIndex: currentIndex,
    ));
  }

  void goNext() {
    if (currentIndex < sliderData.length - 1) {
      pageController.animateToPage(currentIndex + 1, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  void goPrevious() {
    if (currentIndex > 0) {
      pageController.animateToPage(currentIndex - 1, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }
}
