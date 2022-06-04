// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gitino/pages/web_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void searchWebview() {
    _searchController.text.isEmpty?

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Please enter a username'),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ):
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GithubWebView(
          githubUsername: _searchController.text,
        ),
      ),
    );
  }

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        FocusScope.of(context).unfocus();
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffE5DC81),
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          centerTitle: true,
          title: Text(
            'Gitino',
            style: TextStyle(
                color: Color(0xff1A237E), fontWeight: FontWeight.w800),
          ),
        ),

        backgroundColor: Color(0xff1A237E),

        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Please enter your GitHub username:',
                style: TextStyle(color: Color(0xffE5DC81)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffE5DC81), width: 2.0),
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Enter your github username',
                    labelText: 'Github Username',
                    prefixIcon: Icon(Icons.person, color: Colors.white),
                    suffixIcon: Icon(Icons.search, color: Colors.white),
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: searchWebview,
          tooltip: 'Increment',
          backgroundColor: Color(0xffE5DC81),
          child: const Icon(
            Icons.rocket,
            color: Color(0xff1A237E),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
