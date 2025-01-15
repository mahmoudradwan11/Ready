import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ready/core/controllers/login_cubit/login_cubit.dart';
import 'package:ready/core/controllers/login_cubit/login_states.dart';
import 'package:ready/core/mangers/colors.dart';
import 'package:ready/core/mangers/reg_exp.dart';
import 'package:ready/core/mangers/values.dart';
import 'package:ready/core/network/local/cache_helper.dart';
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
        } else {
          print(state.model.message);
        }
      }
    }, builder: (context, state) {
      LoginCubit cubit = LoginCubit.get(context);
      return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(top: 122, left: 20,right: 20),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: AppFontSize.fontSize40,
                        fontFamily: 'Lato',
                      ),
                    ),
                    SizedBox(height: 100),
                    Text(
                      'Username',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppFontSize.fontSize16),
                    ),
                    SizedBox(height: 5),
                    DefaultFieldForm(
                      prefix: Icons.person,
                      controller: cubit.emailController,
                      keyboard: TextInputType.emailAddress,
                      valid: (value) {},
                      hint: 'Enter your Username',
                      hintStyle: TextStyle(color: HexColor('535353')),
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Password',
                      style: TextStyle(
                          color: Colors.white,
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
                      hintStyle: TextStyle(color: HexColor('535353')),
                    ),
                    SizedBox(height: 70),
                    state is LoadingLogin
                        ? LoadingAnimationWidget.inkDrop(
                            color: AppColors.defaultColor,
                            size: 20,
                          )
                        : DefaultButton(
                            width: double.infinity,
                            backgroundColor: cubit.isBottonEnable
                                ? HexColor('8687E7')
                                : HexColor('8687C7')
                                    .withValues(blue: 0.5, green: 0.5),
                            borderColor: Colors.transparent,
                            buttonWidget: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                            function: () {
                              if (formKey.currentState!.validate()) {
                                if (Exp.isEmailValid(
                                    cubit.emailController.text)) {
                                  /*
                                  cubit.loginUser(
                                    email: cubit.emailController.text,
                                    password: cubit.passwordController.text,
                                  );

                                   */
                                } else {
                                  showToast('Please Enter Valid Email',
                                      ToastStates.WARNING);
                                }
                              }
                            }),
                           SizedBox(height: 20,),
                           Padding(
                             padding: const EdgeInsets.all(3.0),
                             child: dividerWithText('OR'),
                           )
                  ]),
            ),
          ),
        ),
      );
    });
  }
}
