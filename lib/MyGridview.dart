import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gridview/items/ItemGridview.dart';

class MyGridview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyGridviewState();
  }
}

class MyGridviewState extends State<MyGridview>
    implements ItemGridviewListener {
  final _scaffordKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffordKey,
      appBar: AppBar(
        title: Text("My Gridview"),
        leading: Icon(Icons.grid_view),
      ),
      body: GridView.count(
        padding: EdgeInsets.all(8.0),
        crossAxisCount: 2,
        children: List.generate(100, (index) {
          return ItemGridview(this, index);
        }),
      ),
    );
  }

  @override
  void itemClick(int index) {
    showSnackbar("Tap at $index position");
  }

  void showSnackbar(String message) {
    var snackbar = SnackBar(
      content: Text(message),
    );
    _scaffordKey.currentState.showSnackBar(snackbar);
  }
}
