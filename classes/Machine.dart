class Machine {
  int _coffeeBeans = 500;
  int _milk = 1000;
  int _water = 2000;
  double _cash = 0.0;

  Machine() {
    print('Кофемашина создана!');
    print('Начальные ресурсы:');
    print('Кофе: $_coffeeBeans г');
    print('Молоко: $_milk мл');
    print('Вода: $_water мл');
    print('Денег: $_cash руб');
    print('------------------------');
  }

  int get coffeeBeans => _coffeeBeans;
  int get milk => _milk;
  int get water => _water;
  double get cash => _cash;

  set coffeeBeans(int value) {
    if (value >= 0) {
      _coffeeBeans = value;
    } else {
      print('Ошибка: количество кофе не может быть отрицательным');
    }
  }

  set milk(int value) {
    if (value >= 0) {
      _milk = value;
    } else {
      print('Ошибка: количество молока не может быть отрицательным');
    }
  }

  set water(int value) {
    if (value >= 0) {
      _water = value;
    } else {
      print('Ошибка: количество воды не может быть отрицательным');
    }
  }

  set cash(double value) {
    if (value >= 0) {
      _cash = value;
    } else {
      print('Ошибка: количество денег не может быть отрицательным');
    }
  }

  bool isAvailable(String coffeeType) {
    switch (coffeeType) {
      case 'эспрессо':
        return _coffeeBeans >= 50 && _water >= 100;
      case 'капучино':
        return _coffeeBeans >= 50 && _water >= 100 && _milk >= 150;
      case 'латте':
        return _coffeeBeans >= 50 && _water >= 100 && _milk >= 200;
      default:
        return false;
    }
  }

  void _subtractResources(String coffeeType) {
    if (coffeeType == 'эспрессо') {
      _coffeeBeans -= 50;
      _water -= 100;
      print('Ресурсы после приготовления эспрессо:');
      print('Кофе осталось: $_coffeeBeans г');
      print('Вода осталась: $_water мл');
    } else if (coffeeType == 'капучино') {
      _coffeeBeans -= 50;
      _water -= 100;
      _milk -= 150;
      print('Ресурсы после приготовления капучино:');
      print('Кофе осталось: $_coffeeBeans г');
      print('Вода осталась: $_water мл');
      print('Молоко осталось: $_milk мл');
    } else if (coffeeType == 'латте') {
      _coffeeBeans -= 50;
      _water -= 100;
      _milk -= 200;
      print('Ресурсы после приготовления латте:');
      print('Кофе осталось: $_coffeeBeans г');
      print('Вода осталась: $_water мл');
      print('Молоко осталось: $_milk мл');
    }
  }

  double _getPrice(String coffeeType) {
    switch (coffeeType) {
      case 'эспрессо':
        return 100.0;
      case 'капучино':
        return 150.0;
      case 'латте':
        return 180.0;
      default:
        return 0.0;
    }
  }

  bool makingCoffee(String coffeeType, double payment) {
    double price = _getPrice(coffeeType);
    if (payment < price) {
      print('Недостаточно денег! Нужно: $price руб, внесено: $payment руб');
      return false;
    }

    if (!isAvailable(coffeeType)) {
      print('Извините, недостаточно ресурсов для приготовления $coffeeType');
      return false;
    }

    print('Готовим $coffeeType...');
    _subtractResources(coffeeType);
    _cash += price;
    
    double change = payment - price;
    if (change > 0) {
      print('Ваша сдача: $change руб');
    }
    
    print('Ваш $coffeeType готов! Приятного аппетита!');
    print('------------------------');
    return true;
  }

  void addResources({int? coffee, int? milk, int? water}) {
    if (coffee != null && coffee > 0) {
      _coffeeBeans += coffee;
      print('Добавлено кофе: $coffee г');
    }
    if (milk != null && milk > 0) {
      _milk += milk;
      print('Добавлено молока: $milk мл');
    }
    if (water != null && water > 0) {
      _water += water;
      print('Добавлено воды: $water мл');
    }
    _showResources();
  }

  void addCash(double amount) {
    if (amount > 0) {
      _cash += amount;
      print('Добавлено денег: $amount руб');
      print('Всего денег: $_cash руб');
    }
  }

  double withdrawCash() {
    double amount = _cash;
    _cash = 0;
    print('Снято денег: $amount руб');
    return amount;
  }

  void _showResources() {
    print('Текущие ресурсы машины:');
    print('Кофе: $_coffeeBeans г');
    print('Молоко: $_milk мл');
    print('Вода: $_water мл');
    print('Денег: $_cash руб');
  }

}