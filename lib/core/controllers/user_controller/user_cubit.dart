import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/core/controllers/user_controller/user_states.dart';
import 'package:ready/core/mangers/values.dart';
import 'package:ready/core/models/user_model.dart';
import 'package:ready/core/network/remote/api_constants.dart';
import 'package:ready/core/network/remote/dio_helper.dart';

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
  
}