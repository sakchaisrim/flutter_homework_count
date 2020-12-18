import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// สร้าง Class สำหรับแยก Widget แบบ StatelessWidget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: MyHomePage(),
    );
  }
}

// สร้าง Class สำหรับแยก Widget แบบ StatefullWidget
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // กำหนด properties
  int _counter = 0;

  // สร้าง method สำหรับการเพิ่มค่าตัวเลข
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _refreshCounter() {
    setState(() {
      if (_counter>0)
        _counter = _counter - _counter ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: Text('Hello Flutter'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  print('Your press notification');
                })
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'กดปุ่มด้านล่างเพื่อเพิ่มจำนวน',
              style: TextStyle(fontSize: 24.0, color: Colors.blue),
            ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 100.0),
            )
          ],
        )),

       
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FloatingActionButton(
                onPressed: _incrementCounter,
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: _refreshCounter,
                child: Icon(Icons.refresh),
              ),
              FloatingActionButton(
                onPressed: _decrementCounter,
                child: Icon(Icons.remove),
              )
            ],
          ),
        ));
  }
}
