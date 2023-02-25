import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc_observer/observer.dart';
import 'package:untitled/shop_app/shop_login/login.dart';
import 'package:untitled/styles/colors.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:ShopLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}


