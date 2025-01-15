import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/core/controllers/login_cubit/login_cubit.dart';
import 'package:ready/core/controllers/login_cubit/login_states.dart';
import 'package:ready/core/mangers/values.dart';
import 'package:ready/core/network/local/cache_helper.dart';
import 'package:ready/screens/widgets/toast.dart';

class LoginScreen extends StatelessWidget {
  var  formKey = GlobalKey<FormState>();
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
          padding: const EdgeInsets.only(top: 122,left: 20),
          child: Column(
              children: [
            Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: AppFontSize.fontSize40,
                fontFamily:'Lato',
              ),
            ),
            SizedBox(height: 16),
            SizedBox(height: 24),
            Container(
              color: Colors.pink,
              child: ElevatedButton(
                onPressed: cubit.isBottonEnable
                    ? () {
                        // Handle login action
                        print('Logged in!');
                      }
                    : null,
                child: Text('Login'),
              ),
            ),
          ]),
        ),
      );
    });
  }
}
