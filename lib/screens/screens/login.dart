import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ready/core/controllers/login_cubit/login_cubit.dart';
import 'package:ready/core/controllers/login_cubit/login_states.dart';
import 'package:ready/core/mangers/colors.dart';
import 'package:ready/core/mangers/reg_exp.dart';
import 'package:ready/core/mangers/routes.dart';
import 'package:ready/core/mangers/string.dart';
import 'package:ready/core/mangers/values.dart';
import 'package:ready/core/network/local/cache_helper.dart';
import 'package:ready/screens/screens/home.dart';
import 'package:ready/screens/widgets/button.dart';
import 'package:ready/screens/widgets/devider.dart';
import 'package:ready/screens/widgets/text_form_feild.dart';
import 'package:ready/screens/widgets/toast.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoginSuccessState) {
        if (state.model.status == "success") {
          print(state.model.message);
          print(state.model.user!.token);
          CacheHelper.saveData(
                  key: 'userId', value: state.model.user!.nationalId)
              .then((value) {
            nationalId = state.model.user!.nationalId;
          });
          CacheHelper.saveData(key: 'token', value: state.model.user!.token)
              .then((value) {
            token = state.model.user!.token;
            showToast('${state.model.message}', ToastStates.SUCCESS);
          });
          navigateAndFinishThisScreen(context,HomeScreen());
        } else {
          print(state.model.message);
        }
      }
    }, builder: (context, state) {
      LoginCubit cubit = LoginCubit.get(context);
      return Scaffold(
        backgroundColor: AppColors.defaultColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 122, left: 20, right: 20),
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.login,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: AppFontWeight.font600,
                        fontSize: AppFontSize.fontSize40,
                        fontFamily: 'Lato',
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      AppString.loginTitle,
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontWeight: AppFontWeight.font200,
                        fontSize: AppFontSize.fontSize20,
                        fontFamily: 'Lato',
                      ),
                    ),
                    SizedBox(height: 70),
                    Text(
                      'Username',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: AppFontSize.fontSize16),
                    ),
                    SizedBox(height: 5),
                    DefaultFieldForm(
                      prefix: Icons.person,
                      controller: cubit.emailController,
                      keyboard: TextInputType.emailAddress,
                      valid: (value) {},
                      hint: 'Enter your Username',
                      hintStyle: TextStyle(color: AppColors.fieldColor),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Password',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: AppFontSize.fontSize16),
                    ),
                    SizedBox(height: 5),
                    DefaultFieldForm(
                      controller: cubit.passwordController,
                      keyboard: TextInputType.emailAddress,
                      valid: (value) {},
                      prefix: Icons.password,
                      show: cubit.passwordShow,
                      suffix: cubit.suffixIcon,
                      suffixPress: () {
                        cubit.changePasswordIcon();
                      },
                      hint: 'Enter your Password',
                      hintStyle: TextStyle(color: AppColors.fieldColor),
                    ),
                    SizedBox(height: 60),
                    state is LoadingLogin
                        ? Center(
                            child: LoadingAnimationWidget.inkDrop(
                              color: AppColors.primeColor,
                              size: 20,
                            ),
                          )
                        : DefaultButton(
                            width: double.infinity,
                            backgroundColor: cubit.isBottonEnable
                                ? AppColors.primeColor
                                : AppColors.secColor
                                    .withValues(blue: 0.5, green: 0.5),
                            borderColor: Colors.transparent,
                            buttonWidget: Text(
                              AppString.login,
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                            function: () {
                              if (formKey.currentState!.validate()) {
                                if (Exp.isEmailValid(
                                    cubit.emailController.text)) {
                                  cubit.loginUser(
                                    email: cubit.emailController.text,
                                    password: cubit.passwordController.text,
                                  );
                                } else {
                                  showToast('Please Enter Valid Email',
                                      ToastStates.WARNING);
                                }
                              }
                            }),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: dividerWithText('OR'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DefaultButton(
                      function: () {
                        cubit.loginUser(
                          email: 'mahmoud.radwan.pc@gamil.com',
                          password: 'Fatma Ameen',
                        );
                      },
                      width: double.infinity,
                      backgroundColor: Colors.transparent,
                      borderColor: AppColors.primeColor,
                      buttonWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.google,
                              color: AppColors.thirdColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppString.google,
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DefaultButton(
                      function: () {},
                      width: double.infinity,
                      backgroundColor: Colors.transparent,
                      borderColor: AppColors.primeColor,
                      buttonWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.apple,
                              color: AppColors.thirdColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppString.apple,
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Text(
                            AppString.loginScreenRedirect,
                            style: TextStyle(color: AppColors.greyColor),
                          ),
                          MaterialButton(
                              onPressed: () {
                                navigateAndReplace(
                                    context, Routes.registerRoute);
                              },
                              child: Text(
                                AppString.register,
                                style: TextStyle(color: AppColors.whiteColor),
                              ))
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      );
    });
  }
}
