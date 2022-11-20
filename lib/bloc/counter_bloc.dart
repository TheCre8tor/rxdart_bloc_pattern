import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int initialCount = 0;

  late BehaviorSubject<int> _subjectCounter;

  CounterBloc({required this.initialCount}) {
    _subjectCounter = BehaviorSubject<int>.seeded(initialCount);
  }

  ValueStream<int> get counterObservable => _subjectCounter.stream;

  void increment() {
    initialCount++;
    _subjectCounter.sink.add(initialCount);
  }

  void decrement() {
    initialCount--;
    _subjectCounter.sink.add(initialCount);
  }

  void dispose() {
    _subjectCounter.close();
  }
}
