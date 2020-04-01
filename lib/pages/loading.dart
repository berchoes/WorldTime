import 'dart:io';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter/material.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{

    WorldTime instance = WorldTime(location: "Istanbul", flag: "turkey.jpg", url: "Europe/Istanbul");
    await instance.getTime();
    //sleep(Duration(seconds: 2));

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDaytime": instance.isDaytime
    });
  }
  @override

  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
        body: Center(
          child: SpinKitSpinningCircle(
            color: Colors.white,
            size: 85,
          )
        ),
    );
  }

}