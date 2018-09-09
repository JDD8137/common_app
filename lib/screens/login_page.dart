import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = "login-page";
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

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

    final logo = Hero(
        tag: "hero",
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset("assets/logo.png"),
        )
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: "email@provider.com",
      decoration: InputDecoration(
        hintText: "Email",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
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
                  Navigator.of(context).pushNamed(HomePage.tag);
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

    // final googleSignInButton = Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       MaterialButton(
    //         onPressed: () {
    //           // send auth to google
    //           Navigator.of(context).pushNamed(HomePage.tag);
    //         },
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           mainAxisSize: MainAxisSize.min,
    //           children: <Widget>[
    //             // color: Colors.white,
    //             Text('Continue with Google', style: TextStyle(color: Colors.deepOrange))
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    // final googleSignInButton = Padding(
    //   padding: EdgeInsets.only(top: 8.0, bottom: 5.0),
    //   child: Row(
    //     children: <Widget>[
    //       Expanded(
    //         child: Material(
    //           borderRadius: BorderRadius.circular(10.0),
    //           shadowColor: Colors.lightBlueAccent.shade100,
    //           elevation: 5.0,
    //           child: MaterialButton(
    //             minWidth: 200.0,
    //             height: 40.0,
    //             onPressed: () {
    //               // send auth to google
    //               Navigator.of(context).pushNamed(HomePage.tag);
    //             },
    //             color: Colors.white,
    //             child: Text('Continue with Goole', style: TextStyle(color: Colors.black54)),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    final googleFBSignInButtons = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // facebook auth
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
              // google auth
              Navigator.of(context).pushNamed(HomePage.tag);
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
            title,
            SizedBox(height: 5.0),
            titleDesc,
            SizedBox(height: 32.0),
            logo,
            SizedBox(height: 100.0),
            email,
            SizedBox(height: 8.0),
            password,
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