import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/core/controllers/ready_controller/ready_cubit.dart';
import 'package:ready/core/controllers/ready_controller/ready_states.dart';
import 'package:ready/core/mangers/colors.dart';
import 'package:ready/core/mangers/lists.dart';
import 'package:spotlight_bottom_navbar/spotlight_bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReadyCubit, ReadyStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SpotlightBottomNav(
          spotlightColor: AppColors.primeColor,
              bottomNavCount: 5,
          icons: icons,
          pages:screens,
    ),
    );
          }
          );
  }
}
