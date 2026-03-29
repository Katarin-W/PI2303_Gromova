import 'ICoffee.dart';

class Cappuccino implements ICoffee {
  @override
  int coffeeBeans() => 50;
  
  @override
  int milk() => 150;
  
  @override
  int water() => 100;
  
  @override
  double price() => 150.0;
  
  @override
  String name() => 'Капучино';
}