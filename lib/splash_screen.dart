import 'package:bluestack/util/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  bool isUserLoggedIn = false;
  String name = '';
  SharedPreferences sharedPrefs;


  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() => sharedPrefs = prefs);
    });
    autoLogIn();
  }


  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getBool(USER_LOGIN_KEY) != null && prefs.getBool(USER_LOGIN_KEY) ) {
      Navigator.of(context).pushReplacementNamed(ROUTE_LANDING_PAGE);
    }else {
      Navigator.of(context).pushReplacementNamed(ROUTE_LOGIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          width: MediaQuery.of(context).size.width,

          child: Center(
            child: Image.asset(
              'assets/images/game.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        )
    );
  }
}
