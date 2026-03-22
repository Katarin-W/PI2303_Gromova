import 'dart:io';
import 'classes/Machine.dart';

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
        print('1 - Эспрессо (100 руб)');
        print('2 - Капучино (150 руб)');
        print('3 - Латте (180 руб)');
        
        stdout.write('Ваш выбор: ');
        String? choice = stdin.readLineSync();
        
        stdout.write('Внесите оплату (руб): ');
        double payment = double.parse(stdin.readLineSync() ?? '0');
        
        switch (choice) {
          case '1':
            machine.makingCoffee('эспрессо', payment);
            break;
          case '2':
            machine.makingCoffee('капучино', payment);
            break;
          case '3':
            machine.makingCoffee('латте', payment);
            break;
          default:
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
        print('Кофе: ${machine.coffeeBeans} г');
        print('Молоко: ${machine.milk} мл');
        print('Вода: ${machine.water} мл');
        print('Денег: ${machine.cash} руб');
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