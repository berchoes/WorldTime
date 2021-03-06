import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data :  ModalRoute.of(context).settings.arguments;
    print(data);

    //set background

    String bgImage = data["isDaytime"] ? "day2.jpg" : "night.jpg";

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/$bgImage"),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,230,0,0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data["location"],
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(height:20 ,),
              Text(
                data["time"],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 66,
                ),
              ),
              SizedBox(height: 50,),
              FlatButton.icon(
                onPressed: () async{
                  dynamic result = await Navigator.pushNamed(context, "/location");
                  setState(() {
                    data = {
                      "location": result["location"],
                      "flag": result["flag"],
                      "time": result["time"],
                      "isDaytime": result["isDaytime"]
                    };
                  });
                },
                icon: Icon(Icons.edit_location,
                  color: Colors.grey[300],
                ),
                label: Text("Change Location",
                  style: TextStyle(
                      color: Colors.grey[300]
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
