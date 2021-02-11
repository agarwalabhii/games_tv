import 'package:bluestack/util/constant.dart';
import 'package:bluestack/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}


var username;
var password;
String body ;

class _LoginPageState extends State<LoginPage> {

  SharedPreferences sharedPrefs;


  @override
  void initState(){
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() => sharedPrefs = prefs);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(249,249,249,1),
      body:Container(
          height: height,
          color: Colors.white,
          /* decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.white,
                      Colors.indigo[910],
                      Colors.white,
                    ]
                )
            ),*/
          child:Stack(
            children: [
              ListView.builder(
                  physics: ScrollPhysics(),
                  reverse: true,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index ) {
                    return Column(
                      children: [
                        Image.asset(
                          'assets/images/game.jpeg',
                          fit: BoxFit.fitWidth,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 2.4,
                        )
                      ],
                    );
                  }
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "Please login to continue",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top:30,left: 20,right: 20),
                      child: TextField(
                        cursorColor: Colors.black,
                        autocorrect: false,
                        autofocus: false,
                        onTap: (){
                        },
                        onChanged: (_value){
                          username = _value;
                        },
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                        decoration: InputDecoration(
                          counterText: "",
                          enabledBorder: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2.0),
                              borderRadius:
                              BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2.0),
                              borderRadius:
                              BorderRadius.circular(10)),
                          labelStyle:
                          TextStyle(color: Colors.black),
                          labelText: "Username",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10,left: 20,right: 20),
                      child: TextField(
                        cursorColor: Colors.black,
                        enableSuggestions: false,
                        autocorrect: false,
                        autofocus: false,
                        onTap: (){
                        },
                        onChanged: (_value){
                          password = _value;
                        },
                        obscureText: true,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                        decoration: InputDecoration(
                          counterText: "",
                          enabledBorder: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2.0),
                              borderRadius:
                              BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2.0),
                              borderRadius:
                              BorderRadius.circular(10)),
                          labelStyle:
                          TextStyle(color: Colors.black),
                          labelText: "Password",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                      child: MaterialButton(
                        onPressed: () {
                          if(username.toString().length >= 3 && username.toString().length <= 10){
                            trySignIn(username);
                          }else{
                            Utility().showToaster(context, "Username should be between 3 to 10 character");}
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.black,
                        minWidth: MediaQuery.of(context).size.width,
                        height: 55,
                        child: Text(
                          "SignIn",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 3),
                        ),
                      ),
                    )
                  ],
                ),
              ),

            ],
          )
      ),
    );
  }


  void trySignIn(String mobile) {
    Utility().showLoader(context);
    if(userNamePwd.containsKey(mobile)){
      if(password != userNamePwd[mobile]){
        Navigator.of(context).pop();
        Utility().showToaster(context, "Invalid Password");
      }else{
        sharedPrefs.setBool(USER_LOGIN_KEY, true);
        Navigator.of(context).pop();
        Navigator.pushReplacementNamed(context, ROUTE_LANDING_PAGE);
      }
    }else {
      Navigator.of(context).pop();
      Utility().showToaster(context, "Invalid username");
    }
  }

  Map<String,String> userNamePwd = {
    "9898989898":"password123",
    "9876543210":"password123"
  };
}
