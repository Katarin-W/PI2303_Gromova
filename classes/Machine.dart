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
}