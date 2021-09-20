import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import './register.dart';
import './home.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  //created an FirebaseAuth instance that can handle  creating new users with their email and password.
  // And once user get registered successfully we navigate the user to login Screen.
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String email, password;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end:
              Alignment(0.2, 0.0), // 10% of the width, so there are ten blinds.
          colors: [const Color(0xff00b0ff), const Color(4280908287)],
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              //Title decoration
              children: [
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.fromLTRB(15.0, 80.0, 0.0, 0.0),
                        child: ColorizeAnimatedTextKit(
                          onTap: () {
                            print("Tap Event");
                          },
                          text: ["HOTEL", "HOTEL", "HOTEL"],
                          textStyle: TextStyle(
                              fontSize: 85.0, fontWeight: FontWeight.bold),
                          colors: [
                            Colors.black,
                            Colors.blueAccent[400],
                            Colors.green[200],
                            Colors.blueAccent,
                          ],
                          textAlign: TextAlign.start,
                        ),
                        // Text(
                        //   'HOTEL BOOKING',
                        //   style: TextStyle(
                        //       fontSize: 60.0, fontWeight: FontWeight.bold),
                        // ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 160, left: 15),
                        child: ColorizeAnimatedTextKit(
                          onTap: () {
                            print("Tap Event");
                          },
                          text: ["BOOKING.", "BOOKING.", "BOOKING."],
                          textStyle: TextStyle(
                              fontSize: 60.0, fontWeight: FontWeight.bold),
                          colors: [
                            Colors.black,
                            Colors.blue,
                            Colors.black,
                            Colors.white,
                          ],
                          textAlign: TextAlign.start,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    //Email is typed here
                    children: [
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          email = value; // get value from TextField
                        },
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[300])),
                      ),
                    ],
                  ),
                ),
                //password field
                Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          password = value; //get value from textField
                        },
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[300])),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                //navigate register page
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: new FlatButton(
                        child: new Text(
                          "Click here to Register",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16.0,
                              fontFamily: 'Quicksand'),
                          textAlign: TextAlign.end,
                        ),
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup())),
                      ),
                    ),
                  ],
                ),
                //Log in button
                Container(
                  padding: EdgeInsets.only(top: 2.0, bottom: 10.0),
                  child: Column(
                    children: [
                      MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          onPressed: () async {
                            setState(() {
                              showProgress = true;
                            });
                            //make user of signInWithEmailAndPassword firebase class method to help the user
                            //to Log-In into our Flutter Application.
                            try {
                              final newUser =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              print(newUser.toString());
                              if (newUser != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TravelApp()),
                                );
                                //toast message
                                Fluttertoast.showToast(
                                    msg: "Login Successfull",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.blueAccent,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                setState(() {
                                  showProgress = false;
                                });
                              } else {
                                //toast message
                                Fluttertoast.showToast(
                                    msg: "Error email or password",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.blueAccent,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                setState(() {
                                  showProgress = true;
                                });
                              }
                            } catch (e) {
                              print(e);
                              throw Exception("Error on server");
                            }
                          },
                          padding: EdgeInsets.all(10.0),
                          color: Colors.white,
                          minWidth: 200.0,
                          height: 45.0,
                          child: Text('LOG IN')),
                    ],
                  ),
                ),

                Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.25),
                            color: Colors.white),
                      ),
                    ),
                    Text(
                      "OR CONNECT WITH",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand'),
                    ),
                    new Expanded(
                      child: new Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.25),
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                //this is the facebook button to login using facebook
                new Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Container(
                          margin: EdgeInsets.only(right: 8.0),
                          alignment: Alignment.center,
                          child: new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new OutlineButton(
                                  color: Colors.white,
                                  highlightedBorderColor: Colors.white,
                                  borderSide: BorderSide(color: Colors.white),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                  onPressed: () => {_launchFB()},
                                  child: new Container(
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        new Expanded(
                                          child: new FlatButton(
                                            onPressed: () => {_launchFB()},
                                            padding: EdgeInsets.only(
                                              top: 15.0,
                                              bottom: 15.0,
                                            ),
                                            child: new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Text(
                                                  "FACEBOOK",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Quicksand'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //this is the google button to log in using googale account
                      new Expanded(
                        child: new Container(
                          margin: EdgeInsets.only(left: 8.0),
                          alignment: Alignment.center,
                          child: new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new OutlineButton(
                                  color: Colors.white,
                                  borderSide: BorderSide(color: Colors.white),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                  onPressed: () => {},
                                  child: new Container(
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        new Expanded(
                                          child: new FlatButton(
                                            onPressed: () => {_launchgoogle()},
                                            padding: EdgeInsets.only(
                                              top: 15.0,
                                              bottom: 15.0,
                                            ),
                                            child: new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Text(
                                                  "GOOGLE",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Quicksand'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: 
                      // TypewriterAnimatedTextKit(
                      //   onTap: () {
                      //     print("Tap Event");
                      //   },
                      //   text: [
                      //     "Designed by: ",
                      //     "Designed by:",
                      //     "Designed by:",
                      //     "Designed by:",
                      //   ],
                      //   textStyle:
                      //       TextStyle(fontSize: 10.0, fontFamily: "Agne"),
                      // ),

                      Text(
                        'DESIGNED BY:',
                        style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Quicksand'),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    SizedBox(height: 2),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: TypewriterAnimatedTextKit(
                        onTap: () {
                          print("Tap Event");
                        },
                        text: [
                          "Jyodesh Shakya ",
                          "Jyodesh Shakya ",
                          "Jyodesh Shakya ",
                          "Jyodesh Shakya ",
                        ],
                        textStyle:
                            TextStyle(fontSize: 10, fontFamily: "Agne"),
                      ),
                      // Text(
                      //   'Created By:\nJyodesh\n1916361',
                      //   style: TextStyle(
                      //       color: Colors.grey[300],
                      //       fontWeight: FontWeight.normal,
                      //       fontFamily: 'Quicksand'),
                      //   textAlign: TextAlign.end,
                      // ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_launchFB() async {
  const url = 'https://m.facebook.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchgoogle() async {
  const url =
      'https://accounts.google.com/signin/v2/identifier?service=accountsettings&continue=https%3A%2F%2Fmyaccount.google.com%2F%3Futm_source%3Dsign_in_no_continue&ec=GAlAwAE&flowName=GlifWebSignIn&flowEntry=AddSession';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
