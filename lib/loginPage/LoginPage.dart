import 'package:app2/Animations/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:app2/HomePage.dart';
import 'package:app2/FakePage.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        backgroundColor: Color.fromRGBO(3, 9, 25, 1),
        body: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FadeAnimation(1.2, Text("Login", 
              style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),)),
              SizedBox(height: 30,),
              FadeAnimation(1.5, Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey[300]))
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                          hintText: "Email or Phone number"
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                          hintText: "Password"
                        ),
                      ),
                    ),
                  ],
                ),
              )),
              SizedBox(height: 40,),
              FadeAnimation(1.8, Center(
                child: ButtonTheme(
                  minWidth: 120,
                  height: 50,
                  child: RaisedButton(
                    splashColor: Colors.deepPurple,
                    elevation: 10.0,
                    onPressed: () {
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: HomePage()));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                        //color: Colors.blue[800]
                    ),
                    child: Container(
                      width: 120,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.blue[800]
                      ),
                      child: Center(
                          child: Text("Login", 
                          style: TextStyle(color: Colors.white.withOpacity(.7)),
                          ),  
                      ),
                    ),  
                  ),
                ),
              )),
              SizedBox(height: 90,),
              Container(
                child: Column(
                  children: <Widget>[
                    FadeIn(3.5, Container(
                      child: RaisedButton(
                        splashColor: Colors.lightGreen,
                        onPressed: (){
                          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: FakePage()));
                          },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: 
                         Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("G ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),),
                            
                            Text("Google login")
                          ],
                        ),
                      ),
                    )),
                    FadeIn(4, Container(
                      child: RaisedButton(
                        splashColor: Colors.deepPurple,
                        color: Colors.blue[900],
                        onPressed: (){
                          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: FakePage()));
                          },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("f ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                          
                            Text("Login by facebook")
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }

}