import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/core/controllers/ready_controller/ready_states.dart';
class ReadyCubit extends Cubit<ReadyStates> {
  ReadyCubit() : super(ReadyInitState());
  static ReadyCubit get(context) => BlocProvider.of(context);
  int currentHomeScreenIndex = 0;
  void changeUserHomeScreen(index) {
    currentHomeScreenIndex = index;
    emit(ChangeHomeScreenIndex());
  }

}
