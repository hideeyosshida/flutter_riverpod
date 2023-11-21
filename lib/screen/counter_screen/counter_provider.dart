import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends StateNotifier<int> {
  Counter() : super(10);

  @override
  int build() {
    return 0;
  }

  void increment() => state++;
  void decrement() => state --;
}

final counterProvider = StateNotifierProvider<Counter, int>((ref) => Counter());
