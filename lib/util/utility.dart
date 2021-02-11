import 'package:flutter/material.dart';
import 'package:toast/toast.dart';


class Utility{

  void showLoader(context) {
    // flutter defined function
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return SimpleDialog(
            backgroundColor: Colors.black45,
            children: <Widget>[
              Center(
                child: Column(children: [
                  CircularProgressIndicator(backgroundColor: Colors.black,),
                  SizedBox(height: 10,),
                  Text("Please wait...",style: TextStyle(color: Colors.white),)
                ]),
              )
            ]
        );
      },
    );
  }

  void showToaster(context,message){
    return Toast.show(
        message,
        context,
        duration: Toast.LENGTH_SHORT,
        gravity:  Toast.BOTTOM);
  }

}
