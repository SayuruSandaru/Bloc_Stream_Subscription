part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class CounterAddOne extends CounterEvent {}

class CounterSubstractOne extends CounterEvent {}
