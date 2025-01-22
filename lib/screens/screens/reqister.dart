import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ready/core/controllers/register_cubit/register_cubit.dart';
import 'package:ready/core/controllers/register_cubit/register_states.dart';
import 'package:ready/core/mangers/colors.dart';
import 'package:ready/core/mangers/images_manger.dart';
import 'package:ready/core/mangers/reg_exp.dart';
import 'package:ready/core/mangers/routes.dart';
import 'package:ready/core/mangers/string.dart';
import 'package:ready/core/mangers/values.dart';
import 'package:ready/core/network/local/cache_helper.dart';
import 'package:ready/screens/widgets/button.dart';
import 'package:ready/screens/widgets/devider.dart';
import 'package:ready/screens/widgets/text_form_feild.dart';
import 'package:ready/screens/widgets/toast.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
      if (state is UserRegisterSuccessfully) {
        if (state.userModel.status == "success") {
          print(state.userModel.message);
          showToast(state.userModel.message!, ToastStates.SUCCESS);
          print(state.userModel.user!.token);
          CacheHelper.saveData(
                  key: 'userId', value: state.userModel.user!.nationalId)
              .then((value) {
            nationalId = state.userModel.user!.nationalId;
          });
          CacheHelper.saveData(
            key: 'token',
            value: state.userModel.user!.token,
          ).then((value) {
            token = state.userModel.user!.token!;
          });
          navigateAndFinishThisScreen(context,Routes.homeRoute);
        } else {
          print(state.userModel.message);
        }
      }
    }, builder: (context, state) {
      var cubit = RegisterCubit.get(context);
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
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Register',
                              style: TextStyle(
                                color:AppColors.whiteColor,
                                fontWeight: AppFontWeight.font600,
                                fontSize: AppFontSize.fontSize40,
                                fontFamily: 'Lato',
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Let\'s Start Our Future',
                              style: TextStyle(
                                color: AppColors.greyColor,
                                fontWeight:AppFontWeight.font200,
                                fontSize: AppFontSize.fontSize20,
                                fontFamily: 'Lato',
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: cubit.image == null
                              ? MaterialButton(
                                  onPressed: () {
                                    cubit.addImage();
                                  },
                                  child: CircleAvatar(
                                      radius: 30,
                                      child: ClipOval(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  AppImages.userNotImage),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      )))
                              : CircleAvatar(
                                  radius: 30,
                                  child: ClipOval(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: FileImage(cubit.image!),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                    SizedBox(height: 70),
                    Text(
                      'Name',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: AppFontSize.fontSize16),
                    ),
                    SizedBox(height: 5),
                    DefaultFieldForm(
                      prefix: Icons.person,
                      controller: cubit.nameController,
                      keyboard: TextInputType.text,
                      valid: (value) {},
                      hint: 'Enter your Name',
                      hintStyle: TextStyle(color:AppColors.fieldColor,),
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
                      keyboard: TextInputType.visiblePassword,
                      valid: (value) {},
                      prefix: Icons.password,
                      show: cubit.isPassword,
                      suffix: cubit.suffix,
                      suffixPress: () {
                        cubit.changePasswordVisibility();
                      },
                      hint: 'Enter your Password',
                      hintStyle: TextStyle( color: AppColors.fieldColor),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Confirm Password',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: AppFontSize.fontSize16),
                    ),
                    SizedBox(height: 5),
                    DefaultFieldForm(
                      controller: cubit.confirmController,
                      keyboard: TextInputType.visiblePassword,
                      valid: (value) {},
                      prefix: Icons.password,
                      show: cubit.isPassword,
                      suffix: cubit.suffix,
                      suffixPress: () {
                        cubit.changePasswordVisibility();
                      },
                      hint: 'Confirm your Password',
                      hintStyle: TextStyle( color: AppColors.fieldColor,),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Email',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: AppFontSize.fontSize16),
                    ),
                    SizedBox(height: 5),
                    DefaultFieldForm(
                      controller: cubit.emailController,
                      keyboard: TextInputType.emailAddress,
                      valid: (value) {},
                      prefix: Icons.email,
                      hint: 'Enter your Email',
                      hintStyle: TextStyle( color: AppColors.fieldColor,),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Phone',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: AppFontSize.fontSize16),
                    ),
                    SizedBox(height: 5),
                    DefaultFieldForm(
                      controller: cubit.phoneController,
                      keyboard: TextInputType.phone,
                      valid: (value) {},
                      prefix: Icons.phone,
                      hint: 'Enter your Phone',
                      hintStyle: TextStyle( color: AppColors.fieldColor,),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'National Id',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: AppFontSize.fontSize16),
                    ),
                    SizedBox(height: 5),
                    DefaultFieldForm(
                      controller: cubit.nationalController,
                      keyboard: TextInputType.number,
                      valid: (value) {},
                      prefix: Icons.comment_bank_rounded,
                      hint: 'Enter your National',
                      hintStyle: TextStyle(color: AppColors.fieldColor,),
                    ),
                    SizedBox(height: 60),
                    state is LoadingUserRegister
                        ? Center(
                            child: LoadingAnimationWidget.inkDrop(
                              color:AppColors.primeColor,
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
                            buttonWidget:  Text(
                              'Register',
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                            function: () {
                              if (formKey.currentState!.validate()) {
                                if (cubit.passwordController.text ==
                                    cubit.confirmController.text) {
                                  if (Exp.isEmailValid(
                                      cubit.emailController.text)) {
                                    if (Exp.isPhoneValid(
                                        cubit.phoneController.text)) {
                                      cubit.userRegister(
                                        email: cubit.emailController.text,
                                        name: cubit.nameController.text,
                                        phone: cubit.phoneController.text,
                                        password: cubit.passwordController.text,
                                        nationalID:
                                            cubit.nationalController.text,
                                      );
                                    } else {
                                      showToast(
                                          'Please Enter Valid Phone Number',
                                          ToastStates.WARNING);
                                    }
                                  } else {
                                    showToast('Please Enter Valid Email',
                                        ToastStates.WARNING);
                                  }
                                } else {
                                  showToast('Please Confirm Your Password',
                                      ToastStates.WARNING);
                                }
                              } else {
                                showToast('Please Confirm Policy',
                                    ToastStates.WARNING);
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
                        /*
                        cubit.userRegister(
                          name: name,
                            phone: phone,
                            email: email,
                            nationalID: nationalID,
                            password: password,

                         */
                      },
                      width: double.infinity,
                      backgroundColor: Colors.transparent,
                      borderColor:AppColors.primeColor,
                      buttonWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.google,
                              color:AppColors.thirdColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppString.google,
                              style: TextStyle(color:AppColors.whiteColor),
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
                              style: TextStyle(color:AppColors.whiteColor),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(color:AppColors.greyColor),
                          ),
                          MaterialButton(
                              onPressed: () {
                                  navigateAndReplace(context, Routes.loginRoute);
                              },
                              child: Text(
                                AppString.login,
                                style: TextStyle(color:AppColors.whiteColor),
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
