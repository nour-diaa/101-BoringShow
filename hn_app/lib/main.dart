import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'src/country.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // TBS: Import articles from static data (fixtures)
  List<Country> _countries = countries;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: RefreshIndicator(
        child: new ListView(
          children: _countries.map(_buildItem).toList(),
        ),
        onRefresh: _handleRefresh,
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    print("Mockup Data Change to simulate a Refresh: note setState");
    setState( (){
      print("Removing country data for: ${_countries[0].name}");
      _countries.removeAt(0);
    });

    print("Handling Refresh: 3 second delay!");
    await new Future.delayed(new Duration(seconds: 3));
  }

  Widget _buildBottomRow(Country country) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Text(
          "Flag: ",
          style: TextStyle(fontSize: 12.0),
        ),
        new IconButton(
            icon: new Icon(Icons.image),
            onPressed: () async {
              // defult inkwell animation exists
              print("Tapping item: ${country.name}");
              if (await canLaunch(country.flag)) {
                await launch(country.flag,
                    forceSafariVC: false, forceWebView: false);
              } else {
                throw 'Could not launch URL: ${country.flag}';
              }
            })
      ],
    );
  }

  Widget _buildItem(Country item) {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new ExpansionTile(
        title: new Text(
          "${item.name}, ${item.region} / ${item.subregion} subregion",
          style: new TextStyle(
            fontSize: 22.0,
            color: Colors.blueGrey,
          ),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: new Text(
                "The population of ${item.population} is distributed over a ${item.area} sq km area. The national currency is the ${item.currency}. Official language(s): ${item.languages}."),
          ),
          _buildBottomRow(item),
        ],
      ),
    );
  }
}
