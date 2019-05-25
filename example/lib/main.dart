import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.white,
      child: _buildColumns(context),
    ));
  }

  Widget _buildColumns(BuildContext context) {
    return Row(
      children: <Widget>[
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: _buildColumn1(context),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildColumn1(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: (height / 5) - 40,
          width: (width / 2) - 20,
          child: Center(
            child: TouchableOpacity(
              activeOpacity: 0.2,
              child: Text(
                "Press Me",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.lightBlue,
                ),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: (height / 5) - 40,
          width: (width / 2) - 20,
          child: Center(
            child: TouchableOpacity(
              child: Container(
                height: 100,
                width: 100,
                child: FlutterLogo(
                  size: 100,
                ),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: (height / 5) - 40,
          width: (width / 2) - 20,
          child: Center(
            child: TouchableOpacity(
              child: Material(
                elevation: 16,
                color: Colors.transparent,
                shadowColor: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: Container(
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: (height / 5) - 40,
          width: (width / 2) - 20,
          child: Center(
            child: TouchableOpacity(
              child: Container(
                width: 150,
                height: 50,
                child: Center(
                  child: Text(
                    "Button",
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 24,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color: Colors.lightBlue,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: (height / 5) - 40,
          width: (width / 2) - 20,
          child: Center(
            child: TouchableOpacity(
              child: Material(
                elevation: 8,
                shadowColor: Colors.lightBlue.withOpacity(0.8),
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Container(
                  width: 150,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Button",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ];
  }
}
