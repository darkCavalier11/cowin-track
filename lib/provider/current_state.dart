import 'package:flutter/material.dart';

class CurrentState {
  int pin;
  DateTime dateTime;
  bool isLoading;

  CurrentState(this.pin, this.dateTime, this.isLoading);
}

class CurrentStateProvider with ChangeNotifier {
  CurrentState currentState = CurrentState(0, DateTime.now(), false);

  void setDate(DateTime dateTime) {
    currentState.dateTime = dateTime;
    notifyListeners();
  }

  void setPincode(int pincode) {
    currentState.pin = pincode;
    notifyListeners();
  }

  void toggleLoading() {
    currentState.isLoading = !currentState.isLoading;
    notifyListeners();
  }

  DateTime get dateTime {
    return currentState.dateTime;
  }

  int get pin {
    return currentState.pin;
  }

  bool get loadingStatus {
    return currentState.isLoading;
  }
}
