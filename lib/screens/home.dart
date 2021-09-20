import 'package:flutter/material.dart';
import './travelcard.dart';
import './login.dart';

class TravelApp extends StatefulWidget {
  static const routeName = '/home';
  @override
  _TravelAppState createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  //list of image urls
  List<String> urls = [
    "https://cf.bstatic.com/images/hotel/max1280x900/263/263341687.jpg",
    "https://cf.bstatic.com/images/hotel/max1280x900/234/234225191.jpg",
    "https://cf.bstatic.com/images/hotel/max1280x900/366/36673406.jpg",
    "https://cf.bstatic.com/images/hotel/max1280x900/180/180462044.jpg",
    "https://cf.bstatic.com/xdata/images/landmark/max1024/239614.webp?k=541168df82dbfcb186c4971ba0fad092dbfb88e2a3067ab85337a0a887bb49ba&o=",
    "https://media.gadventures.com/media-server/cache/5b/e7/5be7ed4f1887779b9522ed2b98886a06.jpg",
    "https://www.welcomenepal.com/uploads/destination/bhaktapur-nyatapol.jpeg",
    "https://www.welcomenepal.com/uploads/destination/top-5-shiva-temples-in-kathmandu-valley-nepal.jpeg",
    "https://www.internasia.com/sites/default/files/kathmandu_2.jpg"
  ];
 
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    if (_index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Signin()));
    } else if (_index == 0) {}
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
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            elevation: 0.0,
            leading: IconButton(
              alignment: Alignment.center,
              icon: Icon(Icons.logout, color: Colors.black ),
              tooltip: 'log out',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Signin()),
              ),
            ),
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
            title: Text("HOTELS")),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome To Hotel Booking App",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Pick your Hotels around Kathmandu",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                //search bar
                Material(
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(30.0),
                  shadowColor: Color(0x55434343),
                  child: TextField(
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: "Search for Hotel",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black54,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: DefaultTabController(
                    length: 3,
                    child: Expanded(
                      child: Column(
                        children: [
                          TabBar(
                            indicatorColor: Color(0xFFFE8C68),
                            unselectedLabelColor: Color(0xFF555555),
                            labelColor: Color(0xFFFE8C68),
                            labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                            tabs: [
                              Tab(
                                text: "Hotels",
                              ),
                              Tab(
                                text: "Trending",
                              ),
                              Tab(
                                text: "Favorites",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Container(
                            height: 300.0,
                            child: TabBarView(
                              children: [
                                //first tab page
                                Container(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    //calls travelcard.dart file
                                    children: [
                                      //first card
                                      travelCard(
                                          urls[0],
                                          "Dwarika Hotel",
                                          "\$100 per night",
                                          "Chabahil",
                                          5,
                                          context),
                                      travelCard(
                                          urls[1],
                                          "Hyatt Hotel",
                                          "\$200 per night",
                                          "Boudha",
                                          4,
                                          context),
                                      travelCard(
                                          urls[2],
                                          "Yak and Yeti Hotel",
                                          "\$150 per night",
                                          "Thamel",
                                          5,
                                          context),
                                      travelCard(
                                          urls[3],
                                          "Hotel shakhar",
                                          "\$150 per night",
                                          "Thamel",
                                          5,
                                          context),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      //Add contents
                                      travelCard(
                                          urls[3],
                                          "Hotel Shankhar",
                                          "Lazimpat",
                                          "\$100 per night",
                                          4,
                                          context),
                                      travelCard(
                                          urls[4],
                                          "Kumari Boutique Hotel",
                                          "\$100 per night",
                                          "Thamel",
                                          4,
                                          context),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      travelCard(
                                          urls[2],
                                          "Yak and Yeti Hotel",
                                          "Thamel",
                                          "\$100 per night",
                                          5,
                                          context),
                                      travelCard(
                                          urls[4],
                                          "Kumari Boutique Hotel",
                                          "Thamel",
                                          "\$100 per night",
                                          4,
                                          context),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        //buttom nav bar 
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (int index) => setState(() => _index = index),
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              title: Text("LOG OUT"),
            ),
          ],
        ),
      ),
    );
  }
}
