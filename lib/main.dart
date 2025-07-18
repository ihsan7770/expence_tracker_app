import 'package:expense_traker/Expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181));

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness:Brightness.dark ,
  seedColor: const Color.fromARGB(255, 5, 99, 125));

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,

        cardTheme: const CardTheme().copyWith(
        color:kDarkColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8)
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
        style:ElevatedButton.styleFrom(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ), ),
     
      ),//dark theme

      
      

      

      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        useMaterial3: true,
      colorScheme:kColorScheme,
      
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
      ),

      cardTheme: const CardTheme().copyWith(
        color:kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8)
        ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style:ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primaryContainer), ),

      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.normal,
          color: kColorScheme.onSecondaryContainer,
          fontSize: 14,
        )
      )

      
      
      ),

      themeMode: ThemeMode.system, 
       home:const Expenses()  
      
      
      
      );
  }
}
