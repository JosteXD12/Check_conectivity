import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/utilities/check_internet_connection.dart';

class ConnectionStatusCubit extends Cubit<ConnectionStatus> {
  late StreamSubscription _connectionSubscription;

  ConnectionStatusCubit() : super(ConnectionStatus.online) {
    _connectionSubscription = internetChecker.internetStatus().listen(emit);
  }

  @override
  Future<void> close() {
    _connectionSubscription.cancel();
    return super.close();
  }
}