import 'package:flutter/material.dart';
import 'package:praktikum10_22sa11a021_bibitraikhan/constant/constant_color.dart';
import 'package:praktikum10_22sa11a021_bibitraikhan/screen/users.dart';

void main() {
  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: warnaDasarAppBar,
          foregroundColor: warnaTulisanAppBar,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary:warnaTombol,
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.black,),
          headline6: TextStyle(color: Colors.red,)
        ),
        
      ),
      debugShowCheckedModeBanner: false,
      title: "Latihan HTTP",
      home: const Users(),
    );
  }}