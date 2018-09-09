import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'home_page.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  static String tag = "login-page";
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<FirebaseUser> _handleSignIn() async {
    var email = emailController.text;
    var password = passwordController.text;
    FirebaseUser user = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return user;
  }
  @override
  Widget build(BuildContext context) {

    showLoggedInUI(token) async {
      var graphResponse = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
      var profile = json.decode(graphResponse.body);
      print(profile['name']);
      //context.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(name: profile['name']),
        ),
      );
    }

    login() async {
      final facebookLogin = new FacebookLogin();
      final result = await facebookLogin.logInWithReadPermissions(['email']);
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          await FirebaseAuth.instance.signInWithFacebook(accessToken: result.accessToken.token);
          showLoggedInUI(result.accessToken.token);
          print(result.accessToken.token);
          break;
        case FacebookLoginStatus.cancelledByUser:
          print('CANCELED BY USER');
          break;
        case FacebookLoginStatus.error:
          print(result.errorMessage);
          break;
      }
    }
    final title = new Text(
      'Common Application',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      )
    );

    Widget titleDesc = Container( 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Text('Colleges and Universities', style: TextStyle(fontSize: 18.0)),
          new Text('of the', style: TextStyle(fontSize: 18.0)),
          new Text('Southern Cameroons', style: TextStyle(fontSize: 18.0))
        ]
      )
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: "Email",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      controller: emailController
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      controller: passwordController
    );

    final loginAndCreateButtons = Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              shadowColor: Colors.lightBlueAccent.shade100,
              elevation: 5.0,
              child: MaterialButton(
                height: 42.0,
                onPressed: () {
                  _handleSignIn()
                      .then((FirebaseUser user) {
                    print(user);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(name: user.email),
                      ),
                    );
                  })
                      .catchError((e) => print(e));
                },
                color: Colors.lightBlueAccent,
                child: Text('Log In', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          new Container(
            width: 8.0,
          ),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              shadowColor: Colors.lightBlueAccent.shade100,
              elevation: 5.0,
              child: MaterialButton(
                height: 42.0,
                onPressed: () {
                  //create new account
                  Navigator.of(context).pushNamed(HomePage.tag);
                },
                color: Colors.white,
                child: Text('Sign up', style: TextStyle(color: Colors.black54)),
              ),
            ),
          )
        ],
      )
      // padding: EdgeInsets.symmetric(vertical: 16.0),
    );


    final googleFBSignInButtons = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // google auth
              Navigator.of(context).pushNamed(HomePage.tag);
            },
            child: new Container(
              padding: EdgeInsets.all(12.0),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: Image.asset('graphics/googleLogo.png'),
                  ),
                  SizedBox(width: 5.0),
                Text('Continue with Google', style: TextStyle(color: Colors.deepOrange))
              ],
            ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // facebook auth
              login();
            },
            child: new Container(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: Image.asset('graphics/facebookLogo.png'),
                  ),
                  SizedBox(width: 5.0),
                Text('Continue with Facebook', style: TextStyle(color: Colors.lightBlue.shade700))
              ],
            ),
            ),
          ),
        ],
      ),
    );


    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 32.0),
            title,
            SizedBox(height: 5.0),
            titleDesc,
            SizedBox(height: 32.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            SizedBox(height: 14.0),
            loginAndCreateButtons,
            // googleSignInButton,
            googleFBSignInButtons,
            SizedBox(height: 32.0),
            forgotLabel
          ],
        ),
      )
    );

  }
}