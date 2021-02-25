import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FakePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: 360,
              height: 650,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/16.05.9.png"),
                  fit: BoxFit.cover,
                )
              ),

            )
          ],
        ),
      ),  
    );
  }
}