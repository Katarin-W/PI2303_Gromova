import 'dart:async';
import 'ICoffee.dart';

class CoffeeMaker {

  Future<void> heatWater() async {
    print('Начинаем нагрев воды...');
    await Future.delayed(Duration(seconds: 3));
    print('Вода нагрета! (3 сек)');
  }

  Future<void> brewCoffee() async {
    print('Начинаем заваривание кофе...');
    await Future.delayed(Duration(seconds: 5));
    print('Кофе заварен! (5 сек)');
  }

  Future<void> frothMilk() async {
    print('Начинаем взбивать молоко...');
    await Future.delayed(Duration(seconds: 5));
    print('Молоко взбито! (5 сек)');
  }

  Future<void> mixCoffeeAndMilk() async {
    print('Смешиваем кофе с молоком...');
    await Future.delayed(Duration(seconds: 3));
    print('Кофе с молоком смешан! (3 сек)');
  }

  Future<void> makeCoffeeWithoutMilk() async {
    print('\nНАЧИНАЕМ ПРИГОТОВЛЕНИЕ КОФЕ БЕЗ МОЛОКА');
    print('----------------------------------------');
    
    await heatWater();
    await brewCoffee();
    
    print('----------------------------------------');
    print('КОФЕ ГОТОВ! Приятного аппетита!');
    print('----------------------------------------\n');
  }

  Future<void> makeCoffeeWithMilk() async {
    print('\nНАЧИНАЕМ ПРИГОТОВЛЕНИЕ КОФЕ С МОЛОКОМ');
    print('----------------------------------------');
    
    await heatWater();

    await Future.wait([
      brewCoffee(),
      frothMilk(),
    ]);
    
    await mixCoffeeAndMilk();
    
    print('----------------------------------------');
    print('КОФЕ С МОЛОКОМ ГОТОВ! Приятного аппетита!');
    print('----------------------------------------\n');
  }

  Future<void> makeCoffee(ICoffee coffee) async {
    if (coffee.milk() > 0) {
      await makeCoffeeWithMilk();
    } else {
      await makeCoffeeWithoutMilk();
    }
  }
}