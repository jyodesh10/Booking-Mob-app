import 'package:flutter/material.dart';
import './booking.dart';
import 'package:url_launcher/url_launcher.dart';


Color textColor = Colors.black54;
Color textSecondry = Colors.grey;

class HotelDetail extends StatefulWidget {
  @override
  _HotelDetailState createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  var hotel;
  var token;

  @override
  void initState() {
    print(hotel);
    super.initState();
  }

  Widget buildicons(index) {
    List<Widget> widgets = List<Widget>();
    for (int i = 0; i < int.tryParse(index); i++) {
      widgets.add(Icon(
        Icons.star,
        color: Colors.orange[100],
        size: 15,
      ));
    }
    return Row(children: widgets);
  }

  bool ames;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end:
              Alignment(0.2, 0.0), // 10% of the width, so there are ten blinds.
          colors: [
            const Color(0xff00b0ff),
            const Color(4280908287)
          ], // red to yellow
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          flexibleSpace: Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    const Color(0xFF2979FF),
                    const Color(0xFFB388FF),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('HOTEL'),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(left: 130, right: 130, bottom: 25),
          child: Container(
            padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
            child: Material(
              elevation: 5,
              color: Colors.grey[250],
              borderRadius: BorderRadius.circular(32.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Booking()),
                  );
                },
                minWidth: 200.0,
                height: 45.0,
                color: Colors.grey[250],
                child: Text(
                  "BOOK NOW",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0)),
              ),
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Image.network(
                      'https://cf.bstatic.com/images/hotel/max1280x900/263/263341687.jpg'),
                  // IconButton(
                  //     icon: Icon(
                  //       Icons.arrow_back,
                  //       color: Colors.white,
                  //     ),
                  //     onPressed: () {
                  //       Navigator.of(context).pop();
                  //     }),
                  // Align(
                  //   child: IconButton(
                  //       icon: Icon(
                  //         Icons.favorite,
                  //         color: textColor,
                  //       ),
                  //       onPressed: () {}),
                  //   alignment: Alignment.topRight,
                  // )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(3),
              child: Card(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Dwarika Hotel',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: textColor),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Battisputali, Kathmandu',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: textColor,
                                fontSize: 14),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 8, 10, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    child: Text(
                                      'Price',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: textColor,
                                          fontFamily: 'Quicksand'),
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  Text(
                                    '\$100 per night',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: textColor,
                                        fontFamily: 'Quicksand'),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    child: Text(
                                      'Rating',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: textColor,
                                          fontFamily: 'Quicksand'),
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  buildicons('4'),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  child: IconButton(
                                      icon: Image.asset("assets/fb.png"),
                                      onPressed: () {
                                        _launchFB();
                                      }),
                                  alignment: Alignment.topCenter,
                                ),
                                Container(
                                  child: IconButton(
                                      icon: Image.asset("assets/map.png"),
                                      onPressed: () {
                                        _launchMAP();
                                      }),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      DefaultTabController(
                          length: 4,
                          initialIndex: 0,
                          child: Column(
                            children: <Widget>[
                              TabBar(
                                indicatorColor: Theme.of(context).primaryColor,
                                labelColor: textColor,
                                unselectedLabelColor: textColor,
                                isScrollable: true,
                                tabs: [
                                  Tab(
                                    text: 'Details',
                                  ),
                                  Tab(
                                    text: 'Rooms',
                                  ),
                                  Tab(
                                    text: 'Reviews',
                                  ),
                                  Tab(
                                    text: 'Near By',
                                  )
                                ],
                              ),
                              Container(
                                  height: 300.0,
                                  color: Colors.blue[50],
                                  child: TabBarView(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            'Winner of the Pacific Asia Travel Association (PATA) Heritage Award, Dwarika Hotel is inspired by Kathmandu Valley’s rich cultural heritage. It features an outdoor pool and 4 food and beverage options',
                                            style: TextStyle(color: textColor),
                                          )),
                                      Center(
                                          child: Text(
                                              'Rooms Available Same price')),
                                      Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            'A very peaceful hotel, tastefully furnished and well placed for the airport',
                                            style: TextStyle(color: textColor),
                                          )),
                                      Center(child: Text('Near by here')),
                                    ],
                                  ))
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_launchFB() async {
  const url = 'https://www.facebook.com/thedwarikashotel';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchMAP() async {
  const url = 'https://g.page/Dwarikashotel?share';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
