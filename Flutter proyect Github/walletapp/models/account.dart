import 'package:hive/hive.dart';
part 'account.g.dart';
// Definición del modelo Account
@HiveType(typeId: 0)
class Account {
@HiveField(0)
final int id;
@HiveField(1)
final String title;
@HiveField(2)
final String number;
@HiveField(3)
final double balance;
@HiveField(4)
final double incomes;
@HiveField(5)
final double expenses;
Account(this.id, this.title, this.number, this.balance, this.expenses,
this.incomes);
}
