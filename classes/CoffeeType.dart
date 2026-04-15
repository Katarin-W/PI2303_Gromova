import 'Espresso.dart';
import 'Cappuccino.dart';
import 'Latte.dart';
import 'ICoffee.dart';

enum CoffeeType {
  espresso,
  cappuccino,
  latte;

  ICoffee getCoffee() {
    switch (this) {
      case CoffeeType.espresso:
        return Espresso();
      case CoffeeType.cappuccino:
        return Cappuccino();
      case CoffeeType.latte:
        return Latte();
    }
  }

  String getDisplayName() {
    switch (this) {
      case CoffeeType.espresso:
        return 'Эспрессо';
      case CoffeeType.cappuccino:
        return 'Капучино';
      case CoffeeType.latte:
        return 'Латте';
    }
  }
}