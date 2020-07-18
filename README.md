# suggestion_search_bar

A Customizable Suggestions Search Bar developed out of necessity.

## Screenshots

<table style="{border:none}">
<tr><td>
<img src="https://github.com/infiniteoverflow/suggestions_search_bar/blob/master/screenshots/1.png?raw=true" width="300"/>
</td><td>
<img src="https://github.com/infiniteoverflow/suggestions_search_bar/blob/master/screenshots/2.png?raw=true" width="300" />
</td></tr></table>

## Example

```dart
import 'package:flutter/material.dart';
import 'package:suggestion_search_bar/suggestion_search_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SearchBar(
        hintText: "Search",
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.tune),
        suggestions: [
          "String 1",
          "String 2",
          "String 3",
          "String 4"
        ],
        body: Center(child: Text("Hello World")),
      )
    );
  }
}


```

## Created and Maintained by :

[@Infiniteoverflow](https://github.com/infiniteoverflow)