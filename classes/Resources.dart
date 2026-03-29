class Resources {
  int _coffeeBeans;
  int _milk;
  int _water;
  double _cash;

  Resources({
    int coffeeBeans = 500,
    int milk = 1000,
    int water = 2000,
    double cash = 0.0,
  }) : _coffeeBeans = coffeeBeans,
       _milk = milk,
       _water = water,
       _cash = cash;

  int get coffeeBeans => _coffeeBeans;
  int get milk => _milk;
  int get water => _water;
  double get cash => _cash;

  set coffeeBeans(int value) {
    if (value >= 0) _coffeeBeans = value;
  }

  set milk(int value) {
    if (value >= 0) _milk = value;
  }

  set water(int value) {
    if (value >= 0) _water = value;
  }

  set cash(double value) {
    if (value >= 0) _cash = value;
  }

  void subtractCoffeeBeans(int amount) {
    _coffeeBeans -= amount;
  }

  void subtractMilk(int amount) {
    _milk -= amount;
  }

  void subtractWater(int amount) {
    _water -= amount;
  }

  void addCash(double amount) {
    _cash += amount;
  }

  void addResources({int? coffee, int? milk, int? water}) {
    if (coffee != null && coffee > 0) _coffeeBeans += coffee;
    if (milk != null && milk > 0) _milk += milk;
    if (water != null && water > 0) _water += water;
  }

  void showResources() {
    print('Текущие ресурсы машины:');
    print('Кофе: $_coffeeBeans г');
    print('Молоко: $_milk мл');
    print('Вода: $_water мл');
    print('Денег: $_cash руб');
  }
}