abstract class Countertates {}

class CounterInitialState extends Countertates {}

class CounterMinusState extends Countertates {
  final int? counter;

  CounterMinusState(this.counter);
}

class CounterPlusState extends Countertates {
  final int counter;
  CounterPlusState(this.counter);
}
