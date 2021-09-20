import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';

import './login.dart';

class Signup extends StatefulWidget {
  static const routeName = '/signup';

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //created an FirebaseAuth instance that can handle  creating new users with their email and password.
  // And once user get registered successfully we navigate the user to login Screen.
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String email, password;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  
  @override
  Widget build(BuildContext context) {
    return Container(
      //backgroud decoration
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end:
              Alignment(0.2, 0.0), // 10% of the width, so there are ten blinds.
          colors: [const Color(0xff00b0ff), const Color(4280908287)],
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      child: MaterialApp(
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
            title: Text('REGISTER'),
          ),
          body: SingleChildScrollView(
              child: Center(
            child: ModalProgressHUD(
              inAsyncCall: showProgress,
              child: Column(
                children: [
                  //textfield to input name
                  Container(
                    padding:
                        EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: TextEditingController(),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Text is empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'NAME',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[300])),

                        )
                      ],
                    ),
                  ),

                  Container(
                    padding:
                        EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        //textfield to input email

                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            email = value; //get the value entered by user.
                          },
                          decoration: InputDecoration(
                              labelText: 'EMAIL',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[300])),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        //textfield to input password

                        TextField(
                          onChanged: (value) {
                            password = value; //get the value entered by user.
                          },
                          decoration: InputDecoration(
                              hintText: 'more than 6 values',
                              labelText: 'PASSWORD',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[300])),
                          obscureText: true,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        //textfield to input mobile number

                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'MOBILE NUMBER',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[300])),
                          keyboardType: TextInputType.number,
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: new FlatButton(
                          //clicking the text navigates to login screen
                          child: new Text(
                            "Already have an account?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15.0,
                                fontFamily: 'Quicksand'),
                            textAlign: TextAlign.end,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),

                  Material(
                    elevation: 5,
                    color: Colors.grey[250],
                    borderRadius: BorderRadius.circular(32.0),
                    child: MaterialButton(
                      onPressed: () async {
                        setState(() {
                          showProgress = true;
                        });
                        //make user of signInWithEmailAndPassword firebase class method to help
                        // the user to Log-In into our Flutter Application.
                        try {
                          final newuser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          if (newuser != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Signin()),
                            );
                            setState(() {
                              showProgress = false;
                            });
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.success,
                              text: "successfully registered!",
                            );
                          } else {
                            Fluttertoast.showToast(
                                msg: "Empty Fields",
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
                          print("throwing new error");
                          throw Exception("Error on server");
                        }
                      },
                      minWidth: 200.0,
                      height: 45.0,
                      color: Colors.grey[250],
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
