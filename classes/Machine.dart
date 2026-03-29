import 'Resources.dart';
import 'ICoffee.dart';

class Machine {
  Resources _resources;

  Machine({Resources? resources}) : _resources = resources ?? Resources() {
    print('Кофемашина создана!');
    _resources.showResources();
    print('------------------------');
  }

  int get coffeeBeans => _resources.coffeeBeans;
  int get milk => _resources.milk;
  int get water => _resources.water;
  double get cash => _resources.cash;

  bool isAvailable(ICoffee coffee) {
    return _resources.coffeeBeans >= coffee.coffeeBeans() &&
           _resources.milk >= coffee.milk() &&
           _resources.water >= coffee.water();
  }

  bool makingCoffee(ICoffee coffee, double payment) {
    if (payment < coffee.price()) {
      print('Недостаточно денег! Нужно: ${coffee.price()} руб, внесено: $payment руб');
      return false;
    }

    if (!isAvailable(coffee)) {
      print('Извините, недостаточно ресурсов для приготовления ${coffee.name()}');
      return false;
    }

    print('Готовим ${coffee.name()}...');

    _resources.subtractCoffeeBeans(coffee.coffeeBeans());
    _resources.subtractMilk(coffee.milk());
    _resources.subtractWater(coffee.water());
    _resources.addCash(coffee.price());
    
    print('Ресурсы после приготовления ${coffee.name()}:');
    print('Кофе осталось: ${_resources.coffeeBeans} г');
    if (coffee.milk() > 0) {
      print('Молоко осталось: ${_resources.milk} мл');
    }
    print('Вода осталась: ${_resources.water} мл');
    
    double change = payment - coffee.price();
    if (change > 0) {
      print('Ваша сдача: $change руб');
    }
    
    print('Ваш ${coffee.name()} готов! Приятного аппетита!');
    print('------------------------');
    return true;
  }

  void addResources({int? coffee, int? milk, int? water}) {
    _resources.addResources(coffee: coffee, milk: milk, water: water);
    _resources.showResources();
  }

  void addCash(double amount) {
    if (amount > 0) {
      _resources.cash = _resources.cash + amount;
      print('Добавлено денег: $amount руб');
      print('Всего денег: ${_resources.cash} руб');
    }
  }

  double withdrawCash() {
    double amount = _resources.cash;
    _resources.cash = 0;
    print('Снято денег: $amount руб');
    return amount;
  }

  void showResources() {
    _resources.showResources();
  }
}