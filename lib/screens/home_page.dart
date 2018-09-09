import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  int currentNav = 1;

  @override
  Widget build(BuildContext context) {

    final welcome = Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Text(
        'Welcome Daniel',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    // final lorem = Padding(
    //   padding: EdgeInsets.all(8.0),
    //   child: Text(
    //     "Common Application for Colleges and Universities in Africa \n A Blockchain Company",
    //     style: TextStyle(fontSize: 16.0, color: Colors.white),
    //   ),
    // );

    final menu = Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  new SizedBox(
                    width: 135.0,
                    height: 135.0,
                    child: Image.asset('graphics/applicationIcon.jpeg'),
                  // Text('My Applications')
                  ),
                  // Image.asset('graphics/applicationIcon.jpeg'),
                  Text('My Applications'),
                  new Container(
                height: 8.0,
              ),
                  new SizedBox(
                    width: 135.0,
                    height: 135.0,
                    child: Image.asset('graphics/checkmark.png'),
                  // Text('My Applications')
                  ),
                  // Image.asset('graphics/checkmark.png'),
                  Text('Check Status')
                ]
              ),
              new Container(
                width: 16.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  new SizedBox(
                    width: 135.0,
                    height: 135.0,
                    child: Image.asset('graphics/university.jpeg'),
                  // Text('Search Colleges')
                  ),
                  // Image.asset('graphics/applicationIcon.jpeg'),
                  Text('My Applications'),
                  new Container(
                height: 8.0,
              ),
                  new SizedBox(
                    width: 135.0,
                    height: 135.0,
                    child: Image.asset('graphics/user.png'),
                  ),
                  Text('My Profile')
                ]
              )
            ])
        ]
      )
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[
          welcome,
          SizedBox(height: 100.0),
           menu],
      ),
    );

    return Scaffold(
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          // TODO: Set State functions
          // setState(() => currentNav = index);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            title: Text('Logout'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings')
          )
        ]),
    );
  }
}