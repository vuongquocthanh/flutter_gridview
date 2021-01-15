import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemGridview extends StatefulWidget {
  final ItemGridviewListener listener;
  final int index;

  ItemGridview(this.listener, this.index);

  @override
  State<StatefulWidget> createState() {
    return ItemGridviewState();
  }
}

abstract class ItemGridviewListener {
  void itemClick(int index);
}

class ItemGridviewState extends State<ItemGridview> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
            onTap: () {
              widget.listener.itemClick(widget.index);
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
                      child: Text("Item ${widget.index}"),
                    )
                  ],
                ),
              ),
            )));
  }
}
