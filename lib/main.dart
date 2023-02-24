import 'package:flutter/material.dart';
import 'package:planets_details_app/views/screens/detailspage.dart';
import 'package:planets_details_app/views/screens/homepage.dart';

void main(){
  runApp(const MyApp(),);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        '/':(context)=>const HomePage(),
        'details_page':(context)=>const DetailsPage(),
      },
    );
  }
}
