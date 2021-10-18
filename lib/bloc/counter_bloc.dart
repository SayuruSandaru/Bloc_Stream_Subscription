import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloctest/bloc/internet_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  late final StreamSubscription streamSubscription;
  final InternetBloc internetBloc;
  CounterBloc(this.internetBloc) : super(CounterInitial(0)) {
    textterState();
    on<CounterAddOne>((event, emit) => emit(CounterAddition(0 + 1)));
    on<CounterSubstractOne>((event, emit) => emit(CounterAddition(0 - 1)));
  }

  StreamSubscription? textterState() {
    streamSubscription = internetBloc.stream.listen((state) {
      print(state);
      if (state is InternetConnected) {
        add(CounterAddOne());
      } else {
        add(CounterSubstractOne());
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
