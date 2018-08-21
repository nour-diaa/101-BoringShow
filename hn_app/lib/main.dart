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
      body: new ListView(
        children: _countries.map(_buildItem).toList(),
      ),
    );
  }

  Widget _buildItem(Country a) {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new ListTile(
        title: new Text(
          "${a.name} is a country in the ${a.subregion} of ${a.region}. The ${a.demonym} people speak the ${a.languages[0]} language. The national currency is the ${a.currency}.",
          style: new TextStyle(fontSize: 24.0),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(4.0),
          child: new Text(
            "Population: ${a.population} / Area: ${a.area}",
            style: new TextStyle(color: Colors.purple),
          ),
        ),
        onTap: () async {
          // defult inkwell animation exists
          print("Tapping item: ${a.name}");
          if (await canLaunch(a.flag)) {
            await launch(a.flag, forceSafariVC: false, forceWebView: false);
          } else {
            throw 'Could not launch URL: ${a.flag}';
          }
        },
      ),
    );
  }
}
