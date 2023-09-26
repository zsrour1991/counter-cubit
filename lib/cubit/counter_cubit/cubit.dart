import 'package:bloc/bloc.dart';

import 'state.dart';

class CounterCubitCubit extends Cubit<CounterCubitState> {
  CounterCubitCubit() : super(CounterCubitState().init());

  int counter=0;

  increase(){
    counter++;
    emit(CounterCubitState().incrementState());
  }
  decrease(){
    counter--;
    emit(CounterCubitState().decrementState());
  }
}
