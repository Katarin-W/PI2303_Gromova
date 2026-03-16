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

}