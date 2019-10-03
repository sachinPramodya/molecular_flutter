import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_molecular_chat/screens/validation/validation.dart';

import '../../http.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final Validation validationObj = Validation.instance();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  bool autoValidate = false;

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;

    return Scaffold(
        key: _scaffoldKey,
        body: Form(
          key: registerFormKey,
          autovalidate: autoValidate,
          child: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  image: AssetImage('images/chat.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: ListView(
                children: <Widget>[
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: _height * 0.05,
                      ),
                      Text(
                        "Welcome",
                        style: TextStyle(fontSize: 60.0, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: _height * 0.1,
                      ),
                      TextFormField(
                        validator: validationObj.validateEmail,
                        controller: _email,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                            size: 20,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white),
                          errorStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.02,
                      ),
                      TextFormField(
                        validator: validationObj.validatePassword,
                        controller: _password,
                        obscureText: true,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                            size: 20,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black)),
                          errorStyle: TextStyle(
                            color: Colors.black,
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.02,
                      ),
                      TextFormField(
                        validator: validationObj.validatePassword,
                        controller: _confirmPassword,
                        obscureText: true,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                            size: 20,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black)),
                          errorStyle: TextStyle(
                            color: Colors.black,
                          ),
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.1,
                      ),
                      Container(
                        height: _height * 0.08,
                        child: SizedBox.expand(
                          child: FlatButton(
                            onPressed: () {
                              if (registerFormKey.currentState.validate()) {
                                // print(_email.text);
                                // print(_password.text);
                                // createUser(_email.text, _password.text)
                                //     .then((onValue) {
                                //   Firestore.instance
                                //       .collection('user')
                                //       .document()
                                //       .setData({
                                //     "role": "user",
                                //     "email": _email.text,
                                //     "position": " ",
                                //     "userId": onValue
                                //   }).then((data) {
                                //     Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) => Login()));
                                //   });
                                // });
                              }
                              setState(() {
                                autoValidate = true;
                              });
                            },
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 15.0,
                              ),
                              child: Text(
                                "Register",
                                style: TextStyle(fontSize: _height * 0.03),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.1,
                      ),
                    ]),
                  ),
                ],
              )),
        ));
  }

  Future<String> registerUser() async {
    try {
      Response response = await http.post('register',data: );
      print("registration response *****************");
      return response.data;
    } catch (error) {
      print(error);
    }

    return null;
  }
}
