part of 'on_boarding_cubit.dart';

@immutable
abstract class OnBoardingState {}

class OnBoardingInitial extends OnBoardingState {}

class OnBoardingLoaded extends OnBoardingState {
  final SliderObject sliderObject;
  final int numOfSlides;
  final int currentIndex;

  OnBoardingLoaded({required this.sliderObject,required this.numOfSlides,required this.currentIndex});
}

class OnBoardingLastViewedState extends OnBoardingState {}