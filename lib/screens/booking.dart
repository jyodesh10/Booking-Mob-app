import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cool_alert/cool_alert.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate(){
    if(formkey.currentState.validate()){
      print ("validated");
    }else{
      print("not validated"); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment(
                0.2, 0.0), // 10% of the width, so there are ten blinds.
            colors: [const Color(0xff00b0ff), const Color(4280908287)],
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
        ),
        child: MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', 'US'), // English
            const Locale('th', 'TH'), // Thai
          ],
          home: Scaffold(
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
              title: Text('BOOKING'),
            ),
            body: SingleChildScrollView(
              child: Center(
                // ignore: missing_required_param
                child: Container(
                  child: Column(
                    children: [
                      //textfield to input name
                      Container(
                        padding:
                            EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Required";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'NAME',
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                  labelText: 'EMAIL',
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                  labelText: 'MOBILE NUMBER',
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'CHECK IN DATE',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                hintText: 'yy/mm/dd',
                                suffixIcon: IconButton(
                                    icon: Image.asset("assets/calender.png"),
                                    onPressed: () {}),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                        child: Column(
                          children: [
                            Container(
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'CHECK OUT DATE',
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  hintText: 'yy/mm/dd',
                                  suffixIcon: IconButton(
                                      icon: Image.asset("assets/calender.png"),
                                      onPressed: null),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                        child: Material(
                          elevation: 5,
                          color: Colors.grey[250],
                          borderRadius: BorderRadius.circular(32.0),
                          child: MaterialButton(
                            onPressed: ()
                            {
                              
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.success,
                                text: "successfully Booked!",
                              );
                            },
                            minWidth: 200.0,
                            height: 45.0,
                            color: Colors.grey[250],
                            child: Text(
                              "BOOK",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                        child: Material(
                          elevation: 5,
                          color: Colors.grey[250],
                          borderRadius: BorderRadius.circular(32.0),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            minWidth: 200.0,
                            height: 45.0,
                            color: Colors.grey[250],
                            child: Text(
                              "CANCEL BOOK",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
