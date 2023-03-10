import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc_observer/observer.dart';
import 'package:untitled/network/remote/dio_helper.dart';
import 'package:untitled/shop_app/shop_login/login.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
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


