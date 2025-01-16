import 'package:ready/core/models/user_model.dart';
abstract class RegisterStates{}
class RegisterInitState extends RegisterStates{}
class ImageChoose extends RegisterStates{}
class CheckValid extends RegisterStates{}
class EnableBottonState extends RegisterStates{}
class LoadingUserRegister extends RegisterStates{}
class UserRegisterSuccessfully extends RegisterStates{
  final UserModel userModel;
  UserRegisterSuccessfully(this.userModel);
}
class UserFailedRegister extends RegisterStates{}
class RegisterChangePasswordVisibility extends RegisterStates{}

