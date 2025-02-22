import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 66, 35, 0));

var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark, seedColor: Color.fromARGB(255, 0, 9, 94));

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kDarkColorScheme,
      cardTheme: CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
    ),
    theme: ThemeData().copyWith(
      colorScheme: kColorScheme,
      appBarTheme: AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
      ),
      cardTheme: CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
      textTheme: TextTheme().copyWith(
          titleLarge:
              TextStyle().copyWith(fontWeight: FontWeight.normal, fontSize: 14),
          bodyMedium: TextStyle()
              .copyWith(fontSize: 12, color: kColorScheme.onPrimaryContainer)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer),
      ),
      dropdownMenuTheme: DropdownMenuThemeData().copyWith(
        inputDecorationTheme: InputDecorationTheme().copyWith(
          border: UnderlineInputBorder(),
        ),
        textStyle: TextStyle().copyWith(color: kColorScheme.primary),
        menuStyle: MenuStyle().copyWith(
          shape: WidgetStatePropertyAll(
            BeveledRectangleBorder(
                side: BorderSide(color: kColorScheme.onPrimary)),
          ),
        ),
      ),
    ),
    home: Expenses(),
  ));
}
