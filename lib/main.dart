import 'package:flutter/material.dart';
import 'package:restapi_flutter/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RestAPI Integration',
      theme: ThemeData(
        /*primarySwatch is somewhat like the main or the primary color of the application*/
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}