// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.


import 'package:bluestack/home_page.dart';
import 'package:bluestack/login.dart';
import 'package:bluestack/splash_screen.dart';
import 'package:bluestack/util/constant.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          ROUTE_LANDING_PAGE : (context) => HomePage(),
          ROUTE_LOGIN: (context) => LoginPage(),

        },
        title: "RentHouze",
        theme: ThemeData(primarySwatch: Colors.grey),
        home: SplashScreen());
  }

}

