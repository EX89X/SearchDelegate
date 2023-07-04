import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Test(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Text("HomePage"),
    );
  }
}

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), drawer: Drawer(), body: Center());
  }
}

class Test extends StatefulWidget {
  State<StatefulWidget> createState() {
    return TestState();
  }
}

class TestState extends State<Test> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    List user = ["essra", "Arwa", "Asma"];
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
              title: Text("Home Page"),
              actions: [
                  IconButton(icon:Icon(Icons.ac_unit),onPressed:(){
                    scaffoldKey.currentState?.openEndDrawer();
                  })
              ],
        ),
        drawerScrimColor:Colors.transparent,
        endDrawer: Drawer(
          child: Column(children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text("E"),
                ),
                accountName: Text("Essra"),
                accountEmail: Text("essraalghamdi@gmail.com")),
            ListTile(
                title: Text("Home Page"),
                leading: Icon(Icons.home),
                onTap: () {}),
            ListTile(
              title: Text("Help"),
              leading: Icon(Icons.help),
              onTap: () {},
            ),
            ListTile(
              title: Text("LogOut"),
              leading: Icon(Icons.logout),
              onTap: () {},
            ),
          ]),
        ),
        body: Center(
          child: Container(
          padding: EdgeInsets.all(3),
          child: ElevatedButton(
            onPressed: () {
              scaffoldKey.currentState?.openEndDrawer();
            },
            child: Text("open drawer"),
          ),
        )));
  }
}
