import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyGridview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyGridviewState();
  }
}

class MyGridviewState extends State<MyGridview> {
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
          return Center(
              child: GestureDetector(
                  onTap: () {
                    showSnackbar("Tab at $index");
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.orangeAccent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.directions_bike),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Text("Item $index"),
                          )
                        ],
                      ),
                    ),
                  )
              ));
        }),
      ),
    );
  }

  void showSnackbar(String message) {
    var snackbar = SnackBar(
      content: Text(message),
    );
    _scaffordKey.currentState.showSnackBar(snackbar);
  }
}
