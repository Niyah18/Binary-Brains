// ignore: file_names
import 'package:flutter/foundation.dart';

class Counter extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();  // This notifies the listeners that the state has changed
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}