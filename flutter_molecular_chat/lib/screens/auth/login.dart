import 'package:flutter/material.dart';
import 'package:flutter_molecular_chat/screens/auth/register.dart';
import 'package:flutter_molecular_chat/screens/validation/validation.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _password = TextEditingController();
  final Validation validationObj = Validation.instance();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  bool autoValidate = false;

  BuildContext _scaffoldContext;
  TextEditingController _email = TextEditingController();
  bool submitted = false;

  @override
  void initState() {
    super.initState();
    // _email.text = "sa@gmail.com";
    // _password.text = "123456";
  }

  @override
  Widget build(BuildContext context) {
    _scaffoldContext = context;
    final double _height = MediaQuery.of(context).size.height;

    return Scaffold(
        key: _scaffoldKey,
        body: Form(
          key: loginFormKey,
          autovalidate: autoValidate,
          child: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.1), BlendMode.dstATop),
                  image: AssetImage('images/chat.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: !submitted
                  ? ListView(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
                          child: Column(children: <Widget>[
                            SizedBox(
                              height: _height * 0.1,
                            ),
                            Text(
                              "Welcome",
                              style: TextStyle(
                                  fontSize: 60.0, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: _height * 0.2,
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
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
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
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                errorStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                hintText: 'Password',
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
                                  // TODO:
                                  // onPressed: login,
                                  onPressed: () {
                                    if (loginFormKey.currentState.validate()) {}
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
                                      "Login",
                                      style:
                                          TextStyle(fontSize: _height * 0.03),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  "Does not have an account?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Register()));
                                  },
                                  child: Text(
                                    "SIGN Up",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.yellow),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: _height * 0.1,
                            ),
                          ]),
                        ),
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    )),
        ));
  }
}
