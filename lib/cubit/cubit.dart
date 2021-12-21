import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:counter/cubit/states.dart';

// Logic (blocBase)
class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterIntialState());

  static CounterCubit get(context) {
    return BlocProvider.of(context);
  }

  int counter = 0;

  void plus() {
    counter++;
    emit(CounterPlusState(counter));
  }

  void minus() {
    counter--;
    emit(CounterMinusState(counter));
  }
}
