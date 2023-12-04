import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:walletapp/models/account.dart';
import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AccountAdapter());
  await Hive.openBox('accountsBox');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.blue.shade900),
      title: 'Wallet App',
      home: const Home(),
    );
  }
}
