import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/core/controllers/onboarding_controller/onboarding_cubit.dart';
import 'package:ready/core/controllers/onboarding_controller/onboarding_states.dart';
import 'package:ready/core/mangers/colors.dart';
import 'package:ready/core/mangers/lists.dart';
import 'package:ready/core/mangers/values.dart';
import 'package:ready/screens/widgets/button.dart';
import 'package:ready/screens/widgets/onboarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnBoardingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var boardController = PageController();
          var cubit = OnboardingCubit.get(context);
          return Scaffold(
            backgroundColor: AppColors.defaultColor,
            appBar: AppBar(
                backgroundColor: AppColors.defaultColor,
                title: TextButton(
                    onPressed: () {
                      cubit.submit(context);
                    },
                    child: Text(
                      'SKIP',
                      style: TextStyle(color: AppColors.greyColor),
                    ))),
            body: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 300,
                    child: PageView.builder(
                      onPageChanged: (int index) {
                        if (index == onBoardingImages.length - 1) {
                          cubit.pageLast(index);
                          cubit.printLast();
                        } else {
                          cubit.pageNotLast(index);
                          cubit.printLast();
                        }
                      },
                      physics: const BouncingScrollPhysics(),
                      controller: boardController,
                      itemBuilder: (context, index) =>
                          buildOnBoardingImage(onBoardingImages[index]),
                      itemCount: onboarding.length,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SmoothPageIndicator(
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey[300]!,
                        activeDotColor: AppColors.whiteColor,
                        dotHeight: 10,
                        dotWidth: 10,
                        expansionFactor: 3,
                        spacing: 5.0,
                      ),
                      controller: boardController,
                      count: onboarding.length),
                  Container(
                    height: 200,
                    child: PageView.builder(
                      onPageChanged: (int index) {
                        if (index == onboarding.length - 1) {
                          cubit.pageLast(index);
                          cubit.printLast();
                        } else {
                          cubit.pageNotLast(index);
                          cubit.printLast();
                        }
                      },
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildOnBoardingItem(onboarding[index]),
                      itemCount: onboarding.length,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 40, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                            onPressed: () {
                              boardController.previousPage(
                                  duration: const Duration(
                                    milliseconds: 750,
                                  ),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            },
                            child: Text(
                              'BACK',
                              style: TextStyle(
                                  fontSize: AppFontSize.fontSize15,
                                  color: cubit.screenIndex == 0
                                      ? Colors.transparent
                                      : Colors.grey),
                            )),
                        DefaultButton(
                          backgroundColor: AppColors.thirdColor,
                          buttonWidget: cubit.screenIndex == 2
                              ? Text(
                                  'GET STARTED',
                                  style: TextStyle(color: AppColors.whiteColor),
                                )
                              : Text('NEXT',
                                  style:
                                      TextStyle(color: AppColors.whiteColor)),
                          function: () {
                            cubit.screenIndex == 2
                                ? cubit.submit(context)
                                : boardController.nextPage(
                                    duration: const Duration(
                                      milliseconds: 750,
                                    ),
                                    curve: Curves.fastLinearToSlowEaseIn);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
