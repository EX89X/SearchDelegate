import 'dart:ffi';
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

class Test extends StatefulWidget {
  State<StatefulWidget> createState() {
    return TestState();
  }
}

class TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon:Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
        title: Text("Home Page"),
      ),
    );
  }
}

class DataSearch extends SearchDelegate {
  List names = ["essra", "asma", "arwa", "azoz"];
  @override
  List<Widget>? buildActions(BuildContext context) {
    //ترجع ليست
    return [
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            //معرفة مسبقا في السيرش كلاس
            query = "";
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //ترجع ويدجت
    //تجي قبل في البداية
    return IconButton(onPressed:(){},icon:Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("$query");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //ترجع ويدجت
    List filternames =
        names.where((element) => element.startsWith(query)).toList();
    //اذا استخدمت contains
    //حيجيب لي الأسماء الي تحتوي حرف معين
    return ListView.builder(
        itemCount: query == "" ? names.length : filternames.length,
        itemBuilder: (context, i) {
          return InkWell(
              onTap: () {
                query = query == "" ? names[i] : filternames[i];
                showResults(context);
              },
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: query == ""
                      ?Text(
                          "${names[i]}",
                          style: TextStyle(fontSize: 25),
                        )
                      : Text(
                          "${filternames[i]}",
                          style: TextStyle(fontSize: 25),
                        )));
        });
  }
}
