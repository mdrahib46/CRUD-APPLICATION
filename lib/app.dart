import 'package:flutter/material.dart';
import 'screens/productlist_scrren.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red.shade100),
          ),
          focusColor: Colors.redAccent.shade100,
        ),
      ),
      home: ProductListScreen(),
    );
  }
}


