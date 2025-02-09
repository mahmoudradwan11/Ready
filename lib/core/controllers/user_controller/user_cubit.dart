import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/core/controllers/user_controller/user_states.dart';
import 'package:ready/core/mangers/routes.dart';
import 'package:ready/core/mangers/values.dart';
import 'package:ready/core/models/user_model.dart';
import 'package:ready/core/network/local/cache_helper.dart';
import 'package:ready/core/network/remote/api_constants.dart';
import 'package:ready/core/network/remote/dio_helper.dart';
import 'package:ready/screens/screens/login.dart';
import 'package:ready/screens/widgets/toast.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitState());
  static UserCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;
  void getUserData(){
    emit(LoadingGetUserDataState());
    DioHelper.postData(url: ApiConstants.profileApi,data:{
      'token':token
    }).then((value){
      userModel = UserModel.fromJson(value.data);
      print(userModel!.user!.name);
      emit(GetUserDataState());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetUserDataState());
    });
  }
   void editProfile(name,phone){
    emit(LoadingGetUserDataState());
     DioHelper.putData(url: ApiConstants.editProfile, data: {
       "token": token,
       "name": name,
       "email": userModel!.user!.email,
       "phone": phone,
       "password":'12345678',
       "gender": 'male',
     }).then((value) {
       userModel = UserModel.fromJson(value.data);
       print(userModel!.user!.name!);
       getUserData();
       emit(EditUserDataState());
     }).catchError((error) {
       print(error.toString());
       emit(ErrorEditUserDataState());
     });
   }
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibility());
  }
  void resetPassword(newPassword){
    emit(ResetPasswordLoadingState());
    DioHelper.postData(url:ApiConstants.forgetPasswordApi, data:{
      "nationalId": nationalId,
      "newPassword": newPassword,
    }).then((value){
      emit(ResetPasswordDone());
      showToast('Reset',ToastStates.SUCCESS);
    }).catchError((error){
      print(error.toString());
      emit(ErrorResetPassword());
    });
  }
  void userLayout(context){

    DioHelper.postData(
      url: ApiConstants.logoutApi,
      data: {"token": token},
    ).then((value) {
      CacheHelper.removeData(key: 'token').then((value) {
        if (value) {
          navigateAndFinishThisScreen(context, LoginScreen());
        }
        emit(UserLogoutState());
      }).catchError((error) {
        print(error.toString());
        emit(UserLogoutFailedState());
      });
    });
  }

}