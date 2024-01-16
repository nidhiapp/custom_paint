
import 'package:custom_paint/custom_designs/display2.dart';
import 'package:custom_paint/enums.dart';
import 'package:flutter/material.dart';

var items = [
  Item("Triangle", "assets/images/tree.jpg", "The image is down pointed traingle",
      ClipTypes.traingle),
  Item("Arc", "assets/images/tree.jpg",
      "The bottom edge of the above edge is arc-shaped", ClipTypes.arc),
  Item(
      "Pointed Edge multiple ",
      "assets/images/tree.jpg",
      "The bottom edge of the above image is multiple pointed.",
      ClipTypes.pointed),
  Item("Rounded multiple curve", "assets/images/tree.jpg",
      "The bottom edge of the above image is multiple rounded", ClipTypes.curved),

  Item("Rounded multiple curve","assets/images/tree.jpg",
      "The bottom edge of the above image is wave", ClipTypes.waved)
];

class Item {
  final name;
  final image;
  final description;
  final clipType;

  Item(this.name, this.image, this.description, this.clipType);
}

class CardListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black12,
        child: ListView(
            children: items.map((item) => createClippedWidget(item)).toList()),
      ),
    );
  }

  Widget createClippedWidget(Item item) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(16),
      color: Colors.green
      ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Display2(
              cliptype: item.clipType,
              child: Image.asset(
                item.image,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              item.name,
              style: TextStyle(fontSize: 26, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
            child: Text(item.description, style: TextStyle(fontSize: 18, color: Colors.white70),),
          )
        ],
      ),
    );
  }
}