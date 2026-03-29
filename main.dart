import 'dart:io';
import 'classes/Machine.dart';
import 'classes/CoffeeType.dart';
import 'classes/ICoffee.dart';

void main() {
  Machine machine = Machine();

  print('ПРОГРАММА УПРАВЛЕНИЯ КОФЕМАШИНОЙ');

  bool isWorking = true;

  while (isWorking) {
    print('\nДоступные команды:');
    print('1 - Приготовить кофе');
    print('2 - Добавить ресурсы');
    print('3 - Внести деньги');
    print('4 - Забрать выручку');
    print('5 - Проверить ресурсы');
    print('6 - Выйти из программы');

    stdout.write('Введите команду: ');
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        print('\nПРИГОТОВЛЕНИЕ КОФЕ');
        print('Выберите напиток:');

        final coffees = CoffeeType.values;
        for (int i = 0; i < coffees.length; i++) {
          ICoffee coffee = coffees[i].getCoffee();
          print('${i + 1} - ${coffee.name()} (${coffee.price()} руб)');
        }
        
        stdout.write('Ваш выбор: ');
        String? choice = stdin.readLineSync();
        
        stdout.write('Внесите оплату (руб): ');
        double payment = double.parse(stdin.readLineSync() ?? '0');

        int choiceIndex = int.tryParse(choice ?? '0') ?? 0;
        if (choiceIndex >= 1 && choiceIndex <= coffees.length) {
          ICoffee selectedCoffee = coffees[choiceIndex - 1].getCoffee();
          machine.makingCoffee(selectedCoffee, payment);
        } else {
          print('Неверный выбор напитка');
        }
        break;

      case '2':
        print('\nДОБАВЛЕНИЕ РЕСУРСОВ');
        stdout.write('Введите количество кофейных зерен (г): ');
        int coffee = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

        stdout.write('Введите количество молока (мл): ');
        int milk = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

        stdout.write('Введите количество воды (мл): ');
        int water = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

        machine.addResources(coffee: coffee, milk: milk, water: water);
        break;

      case '3':
        print('\nВНЕСЕНИЕ ДЕНЕГ');
        stdout.write('Введите сумму для добавления (руб): ');
        double amount = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        machine.addCash(amount);
        break;

      case '4':
        print('\nИЗЪЯТИЕ ВЫРУЧКИ');
        machine.withdrawCash();
        break;

      case '5':
        print('\nТЕКУЩИЕ РЕСУРСЫ');
        machine.showResources();
        print('------------------------');
        break;

      case '6':
        isWorking = false;
        print('Программа завершена. До свидания!');
        break;

      default:
        print('Неизвестная команда. Пожалуйста, введите номер от 1 до 6.');
    }
  }
}