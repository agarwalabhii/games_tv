import 'dart:convert';

import 'package:bluestack/util/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map jsonMap;

  List tournamentList = [];
  var cursor;
  bool isLastBatch = false;
  ScrollController _scrollController = ScrollController();


  getRecommendedSection() async {
    String url = URL_RECOMMENDED_SECTION;
    if (cursor != null) {
      url = url + cursor;
    }
    var response = await http.get(URL_RECOMMENDED_SECTION);
    if (response.statusCode == 200 &&
        jsonDecode(response.body)['data'] != null) {
      jsonMap = jsonDecode(response.body)['data'];
      tournamentList.addAll(jsonMap['tournaments']);
      cursor = jsonMap['cursor'];
      isLastBatch = jsonMap['is_last_batch'];
      setState(() {});
    }
  }

  @override
  initState() {
    super.initState();
    getRecommendedSection();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !isLastBatch) {
          getRecommendedSection();
        }
    });
  }

  Widget setGameItems(image, title, subtitle) {
    return Padding(
      padding: const EdgeInsets.only(top: 5,bottom: 5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(25))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              child: Container(
                color: Colors.white,
                height: 70,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Image.network(image, fit: BoxFit.cover,),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(title, style: TextStyle(fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(subtitle, style: TextStyle(fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),),
            ),

          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu,),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        title: Center(
          child: Text("FlyingWolf"),
        ),
        backgroundColor: Color.fromRGBO(249, 249, 249, 1),
        elevation: 0.1,
      ),
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(249, 249, 249, 1),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      "https://picsum.photos/id/237/200/300", height: 110,
                      width: 110,
                      fit: BoxFit.cover,),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Simon Baker", style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 25),),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(65, 108, 255, 1),
                                      width: 2
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(30))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text("2250", style: TextStyle(fontSize: 30,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(
                                            65, 108, 255, 1)),),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text("Elo Rating",
                                        style: TextStyle(fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                100, 112, 147, 1)),),
                                    )
                                  ],
                                ),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .3,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        color: Color.fromRGBO(230, 131, 3, 1),
                        onPressed: () {},
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10),
                              child: Column(
                                children: [
                                  Text("34", style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                    textAlign: TextAlign.center,),
                                  Text("Tournaments played", style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center,),
                                ],
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .3,
                      child: RaisedButton(
                        color: Color.fromRGBO(112, 59, 169, 1),
                        onPressed: () {},
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10),
                              child: Column(
                                children: [
                                  Text("09", style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                    textAlign: TextAlign.center,),
                                  Text("Tournaments won", style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center,),
                                ],
                              ),
                            )),
                      ),
                    ), SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .3,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        color: Color.fromRGBO(236, 88, 69, 1),
                        onPressed: () {},
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10),
                              child: Column(
                                children: [
                                  Text("26%", style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                    textAlign: TextAlign.center,),
                                  Text("winning percentage", style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center,),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: tournamentList == null ? 0 : tournamentList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return setGameItems(tournamentList[index]['cover_url'],
                        tournamentList[index]['name'],
                        tournamentList[index]['game_name']);
                  }),
              if(!isLastBatch)
              Center(
                child: Column(children: [
                  CircularProgressIndicator(backgroundColor: Colors.red,),
                  SizedBox(height: 10,),
                ]),
              )

            ],
          ),
        ),
      )
    );
  }


}