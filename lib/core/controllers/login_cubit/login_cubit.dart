import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/core/controllers/login_cubit/login_states.dart';
import 'package:ready/core/mangers/string.dart';
import 'package:ready/core/models/user_model.dart';
import 'package:ready/core/network/remote/api_constants.dart';
import 'package:ready/core/network/remote/dio_helper.dart';
import 'package:ready/screens/widgets/toast.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);
  UserModel? loginModel;
  bool isBottonEnable = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  IconData suffixIcon = Icons.visibility;
  bool passwordShow = true;

  void loginUser({required String email, required String password}) {
    emit(LoadingLogin());
    DioHelper.postData(
        url: ApiConstants.loginApi,
        data: {"email": email, "password": password}).then((value) {
      loginModel = UserModel.fromJson(value.data);
      if (loginModel!.message != AppString.loginMassage) {
        showToast(loginModel!.message!, ToastStates.ERROR);
      }
      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      print(error);
      emit(LoginFailedState(error.toString()));
    });
  }

  void changePasswordIcon() {
    passwordShow = !passwordShow;
    suffixIcon =
        passwordShow ? Icons.visibility : Icons.visibility_off_outlined;
    emit(ChangePasswordVisState());
  }

  void _enableBotton() {
    isBottonEnable =
        emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    emit(EnableBottonState());
  }

  void checkLoginBotton() {
    emailController.addListener(_enableBotton);
    passwordController.addListener(_enableBotton);
  }
}
