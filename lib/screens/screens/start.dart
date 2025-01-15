import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ready/core/mangers/routes.dart';
import 'package:ready/core/mangers/values.dart';
import 'package:ready/screens/widgets/button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.only(top: 100,bottom: 80),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to UpTodo',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: AppFontSize.fontSize25),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    'Please login to your account or create new account to continue',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      fontSize: AppFontSize.fontSize15),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DefaultButton(
                  radius: 5,
                  isUpperCase: true,
                  width: double.infinity,
                    buttonWidget:Text('LOGIN',style: TextStyle(color: Colors.white),),
                    function:(){
                    navigateAndReplace(context,Routes.loginRoute);
                    },
                    backgroundColor: HexColor('8875FF'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                child: DefaultButton(
                  radius: 5,
                  borderColor:HexColor('8875FF'),
                  isUpperCase: true,
                  width: double.infinity,
                  buttonWidget:Text('CREATE ACCOUNT',style: TextStyle(color: Colors.white),),
                  function:(){},
                  backgroundColor: Colors.transparent
                ),
              )
            ],
            ),
          ),
    );
  }
}
