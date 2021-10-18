part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {
  final int value;

  CounterInitial(this.value);
}

class CounterAddition extends CounterState {
  final int value;

  CounterAddition(this.value);
}

class CounterSubstraction extends CounterState {
  final int value;

  CounterSubstraction(this.value);
}
