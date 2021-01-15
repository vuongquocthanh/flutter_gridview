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
        child: InkWell(
            onTap: () {
              widget.listener.itemClick(widget.index);
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: updateColor(widget.index),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top:8.0, bottom: 8.0, right: 8.0),
                      child: Icon(updateIcon(widget.index)),
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
  
  IconData updateIcon(int index){
    if(index%2==0){
      return Icons.supervised_user_circle_sharp;
    }else{
      return Icons.directions_bike;
    }
  }

  MaterialAccentColor updateColor(int index){
    if(index%2==0){
      return Colors.cyanAccent;
    }else{
      return Colors.orangeAccent;
    }
  }
}
