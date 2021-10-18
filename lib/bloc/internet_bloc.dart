import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  late StreamSubscription connectivitySubscription;
  InternetBloc() : super(InternetLoading()) {
    on<GetInternetState>((event, emit) async {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        emit(InternetConnected());
      } else if (connectivityResult == ConnectivityResult.wifi) {
        emit(InternetConnected());
      } else {
        emit(InternetDisconnected());
      }
    });
  }
}
