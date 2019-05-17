import 'package:flutter/material.dart';
import 'foundation.dart';
import 'package:flutter/cupertino.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndexValue = 0;

  @override
  Widget build(BuildContext context) {
    if (isIos) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(widget.title),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(top: 10),
                  children: <Widget>[
                    CupertinoSegmentedControl(
                      children: {
                        0: Text("Home"),
                        1: Text("Bar"),
                      },
                      groupValue: _selectedIndexValue,
                      onValueChanged: (value) {
                        setState(() => _selectedIndexValue = value);
                      },
                    ),
                
                    _selectedIndexValue == 0 ? IosFirstPage() : IosSecondPage()
                  ],
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return MaterialApp(
          home: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                widget.title,
              ),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.home),
                    text: "Home",
                  ),
                  Tab(
                    icon: Icon(Icons.local_dining),
                    text: "Bar",
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[AndroidFirstPage(), AndroidSecondPage()],
            )),
      ));
    }
  }
}

class AndroidFirstPage extends StatelessWidget {
  const AndroidFirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Text("Android $index"),
          );
        });
  }
}

class AndroidSecondPage extends StatelessWidget {
  const AndroidSecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Android 2"),
    );
  }
}

class IosFirstPage extends StatelessWidget {
  const IosFirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Ios 1 Page"),
    );
  }
}

class IosSecondPage extends StatelessWidget {
  const IosSecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 550,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 40,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Text("IOS $index"),
          );
        },
      ),
    );
  }
}
