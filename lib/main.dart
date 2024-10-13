import 'package:flutter/material.dart';
import 'package:lemari_resep_app/mainscreen.dart';
import 'package:lemari_resep_app/model/popular-recipe.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen(recipeData: dataResep),
    );
  }
}
