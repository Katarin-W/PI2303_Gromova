import 'ICoffee.dart';

class Espresso implements ICoffee {
  @override
  int coffeeBeans() => 50;
  
  @override
  int milk() => 0;
  
  @override
  int water() => 100;
  
  @override
  double price() => 100.0;
  
  @override
  String name() => 'Эспрессо';
}