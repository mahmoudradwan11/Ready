import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/core/mangers/routes.dart';
import 'package:ready/core/network/local/cache_helper.dart';
import 'package:ready/screens/screens/home.dart';
import 'package:ready/screens/screens/start.dart';

import 'onboarding_states.dart';

class OnboardingCubit extends Cubit<OnBoardingStates> {
  OnboardingCubit() : super(OnBoardingInitState());
  static OnboardingCubit get(context) => BlocProvider.of(context);
  bool isPageLast = false;
  int screenIndex = 0;
  void pageLast(index){
    isPageLast = true;
    screenIndex = index;
    emit(PageLast());
  }

  void pageNotLast(index) {
    isPageLast = false;
    screenIndex = index;
    emit(NotPageLast());
  }

  void printLast() {
    print(isPageLast);
    print(screenIndex);
  }
  void submit(context) {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndFinishThisScreen(context, const StartScreen());
      }
    });
  }
}
