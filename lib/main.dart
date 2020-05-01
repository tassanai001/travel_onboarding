import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'models/travel_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Popins',
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SwiperController _controller;
  int _pageIndex = 0;
  List<TravelModel> _itemList = [
    TravelModel(
      image: "assets/images/img1.png",
      title: "Destination",
      subtitle:
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form",
      btnLabel: 'Next',
    ),
    TravelModel(
      image: "assets/images/img2.png",
      title: "Ticket Booking",
      subtitle:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
      btnLabel: 'Next',
    ),
    TravelModel(
      image: "assets/images/img3.png",
      title: "Enjoy Your Holiday",
      subtitle:
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form",
      btnLabel: 'Get Started',
    )
  ].toList();

  @override
  void initState() {
    _controller = new SwiperController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(35),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: new SizedBox(
                  child: new Swiper(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: <Widget>[
                          new Image.asset(_itemList[index].image),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Center(
                            child: Text(
                              _itemList[index].title,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(105, 116, 222, 1),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Center(
                            child: Text(
                              _itemList[index].subtitle,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 1.5,
                                fontSize: 15.0,
                                color: Color.fromRGBO(175, 174, 212, 1),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    pagination: new SwiperPagination(
                      margin: new EdgeInsets.all(5.0),
                      builder: new DotSwiperPaginationBuilder(
                        color: Color.fromRGBO(225, 227, 249, 1),
                        activeColor: Color.fromRGBO(105, 116, 222, 1),
                      ),
                    ),
                    controller: this._controller,
                  ),
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              ButtonTheme(
                minWidth: 178,
                height: 59,
                child: RaisedButton(
                  onPressed: () => this._controller.move(++this._pageIndex % 3),
                  color: Color.fromRGBO(105, 116, 222, 1),
                  child: Text(
                    this._itemList[this._pageIndex].btnLabel,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
